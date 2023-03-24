Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FB910E1AF
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 21:03:43 +0000 (UTC)
Date: Fri, 24 Mar 2023 13:59:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZB4PQAWZfJ4VT4R0@nvishwa1-DESK>
References: <20230324120644.19450-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230324120644.19450-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe_query: Prevent cache corruption
 on multiple access
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 01:06:44PM +0100, Zbigniew Kempczyński wrote:
>If multiple threads will enter getting the xe_device and cache is
>empty we may encounter situation all of them will try to add config
>data to the cache. As cache is resizable map and wasn't protected
>by the mutex at the moment of insertion it's possible to corrupt the
>map.
>
>Lets add protecting mutex at the moment of adding to the cache. Due
>to assertions around querying the kernel with ioctls mutex doesn't
>protect gathering the config data so some threads may do this in
>parallel. It's not a big deal though as all threads will see same
>configuration so we add first (winning) thread xe_device data.
>
>Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> lib/xe/xe_query.c | 33 +++++++++++++++++++++------------
> 1 file changed, 21 insertions(+), 12 deletions(-)
>
>diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>index 1835232804..82a7e36e30 100644
>--- a/lib/xe/xe_query.c
>+++ b/lib/xe/xe_query.c
>@@ -223,6 +223,16 @@ static struct xe_device *find_in_cache(int fd)
> 	return xe_dev;
> }
>
>+static void xe_device_free(struct xe_device *xe_dev)
>+{
>+	free(xe_dev->config);
>+	free(xe_dev->gts);
>+	free(xe_dev->hw_engines);
>+	free(xe_dev->mem_usage);
>+	free(xe_dev->vram_size);
>+	free(xe_dev);
>+}
>+
> /**
>  * xe_device_get:
>  * @fd: xe device fd
>@@ -234,7 +244,7 @@ static struct xe_device *find_in_cache(int fd)
>  */
> struct xe_device *xe_device_get(int fd)
> {
>-	struct xe_device *xe_dev;
>+	struct xe_device *xe_dev, *prev;
>
> 	xe_dev = find_in_cache(fd);
> 	if (xe_dev)
>@@ -260,21 +270,20 @@ struct xe_device *xe_device_get(int fd)
> 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
> 	xe_dev->supports_faults = xe_check_supports_faults(fd);
>
>-	igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
>+	/* We may get here from multiple threads, use first cached xe_dev */
>+	pthread_mutex_lock(&cache.cache_mutex);
>+	prev = find_in_cache_unlocked(fd);
>+	if (!prev) {
>+		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
>+	} else {
>+		xe_device_free(xe_dev);
>+		xe_dev = prev;
>+	}
>+	pthread_mutex_unlock(&cache.cache_mutex);
>
> 	return xe_dev;
> }
>
>-static void xe_device_free(struct xe_device *xe_dev)
>-{
>-	free(xe_dev->config);
>-	free(xe_dev->gts);
>-	free(xe_dev->hw_engines);
>-	free(xe_dev->mem_usage);
>-	free(xe_dev->vram_size);
>-	free(xe_dev);
>-}
>-
> static void delete_in_cache(struct igt_map_entry *entry)
> {
> 	xe_device_free((struct xe_device *)entry->data);
>-- 
>2.34.1
>

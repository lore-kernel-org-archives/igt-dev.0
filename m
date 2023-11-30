Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E31E10E701
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 14:17:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------6wEgDj3Qmu0cICnh0N48ZJ04"
Message-ID: <40c9c57d-1fde-4bf5-909f-49d8327e97f0@intel.com>
Date: Thu, 30 Nov 2023 15:10:04 +0100
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231130131850.14637-1-kamil.konieczny@linux.intel.com>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20231130131850.14637-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/drmtest: load forced module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------6wEgDj3Qmu0cICnh0N48ZJ04
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/30/2023 14:18, Kamil Konieczny wrote:
> Opening drm card may end up in loading kernel module. Take into
> account forced driver set by IGT_FORCE_DRIVER and load that one.
> If forced is in known ones, use function for loading it
> otherwise load it only when requested was DRIVER_ANY. Special
> case is VGEM which should alwayes be loaded as itself. It can
typo: s/alwayes/always
> end up in not loading any module in case when igt test requested
> specific one, for example i915 but forced is different.
>
> Cc: Rob Clark<robdclark@gmail.com>
> Cc: Rob Clark<robdclark@chromium.org>
> Cc: Helen Koike<helen.koike@collabora.com>
> Cc: Janusz Krzysztofik<janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> ---
>   lib/drmtest.c | 65 ++++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 46 insertions(+), 19 deletions(-)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index f0b97e362..b524a9eb3 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -221,6 +221,26 @@ struct _opened_device_path {
>   	struct igt_list_head link;
>   };
>   
> +static void modulename_to_chipset(const char *name, unsigned int *chip)
> +{
> +	if (!name)
> +		return;
> +
> +	for (int start = 0, end = ARRAY_SIZE(modules) - 1; start < end; ) {
> +		int mid = start + (end - start) / 2;
> +		int ret = strcmp(modules[mid].module, name);
> +
> +		if (ret < 0) {
> +			start = mid + 1;
> +		} else if (ret > 0) {
> +			end = mid;
> +		} else {
> +			*chip = modules[mid].bit;
> +			break;
> +		}
> +	}
> +}
> +
>   /*
>    * Logs path of opened device. Device path opened for the first time is logged at info level,
>    * subsequent opens (if any) are logged at debug level.
> @@ -249,7 +269,7 @@ static int open_device(const char *name, unsigned int chipset)
>   {
>   	const char *forced;
>   	char dev_name[16] = "";
> -	int chip = DRIVER_ANY;
> +	unsigned int chip = DRIVER_ANY;
>   	int fd;
>   
>   	fd = open(name, O_RDWR);
> @@ -266,18 +286,7 @@ static int open_device(const char *name, unsigned int chipset)
>   		goto err;
>   	}
>   
> -	for (int start = 0, end = ARRAY_SIZE(modules) - 1; start < end; ){
> -		int mid = start + (end - start) / 2;
> -		int ret = strcmp(modules[mid].module, dev_name);
> -		if (ret < 0) {
> -			start = mid + 1;
> -		} else if (ret > 0) {
> -			end = mid;
> -		} else {
> -			chip = modules[mid].bit;
> -			break;
> -		}
> -	}
> +	modulename_to_chipset(dev_name, &chip);
>   
>   	if ((chipset & chip) == chip) {
>   		log_opened_device_path(name);
> @@ -361,16 +370,34 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
>   void drm_load_module(unsigned int chipset)
>   {
>   	static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
> +	const char *forced = forced_driver();
> +	unsigned int chip = 0;
> +	bool want_any = chipset == DRIVER_ANY;
> +
> +	if (forced) {
> +		if (chipset == DRIVER_VGEM)
> +			chip = DRIVER_VGEM; /* ignore forced */
> +		else
> +			modulename_to_chipset(forced, &chip);
> +
> +		chipset &= chip; /* forced can be in known modules */
> +	}
>   
>   	pthread_mutex_lock(&mutex);
> -	for (const struct module *m = modules; m->module; m++) {
> -		if (chipset & m->bit) {
> -			if (m->modprobe)
> -				m->modprobe(m->module);
> -			else
> -				modprobe(m->module);
> +	if (forced && chipset == 0) {
> +		if (want_any)
> +			modprobe(forced);
> +	} else {
> +		for (const struct module *m = modules; m->module; m++) {
> +			if (chipset & m->bit) {
> +				if (m->modprobe)
> +					m->modprobe(m->module);
> +				else
> +					modprobe(m->module);
> +			}
>   		}
>   	}
> +
>   	pthread_mutex_unlock(&mutex);
>   	igt_devices_scan(true);
>   }
With typo fixed,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>
--------------6wEgDj3Qmu0cICnh0N48ZJ04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/30/2023 14:18, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231130131850.14637-1-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Opening drm card may end up in loading kernel module. Take into
account forced driver set by IGT_FORCE_DRIVER and load that one.
If forced is in known ones, use function for loading it
otherwise load it only when requested was DRIVER_ANY. Special
case is VGEM which should alwayes be loaded as itself. It can</pre>
    </blockquote>
    typo: s/alwayes/always<br>
    <blockquote type="cite" cite="mid:20231130131850.14637-1-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
end up in not loading any module in case when igt test requested
specific one, for example i915 but forced is different.

Cc: Rob Clark <a class="moz-txt-link-rfc2396E" href="mailto:robdclark@gmail.com">&lt;robdclark@gmail.com&gt;</a>
Cc: Rob Clark <a class="moz-txt-link-rfc2396E" href="mailto:robdclark@chromium.org">&lt;robdclark@chromium.org&gt;</a>
Cc: Helen Koike <a class="moz-txt-link-rfc2396E" href="mailto:helen.koike@collabora.com">&lt;helen.koike@collabora.com&gt;</a>
Cc: Janusz Krzysztofik <a class="moz-txt-link-rfc2396E" href="mailto:janusz.krzysztofik@linux.intel.com">&lt;janusz.krzysztofik@linux.intel.com&gt;</a>
Signed-off-by: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
---
 lib/drmtest.c | 65 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index f0b97e362..b524a9eb3 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -221,6 +221,26 @@ struct _opened_device_path {
 	struct igt_list_head link;
 };
 
+static void modulename_to_chipset(const char *name, unsigned int *chip)
+{
+	if (!name)
+		return;
+
+	for (int start = 0, end = ARRAY_SIZE(modules) - 1; start &lt; end; ) {
+		int mid = start + (end - start) / 2;
+		int ret = strcmp(modules[mid].module, name);
+
+		if (ret &lt; 0) {
+			start = mid + 1;
+		} else if (ret &gt; 0) {
+			end = mid;
+		} else {
+			*chip = modules[mid].bit;
+			break;
+		}
+	}
+}
+
 /*
  * Logs path of opened device. Device path opened for the first time is logged at info level,
  * subsequent opens (if any) are logged at debug level.
@@ -249,7 +269,7 @@ static int open_device(const char *name, unsigned int chipset)
 {
 	const char *forced;
 	char dev_name[16] = &quot;&quot;;
-	int chip = DRIVER_ANY;
+	unsigned int chip = DRIVER_ANY;
 	int fd;
 
 	fd = open(name, O_RDWR);
@@ -266,18 +286,7 @@ static int open_device(const char *name, unsigned int chipset)
 		goto err;
 	}
 
-	for (int start = 0, end = ARRAY_SIZE(modules) - 1; start &lt; end; ){
-		int mid = start + (end - start) / 2;
-		int ret = strcmp(modules[mid].module, dev_name);
-		if (ret &lt; 0) {
-			start = mid + 1;
-		} else if (ret &gt; 0) {
-			end = mid;
-		} else {
-			chip = modules[mid].bit;
-			break;
-		}
-	}
+	modulename_to_chipset(dev_name, &amp;chip);
 
 	if ((chipset &amp; chip) == chip) {
 		log_opened_device_path(name);
@@ -361,16 +370,34 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 void drm_load_module(unsigned int chipset)
 {
 	static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
+	const char *forced = forced_driver();
+	unsigned int chip = 0;
+	bool want_any = chipset == DRIVER_ANY;
+
+	if (forced) {
+		if (chipset == DRIVER_VGEM)
+			chip = DRIVER_VGEM; /* ignore forced */
+		else
+			modulename_to_chipset(forced, &amp;chip);
+
+		chipset &amp;= chip; /* forced can be in known modules */
+	}
 
 	pthread_mutex_lock(&amp;mutex);
-	for (const struct module *m = modules; m-&gt;module; m++) {
-		if (chipset &amp; m-&gt;bit) {
-			if (m-&gt;modprobe)
-				m-&gt;modprobe(m-&gt;module);
-			else
-				modprobe(m-&gt;module);
+	if (forced &amp;&amp; chipset == 0) {
+		if (want_any)
+			modprobe(forced);
+	} else {
+		for (const struct module *m = modules; m-&gt;module; m++) {
+			if (chipset &amp; m-&gt;bit) {
+				if (m-&gt;modprobe)
+					m-&gt;modprobe(m-&gt;module);
+				else
+					modprobe(m-&gt;module);
+			}
 		}
 	}
+
 	pthread_mutex_unlock(&amp;mutex);
 	igt_devices_scan(true);
 }</pre>
    </blockquote>
    With typo fixed,<br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;</span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------6wEgDj3Qmu0cICnh0N48ZJ04--

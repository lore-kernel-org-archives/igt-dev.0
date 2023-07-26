Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE65F10E045
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 17:57:11 +0000 (UTC)
Message-ID: <d57e1268-1da7-5440-dfeb-2ec4e1bc39d6@nvidia.com>
Date: Wed, 26 Jul 2023 10:57:07 -0700
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <2aafc4e6-0ba7-5d78-4adb-0a0368f74792@nvidia.com>
 <rOMfgyv59TFDh11y6sCRvXRsQpKuVPfkmXhk4KMtAHZNO0D6VhudiLseaz-V1uXMq7b5jjwg1NsWeEkLe4gcNzRy6ezOSOQ4TIqcYyQTYWs=@emersion.fr>
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <rOMfgyv59TFDh11y6sCRvXRsQpKuVPfkmXhk4KMtAHZNO0D6VhudiLseaz-V1uXMq7b5jjwg1NsWeEkLe4gcNzRy6ezOSOQ4TIqcYyQTYWs=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/syncobj_sync_file: new test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Austin Shafer <ashafer@nvidia.com>,
 James Jones <jajones@nvidia.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks for reviewing! responses inline...

On 7/26/23 02:43, Simon Ser wrote:
> Overall looks pretty good to me, a few comments below.
> 
> On Tuesday, July 25th, 2023 at 00:33, Erik Kurzinger <ekurzinger@nvidia.com> wrote:
> 
>> diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
>> index e6725671d..01f5f062b 100644
>> --- a/lib/igt_syncobj.h
>> +++ b/lib/igt_syncobj.h
>> @@ -34,7 +34,9 @@ int __syncobj_handle_to_fd(int fd, struct drm_syncobj_handle *args);
>>  int __syncobj_fd_to_handle(int fd, struct drm_syncobj_handle *args);
>>  int syncobj_handle_to_fd(int fd, uint32_t handle, uint32_t flags);
>>  uint32_t syncobj_fd_to_handle(int fd, int syncobj_fd, uint32_t flags);
>> +int __syncobj_import_sync_file(int fd, struct drm_syncobj_sync_file *args);
>>  void syncobj_import_sync_file(int fd, uint32_t handle, int sync_file);
>> +int __syncobj_export_sync_file(int fd, struct drm_syncobj_sync_file *args);
> 
> Hm, this is a bit confusing because the old transfer logic and the new IOCTL
> both have the same name modulo the "__" prefix. Usually IGT uses a pattern
> where the function without the "__" prefix just calls the one with the prefix
> and asserts that it succeeds. Maybe we should rename the old functions in a
> separate patch? Or find a different name for the new functions?
> 

For lack of creativity, I've affixed "v2" to the new functions to differentiate them from the old ones. I did this for both the import and export functions for symmetry's sake even though there's no "v1" export function, hopefully that's ok. Naming things is hard.

> Optional nit: maybe it would be more ergonomic if the new function took
> arguments instead of a struct drm_syncobj_sync_file. Callers wouldn't have to
> init the struct.
> 

Sure, that does make the test code a little bit cleaner. I think we still need to expose the "raw" versions, though, for the tests that check error codes.

>> +const char *test_binary_import_export_desc =
>> +	"Verifies importing and exporting a sync file with a binary syncobj.";
>> +static void
>> +test_binary_import_export(int fd)
>> +{
>> +	struct drm_syncobj_sync_file args = { 0 };
>> +	int timeline = sw_sync_timeline_create();
>> +
>> +	args.handle = syncobj_create(fd, 0);
>> +	args.fd = sw_sync_timeline_create_fence(timeline, 1);
>> +	args.point = 0;
>> +	igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
>> +	close(args.fd);
>> +	args.fd = -1;
>> +	igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
>> +
>> +	igt_assert(!syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(args.fd), 0);
>> +
>> +	sw_sync_timeline_inc(timeline, 1);
>> +	igt_assert(syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(args.fd), 1);
>> +
>> +	close(args.fd);
>> +	close(timeline);
>> +	syncobj_destroy(fd, args.handle);
>> +}
>> +
>> +const char *test_timeline_import_export_desc =
>> +	"Verifies importing and exporting sync files with a timeline syncobj.";
>> +static void
>> +test_timeline_import_export(int fd)
>> +{
>> +	struct drm_syncobj_sync_file args = { 0 };
>> +	int timeline = sw_sync_timeline_create();
>> +	int fence1, fence2;
>> +	uint64_t point1 = 1, point2 = 2;
>> +
>> +	args.handle = syncobj_create(fd, 0);
>> +	args.fd = sw_sync_timeline_create_fence(timeline, 1);
>> +	args.point = 1;
>> +	igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
>> +	close(args.fd);
>> +	args.fd = -1;
>> +	igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
>> +	fence1 = args.fd;
>> +
>> +	args.fd = sw_sync_timeline_create_fence(timeline, 2);
>> +	args.point = 2;
>> +	igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
>> +	close(args.fd);
>> +	args.fd = -1;
>> +	igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
>> +	fence2 = args.fd;
>> +
>> +	igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(fence1), 0);
>> +	igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(fence2), 0);
>> +
>> +	sw_sync_timeline_inc(timeline, 1);
>> +	igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(fence1), 1);
>> +	igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(fence2), 0);
>> +
>> +	sw_sync_timeline_inc(timeline, 1);
>> +	igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(fence1), 1);
>> +	igt_assert(syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, NULL));
>> +	igt_assert_eq(sync_fence_status(fence2), 1);
>> +
>> +	close(fence1);
>> +	close(fence2);
>> +	close(timeline);
>> +	syncobj_destroy(fd, args.handle);
>> +}
>> +
>> +const char *test_invalid_handle_import_desc =
>> +	"Verifies that importing a sync file to an invalid syncobj fails.";
>> +static void
>> +test_invalid_handle_import(int fd)
>> +{
>> +	struct drm_syncobj_sync_file args = { 0 };
>> +	int timeline = sw_sync_timeline_create();
>> +
>> +	args.handle = 0;
>> +	args.point = 0;
>> +	args.fd = sw_sync_timeline_create_fence(timeline, 1);
>> +	igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);
> 
> Shouldn't this be ENOENT?
> 

D'oh, yes it should. It looks like I fixed this after local testing but forgot to ammend the commit. Sorry.

> drm_syncobj_import_sync_file_fence() returns ENOENT when drm_syncobj_find()
> fails.
> 
>> +
>> +	close(args.fd);
>> +	close(timeline);
>> +}
>> +
>> +const char *test_invalid_handle_export_desc =
>> +	"Verifies that exporting a sync file from an invalid syncobj fails.";
>> +static void
>> +test_invalid_handle_export(int fd)
>> +{
>> +	struct drm_syncobj_sync_file args = { 0 };
>> +
>> +	args.handle = 0;
>> +	args.point = 0;
>> +	args.fd = -1;
>> +	igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);
> 
> Ditto
> 
>> +}
>> +
>> +const char *test_invalid_fd_import_desc =
>> +	"Verifies that importing an invalid sync file fails.";
>> +static void
>> +test_invalid_fd_import(int fd)
>> +{
>> +	struct drm_syncobj_sync_file args = { 0 };
>> +
>> +	args.handle = syncobj_create(fd, 0);
>> +	args.point = 0;
>> +	args.fd = -1;
>> +	igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);
>> +
>> +	syncobj_destroy(fd, args.handle);
>> +}
>> +
>> +const char *test_unsubmitted_export_desc =
>> +	"Verifies that exporting a sync file for an unsubmitted point fails.";
>> +static void
>> +test_unsubmitted_export(int fd)
>> +{
>> +	struct drm_syncobj_sync_file args = { 0 };
>> +
>> +	args.handle = syncobj_create(fd, 0);
>> +	args.point = 0;
>> +	args.fd = -1;
>> +	igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);
>> +
>> +	syncobj_destroy(fd, args.handle);
>> +}
>> +
>> +static bool has_syncobj_timeline(int fd)
>> +{
>> +	uint64_t value;
>> +	return drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE,
>> +			 &value) == 0 && value;
>> +}
>> +
>> +static bool has_syncobj_sync_file_import_export(int fd)
>> +{
>> +	struct drm_syncobj_sync_file args = { 0 };
>> +	args.handle = 0xffffffff;
> 
> 0 is guaranteed to always be an invalid drm_syncobj handle, while in theory
> 0xffffffff could be a valid one. So it's a bit safer to just leave the handle
> to zero here.
> 

Good point, fixed.

>> +	/* if sync file import/export is supported this will fail with ENOENT,
>> +	 * otherwise it will fail with EINVAL */
>> +	return __syncobj_export_sync_file(fd, &args) == -ENOENT;
>> +}

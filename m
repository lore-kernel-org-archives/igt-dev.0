Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E00D10E081
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 20:07:53 +0000 (UTC)
Date: Mon, 25 Apr 2022 13:07:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <20220425200752.GH55612@unerlige-ril-10.165.21.154>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
 <20220421145211.464313-3-priyanka.dandamudi@intel.com>
 <87a6cdekmt.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <87a6cdekmt.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] lib/igt_sysfs: Add helpers to
 iterate over GTs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org,
 krishnaiah.bommu@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 10:45:46PM -0700, Dixit, Ashutosh wrote:
>On Thu, 21 Apr 2022 07:52:07 -0700, <priyanka.dandamudi@intel.com> wrote:
>>
>> +char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen)
>> +{
>> +	struct stat st;
>> +
>> +	if (device < 0)
>> +		return NULL;
>> +
>> +	if (igt_debug_on(fstat(device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
>> +		return NULL;
>> +
>> +	snprintf(path, pathlen, "/sys/dev/char/%d:%d/gt/gt%d",
>> +		 major(st.st_rdev), minor(st.st_rdev), gt);
>> +
>> +	if (!igt_debug_on(access(path, F_OK)))
>> +		return path;
>> +	else if (!igt_debug_on(gt != 0))
>> +		return igt_sysfs_path(device, path, pathlen);
>
>I think these two igt_debug_on()'s should be removed. The issue is the
>for_each_sysfs_gt() loops below will send a gt value 1 greater than the
>actual number of gt's (at which point this function returns NULL and the
>loops exit). And then these igt_debug_on's will fire during the normal
>course of operation whereas they are meant to fire only in error. So if we
>fix this, this code becomes:
>
>> +	if (!(access(path, F_OK)))
>> +		return path;
>> +	else if (!gt)
>> +		return igt_sysfs_path(device, path, pathlen);

Agree that this should be fixed. Thanks for catching this.

Umesh
>
>The rest LGTM, so with that fixed, this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>> +#define for_each_sysfs_gt_path(i915__, path__, pathlen__) \
>> +	for (int gt__ = 0; \
>> +	     igt_sysfs_gt_path(i915__, gt__, path__, pathlen__) != NULL; \
>> +	     gt__++)
>> +
>> +#define for_each_sysfs_gt_dirfd(i915__, dirfd__, gt__) \
>> +	for (gt__ = 0; \
>> +	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
>> +	     close(dirfd__), gt__++)

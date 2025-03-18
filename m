Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98FC28B28
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 16:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603EC10E1E9;
	Tue, 18 Mar 2025 16:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4WMrkfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A2210E1E9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742315622; x=1773851622;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ydZCCChruJr86WZhd6bbeGHytsh/y/H2sXA3euQXTf4=;
 b=G4WMrkfeV0ln/jf2S5gus4ERXfR/Kmfr4GNy2RWwsd+otJuivQBuE0mf
 vBvyt1lQ0TThNktbVZJU6hF6g6KwkTGIXkip5OF44+9eI8/Maocjc1WTX
 ohRIjRrXf2Wi9AEFhkW9g35xwccS3J71OQKwHurX57iJOfbmDSIENFOhE
 ogIDK+/Ix5hjX2G8kHyEMJ2F24BuHnuMA+zcYZzd0wRFrxOuGitWvTWzR
 mRm3Yu19rsrFqVd3y+z97SFgcqurHVD1/Y4l5mOZoTg3qiPHJn1cforUh
 4IMgmnwbrrdKyHK7wnr97LWdqMMGDu+0FM472GLZc/GOXRXB8h+6OkU75 w==;
X-CSE-ConnectionGUID: YlCevL2vRIO3u2+6/cnHqQ==
X-CSE-MsgGUID: weL4BJKZTky8Un4I9BVCKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43204561"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="43204561"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 09:33:42 -0700
X-CSE-ConnectionGUID: SUY08hQeQCeZuZ7aNHwjUw==
X-CSE-MsgGUID: O+r+Xg7xSsyii1qXUeBUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="153166463"
Received: from saswiest-mobl1.ger.corp.intel.com (HELO [10.245.80.210])
 ([10.245.80.210])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 09:33:39 -0700
Message-ID: <93896d26-27f7-494a-b469-6e9f4f9e28de@linux.intel.com>
Date: Tue, 18 Mar 2025 17:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_debugfs: Add tests to read all
 debugfs and sysfs files
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250318095350.57133-1-peter.senna@linux.intel.com>
 <20250318095350.57133-2-peter.senna@linux.intel.com>
 <20250318155618.aca5jdkn62qzp3hg@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250318155618.aca5jdkn62qzp3hg@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Kamil,

Please see my comments bellow.

On 18.03.2025 16:56, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-03-18 at 10:53:50 +0100, Peter Senna Tschudin wrote:
>> The existing tests/intel/debugfs_test.c scans and reads all relevant
>> files from sysfs and debugfs, but it is specific to i915, leaving a gap
>> for Xe.
>>
>> A similar test exists for Xe in tests/intel/xe_debugfs.c, but it has two
> 
> Please do not write out full path nor test name, it is in
> subject, no need for repeating.

Will fix it.

> 
>> gaps compared to the i915 counterpart:
>>  - It lacks sysfs file testing.
>>  - It does not attempt to read all debugfs files.
>>
>> This commit addresses these gaps by adding two new tests to
>> tests/intel/xe_debugfs.c:
>>  - sysfs_read_all_entries
>>  - debugfs_read_all_entries
> 
> Both test names should have minus as separator, so s/_/-/g
> 
> - sysfs-read-all-entries
> - debugfs-read-all-entries

Will fix this one too.

> 
>>
>> Both tests use the function read_and_discard_sysfs_entries(), which was
>> copied from tests/intel/debugfs_test.c.
> 
> You also do not need to translate code from C into words,
> all this is in patch itself so imho drop this paragraph.

The actual value here is the confession that I am copying and pasting the
function from elsewhere. In the cover letter I redeem myself a bit stating
that I will move the cloned code to lib/.

> 
> Btw this looks pretty generic, maybe move all this into
> core_sysfs test?

You are correct in the sense that it is generic. What I am doing is
extending the existing test xe_debugfs in the same way the i915
counterpart works. May I ask what is your suggestion here?

In the cover letter I explain what I want to do for cleaning up the
mess a bit. The reason to send this first is to close the gap and
give us time to cleanup things properly.

I am not sure to understand what you want me to do here.

Thanks,

Peter

> 
> Regards,
> Kamil
> 
>>
>> Cc: rodrigo.vivi@intel.com
>> Cc: katarzyna.piecielska@intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  tests/intel/xe_debugfs.c | 88 +++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 87 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
>> index ec8b0d0b5..0b468c4d4 100644
>> --- a/tests/intel/xe_debugfs.c
>> +++ b/tests/intel/xe_debugfs.c
>> @@ -235,15 +235,90 @@ static int opt_handler(int option, int option_index, void *input)
>>  	return IGT_OPT_HANDLER_SUCCESS;
>>  }
>>  
>> +/**
>> + * SUBTEST: sysfs_read_all_entries
>> + * Description: Read all entries from sysfs path.
>> + *
>> + * SUBTEST: debugfs_read_all_entries
>> + * Description: Read all entries from debugfs path.
>> + */
>> +static void read_and_discard_sysfs_entries(int path_fd, int indent)
>> +{
>> +	struct dirent *dirent;
>> +	DIR *dir;
>> +	char tabs[8];
>> +	int i;
>> +
>> +	igt_assert(indent < sizeof(tabs) - 1);
>> +
>> +	for (i = 0; i < indent; i++)
>> +		tabs[i] = '\t';
>> +	tabs[i] = '\0';
>> +
>> +	dir = fdopendir(path_fd);
>> +	if (!dir)
>> +		return;
>> +
>> +	while ((dirent = readdir(dir))) {
>> +		if (!strcmp(dirent->d_name, ".") ||
>> +		    !strcmp(dirent->d_name, ".."))
>> +			continue;
>> +
>> +		if (dirent->d_type == DT_DIR) {
>> +			int sub_fd;
>> +
>> +			sub_fd = openat(path_fd, dirent->d_name,
>> +					O_RDONLY | O_DIRECTORY);
>> +			if (sub_fd < 0)
>> +				continue;
>> +
>> +			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
>> +			read_and_discard_sysfs_entries(sub_fd, indent + 1);
>> +			close(sub_fd);
>> +		} else if (dirent->d_type == DT_REG) {
>> +			char buf[512];
>> +			int sub_fd;
>> +			ssize_t ret;
>> +
>> +			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
>> +			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
>> +			igt_set_timeout(5, "reading sysfs entry");
>> +
>> +			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
>> +			if (sub_fd == -1) {
>> +				igt_debug("%sCould not open file \"%s\" with error: %m\n",
>> +					  tabs, dirent->d_name);
>> +				continue;
>> +			}
>> +
>> +			do {
>> +				ret = read(sub_fd, buf, sizeof(buf));
>> +			} while (ret == sizeof(buf));
>> +
>> +			if (ret == -1)
>> +				igt_debug("%sCould not read file \"%s\" with error: %m\n",
>> +					  tabs, dirent->d_name);
>> +
>> +			igt_reset_timeout();
>> +			close(sub_fd);
>> +		}
>> +	}
>> +	closedir(dir);
>> +}
>> +
>>  igt_main_args("", long_options, help_str, opt_handler, NULL)
>>  {
>>  	char devnode[PATH_MAX];
>>  	int fd;
>>  	int gt;
>> +	int debugfs;
>> +	int sysfs;
>>  
>>  	igt_fixture {
>>  		fd = drm_open_driver(DRIVER_XE);
>>  		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
>> +		debugfs = igt_debugfs_dir(fd);
>> +		sysfs = igt_sysfs_open(fd);
>>  	}
>>  
>>  	igt_subtest("base") {
>> @@ -263,6 +338,17 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>>  		test_forcewake(fd);
>>  	}
>>  
>> -	igt_fixture
>> +	igt_describe("Read all entries from sysfs path.");
>> +	igt_subtest("sysfs_read_all_entries")
>> +		read_and_discard_sysfs_entries(sysfs, 0);
>> +
>> +	igt_describe("Read all entries from debugfs path.");
>> +	igt_subtest("debugfs_read_all_entries")
>> +		read_and_discard_sysfs_entries(debugfs, 0);
>> +
>> +	igt_fixture {
>> +		close(sysfs);
>> +		close(debugfs);
>>  		drm_close_driver(fd);
>> +	}
>>  }
>> -- 
>> 2.34.1
>>


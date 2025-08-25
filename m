Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C684CA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 09:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1923610E362;
	Mon, 25 Aug 2025 09:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AO8l6VjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5D210E366
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756113928; x=1787649928;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lRaI/rRnLPg0aMBdrjpcfQ4l+zegWvSbCPbKUlSSsb4=;
 b=AO8l6VjNzu74V41FxeMDupf6bEDknmgf0mu6S/+mCLBmS1HFXAXg2DTc
 8lYdD2EemmoOcSDT6E8kWlGfeqfdZyEL5Ez9X0pVA9+FD0SmvnUp87Cm+
 KG+6zM5VZAkJN6yPL4Wdbv9O0XfeWFcMLm3sADmk9XjqvAeQPYd2/GgxX
 9NE0UfguvWTZjQI8lIw+NL20vN1BeWhMvStCb/SDhQVY8dLJTOQsLv5Sv
 dUFbTTsvWvIgsFuMfXXpdJtXXkMUnGOX3k6k0WNrJBsyUby4aBTEefyOO
 U0jIAebH6OMyqVj6g6dTSaMXwQdQ8exjGNzQEfU7Jfdo8z/fN8K9Q5Rkd w==;
X-CSE-ConnectionGUID: gvXJA0pKQNewNEDg3Xp5eA==
X-CSE-MsgGUID: 9/oVpZR8QAG/mLC0qFuctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58467018"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58467018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:25:28 -0700
X-CSE-ConnectionGUID: wsZZBbWIQeKgrjV9xbApdQ==
X-CSE-MsgGUID: gzhKA4awQL+IR96UsBg5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="170073915"
Received: from dkorlovs-mobl.ccr.corp.intel.com (HELO [10.245.96.41])
 ([10.245.96.41])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:25:25 -0700
Message-ID: <75973e1e-7084-4842-8e81-3e168bd2af9e@linux.intel.com>
Date: Mon, 25 Aug 2025 11:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sysfs_file_perm: Verify sysfs file
 permissions for security
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>
References: <20250813131948.573785-1-peter.senna@linux.intel.com>
 <20250822131023.6wdhox7yepwfvwzb@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250822131023.6wdhox7yepwfvwzb@kamilkon-DESK.igk.intel.com>
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

[...]

> 
>> +
>> +/**
>> + * check_files_permissions: Checks if the files in the provided list have
>> + * correct permissions. The expected permissions are:
>> + * - Owner: root
>> + * - Group: root
>> + * - Only owner can write to the file (mode 100644).
>> + * If any file does not have the expected permissions,
>> + * it will print a warning and return false.
>> + * If all files have the expected permissions,
>> + * it will return true.
>> + *
>> + * @param files_list: List of files to check
>> + *
>> + * Returns: true if all files have correct permissions, false otherwise
>> + */
>> +static bool check_files_permissions(struct igt_list_head *files_list)
>> +{
>> +	bool header = false;
>> +	struct file_node *file_node;
>> +	bool ret = true;
>> +
>> +	/* Check if owner and group are root and if only owner can
>> +	 * write to the file.
>> +	 */
>> +	igt_list_for_each_entry(file_node, files_list, link) {
>> +		if (!file_node->permissions.root_user ||
>> +		    !file_node->permissions.root_group ||
>> +		    (file_node->permissions.mode & 0022)) {
> 
> This is error prone, rather use define with mask
> and checked permissions, like:
> 
> #define VALID_PERM 0100644
> #define MASK_PERM  0777777
> 
> use:
> 	(mode & MASK_PERM) == VALID_PERM
> 
> Or use bitwise-revert:
> 	(mode & ~VALID_PERM)

I was doing something like this but checkpatch told me that using labels
was error prone and suggested the 0022 thing. There are actual labels
already defined in shared libraries but checkpatch does not like the
existing labels.

> 
> imho you should check here your special regex-es for rw ones,
> like min|max_freq, where write is allowed. Or make PERM a param
> and use it with second list.

I will kindly ask you to change the threat model, and then I will write
a test that reflects what the model says.

> 
>> +			if (!header) {
>> +				igt_warn("\n\nFiles with incorrect permissions:\n");
>> +				header = true;
>> +			}
>> +
>> +			igt_warn("\t- %s\n\t\troot_user: %s, root_group: %s, mode: %o (expected: 100644)\n",
>> +				 file_node->full_path,
>> +				 file_node->permissions.root_user ? "true" : "false",
>> +				 file_node->permissions.root_group ? "true" : "false",
>> +				 file_node->permissions.mode);
> 
> Please print which bits are unexpected here.

Can you clarify? The message already includes "(expected: 100644)".

> 
>> +			ret = false;
>> +		}
>> +	}
>> +	if (header)
>> +		igt_warn("\n");
>> +
>> +	return ret;
>> +}
>> +
>> +igt_main
>> +{
>> +	struct igt_list_head fds_list;
>> +	struct igt_list_head files_list;
>> +	struct igt_list_head pattern_list;
>> +
>> +	/**
>> +	 * Do not change the list below without checking the Xe threat
> 
> s/list/patterns/
> 
>> +	 * modeling first. You can contact peter.senna@intel.com or
>> +	 * michal.winiarski@intel.com for questions and support.
>> +	 */
>> +
>> +	/* DO NOT CHANGE START */
> 
> Why nobody cannot change this? You already stated that in
> comment above, why repeating it here?

The large paragraph is the explanation. This line here delimits where
the protected part starts and ends.

May I ask to keep this?

> 
> Please comment why we need special regexes below,
> I guess that they have different perms, so imho struct names
> should reflect this.

What do you mean? This test is a reflection of the threat model.
Everything here reflects what the threat models calls for.

> 
>> +	static const char * const gt_patterns[] = {
>> +		"ccs_mode",
>> +		"engines/[a-zA-Z0-9]+/job_timeout_ms",
>> +		"engines/[a-zA-Z0-9]+/preempt_timeout_us",
>> +		"engines/[a-zA-Z0-9]+/timeslice_duration_min",
>> +		"engines/[a-zA-Z0-9]+/timeslice_duration_max",
>> +		"engines/[a-zA-Z0-9]+/timeslice_duration_us",
> 
> Why not just filename, without 'engines' here?

To make it more specific. We are only interested in specific files.

> 
>> +		"freq0/max_freq",
>> +		"freq0/min_freq"
> 
> Same here, why not just max|min_freq?

Please see the threat model.

> 
>> +	};
>> +
>> +	static const char * const hwmon_patterns[] = {
>> +		"power[0-9]+_crit",
>> +		"curr[0-9]+_crit",
>> +		"power[0-9]+_max",
>> +		"power[0-9]+_max_interval"
>> +	};
>> +
>> +	static const char * const devices_patterns[] = {
>> +		"vram_d3cold_threshold"
>> +	};
>> +
>> +	struct dir_input dir_inputs[DIR_COUNT] = {
>> +		{ GT_DIR, gt_patterns, ARRAY_SIZE(gt_patterns) },
>> +		{ HWMON_DIR, hwmon_patterns, ARRAY_SIZE(hwmon_patterns) },
>> +		{ DEVICES_DIR, devices_patterns, ARRAY_SIZE(devices_patterns) }
>> +	};
>> +	/* DO NOT CHANGE END */
> 
> Remove this comment.

May I ask to keep it?


[...]

Thanks!

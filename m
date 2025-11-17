Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194E3CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 09:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708710E33D;
	Mon, 17 Nov 2025 09:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rue9wZ3X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA9110E32D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763371917; x=1794907917;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a8cWrvmmGtd9Ppk8+ICMTqkkE1qat4rACmnUg272Eh0=;
 b=Rue9wZ3XTELr9/H3T743VlxvbxvhCQBSovlAwqep7DKHt3y+PxckhU/P
 8xXq5HOqbE2ZXLtVwKQisvuMsXEw3kLEHR6zEBb89pLVt+vfYbHd/cuV0
 94j6F9qqpAHE4EliJ+F+CBsf5BJiAwUnk0nKGxx2gYDMNqqPDX9YkWkj1
 TbVF+w/m9SYhHMj3lwveTzcxAbJ58FHmtwxHWv5rcMCs3J8rztxCboRw9
 z4PgI9HWasEuwWKexdc4yE9XIeSfflKFR6y1QMEuirHRx1i3fVzQwPju6
 LsXOYW6o1l6HwVYeCSW1PY3O7E6goDDnfQg6NHVC2mVjbWXZw2AnoAnY9 w==;
X-CSE-ConnectionGUID: LAT93mdMQo+Cx/bUcfEUAA==
X-CSE-MsgGUID: A/13IE5IRvya1itCL9V1QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65398958"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65398958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:31:56 -0800
X-CSE-ConnectionGUID: 5Ms1dkcEQ6uT+S0DAPILoA==
X-CSE-MsgGUID: QfVr7mKdSqS8igpckRclww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="191188396"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.91])
 ([172.28.180.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:31:55 -0800
Message-ID: <7dd5427d-6252-4abd-8e6a-dae82ea72163@linux.intel.com>
Date: Mon, 17 Nov 2025 10:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] lib/xe/xe_sriov_admin: Add SR-IOV admin sysfs
 accessors
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
 <20251114190757.2295174-4-marcin.bernatowicz@linux.intel.com>
 <87cf5659-2bc5-4674-b027-1539c2928954@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <87cf5659-2bc5-4674-b027-1539c2928954@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 11/14/2025 8:53 PM, Michal Wajdeczko wrote:
>
> On 11/14/2025 8:07 PM, Marcin Bernatowicz wrote:
>> Reflect recent kernel changes and expose SR-IOV admin sysfs helpers for
>> scheduling control. Add per-VF and bulk accessors for execution quantum,
>> preemption timeout, scheduling priority, VF stop and restoring defaults.
>>
>> Link: https://lore.kernel.org/intel-xe/20251030222348.186658-1-michal.wajdeczko@intel.com/
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
> ...
>
>> +
>> +/* Parse a raw sched_priority line into current priority enum (required) and optional mask.
>> + * Behavior:
>> + *  - If prio_mask == NULL: validate only the bracketed (current) priority; ignore unknown others.
>> + *  - If prio_mask != NULL: validate all priorities; unknown priority causes -EOPNOTSUPP.
>> + * Returns 0 on success, -EOPNOTSUPP on semantic issues, or other -errno from callers.
>> + */
>> +static int parse_sched_prio_line(const char *line,
>> +				 enum xe_sriov_sched_priority *cur_prio,
>> +				 unsigned int *prio_mask)
> the idea behind
>
> 	"When read, this file will display the current and available
> 	scheduling priorities. The currently active priority level will
> 	be enclosed in square brackets"
>
> was that in the future we might want to add new priorities or the
> list of supported priorities will change based on the platform or
> firmware capability
>
> so you should start by adding a function that just looks for the item
> "enclosed in square brackets" and return it, and/or other function
> that will return list of all parsed items and the pointer to the
> selected item
>
> then in other function you can try to match returned string to your
> priority enum and decide whether you support that priority
> or just rely on the returned string everywhere
Thanks, makes sense.

I'll split this into two parts:

- Bare token parser – returns all strings + the bracketed one, no enum
   mapping, tolerant to unknown priorities. This will be used for ABI/format
   checks and to handle future FW/platform extensions.

- Strict helper on top – map known strings to our enum, build the mask, and
   return -EOPNOTSUPP when the current token or any masked token is unknown.
   This matches the existing enum-based helpers used by tests that need to
   understand LOW/NORMAL/HIGH semantics.

This should give us a future-proof parser while keeping the current strict
behaviour where tests depend on it.

>
>> +{
>> +	enum xe_sriov_sched_priority e;
>> +	const char *p = line, *start;
>> +	unsigned int mask = 0;
>> +	bool bracketed, have_cur = false;
>> +	char tok[16];
>> +	size_t len;
>> +
>> +	igt_assert(line && cur_prio);
>> +
>> +	while (*p) {
>> +		while (*p == ' ' || *p == '\t')
>> +			p++;
>> +		if (!*p)
>> +			break;
>> +
>> +		bracketed = (*p == '[');
>> +		start = p + (bracketed ? 1 : 0);
>> +
>> +		if (bracketed) {
>> +			while (*p && *p != ']')
>> +				p++;
>> +		} else {
>> +			while (*p && *p != ' ' && *p != '\t')
>> +				p++;
>> +		}
>> +
>> +		/* token bounds: [start, p) */
>> +		len = (size_t)(p - start);
>> +		if (len >= sizeof(tok))
>> +			len = sizeof(tok) - 1;
>> +		memcpy(tok, start, len);
>> +		tok[len] = '\0';
>> +
>> +		/* map token -> enum */
>> +		if (!xe_sriov_sched_priority_from_string(tok, &e)) {
>> +			if (e == XE_SRIOV_SCHED_PRIORITY_LOW)
>> +				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_LOW;
>> +			else if (e == XE_SRIOV_SCHED_PRIORITY_NORMAL)
>> +				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL;
>> +			else if (e == XE_SRIOV_SCHED_PRIORITY_HIGH)
>> +				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_HIGH;
>> +
>> +			if (bracketed) {
>> +				*cur_prio = e;
>> +				have_cur = true;
>> +			}
>> +		} else {
>> +			if (bracketed) {
>> +				igt_debug("unknown current scheduling priority '%s' (line='%s')\n",
>> +					  tok, line);
>> +				return -EOPNOTSUPP;
>> +			}
>> +
>> +			if (prio_mask) {
>> +				igt_debug("unknown scheduling priority '%s' (line='%s')\n",
>> +					  tok, line);
>> +				return -EOPNOTSUPP;
>> +			}
>> +
>> +			igt_debug("ignoring unknown scheduling priority '%s' (line='%s')\n",
>> +				  tok, line);
>> +		}
>> +
>> +		if (*p)
>> +			p++; /* skip ']' or the delimiter */
>> +	}
>> +
>> +	if (!have_cur)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (prio_mask)
>> +		*prio_mask = mask;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * __xe_sriov_profile_get_sched_priority - Read VF scheduling priority + mask
>> + * @pf_fd:     PF device file descriptor.
>> + * @vf_num:    VF index (0 for PF, >0 for VFs).
>> + * @prio:      Output pointer for the effective priority.
>> + * @prio_mask: Output mask of allowed priorities.
>> + *
>> + * Returns: 0 on success or negative errno on error.
>> + */
>> +int __xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
>> +					  enum xe_sriov_sched_priority *cur_prio,
>> +					  unsigned int *prio_mask)
>> +{
>> +	char path[PATH_MAX];
>> +	char line[256] = { 0 };
>> +	int sysfs, ret;
>> +
>> +	igt_assert(cur_prio);
>> +
>> +	sysfs = igt_sysfs_open(pf_fd);
>> +	if (sysfs < 0)
>> +		return sysfs;
>> +
>> +	fmt_profile_rel_path(path, sizeof(path), vf_num,
>> +			     "profile/sched_priority");
>> +	ret = igt_sysfs_scanf(sysfs, path, "%255[^\n]", line);
>> +	close(sysfs);
>> +
>> +	ret = ret_from_scanf_items(ret, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = parse_sched_prio_line(line, cur_prio, prio_mask);
>> +	if (ret)
>> +		igt_debug("sched prio: parse/map failed (err=%d), line='%s'\n",
>> +			  ret, line);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_sriov_profile_get_sched_priority - Assert wrapper for reading VF priority
>> + * @pf_fd:     PF device file descriptor.
>> + * @vf_num:    VF index (0 for PF, >0 for VFs).
>> + * @prio_mask: Output mask of supported priorities.
>> + *
>> + * Returns: effective priority; asserts on error.
>> + */
>> +enum xe_sriov_sched_priority
>> +xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
>> +				    unsigned int *prio_mask)
>> +{
>> +	enum xe_sriov_sched_priority cur_prio;
>> +
>> +	igt_assert_eq(0,
>> +		      __xe_sriov_profile_get_sched_priority(pf_fd, vf_num, &cur_prio, prio_mask));
>> +
>> +	return cur_prio;
>> +}
>> +

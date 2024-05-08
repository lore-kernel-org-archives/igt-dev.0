Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A8DC19F4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 16:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB459112854;
	Wed,  8 May 2024 16:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqBuWsmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE071112854
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715185499; x=1746721499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KAGr8JtJPhXgzN/iEmH1wETh2SJ3WaJbj4c4LxAyS8U=;
 b=CqBuWsmZ68dGjTNJEmgcmPALai+Cy/gV9Ckk2fHPwSAlDRVu2oZ3nikC
 ezMJqRGgTnTWoW/O9XIb1O/HRreeYDWdb3jGjDJsn2tzuTxv6bfEnNsRv
 l2vS7nw9O1wxPktZMwFF4sgPfBUjM/I1YfnInljcUTPcnJgMSWaWhFKVi
 yxE+BZ5PLrpGjUSNnKDQKOc8Yr9pj8ftr7zUNp/oga6OEp58LKk81n3PC
 +tqogs2Fu+5283g+5pqevBN6dlwD2bdDOqgBFJs2LnrVvWiEeHAFUihO/
 s6OyXuRtrAthQgFZsymAo9rS0fx4TMdN3Rz4iDdXSHqRp839XkqTgZ7Xj A==;
X-CSE-ConnectionGUID: N3VUzfrhSQOK+VTPWvfebg==
X-CSE-MsgGUID: MOmhqCMSRjqdf7F1EjrdIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11188735"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11188735"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 09:24:58 -0700
X-CSE-ConnectionGUID: g+K1NLC/Q72fUTdi9Gpvnw==
X-CSE-MsgGUID: Hbi0//3TTE2Og/8dpHHqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29324743"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 09:24:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: (subset) [PATCH i-g-t v3 00/12] gputop: Add support for xe
Date: Wed,  8 May 2024 09:25:50 -0700
Message-ID: <171518515899.467609.17470617011969712617.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504064643.25863-1-lucas.demarchi@intel.com>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Fri, 03 May 2024 23:46:30 -0700, Lucas De Marchi wrote:
> v3 of https://lore.kernel.org/all/20240423234431.1959354-1-lucas.demarchi@intel.com
> 
> I moved some gputop eye candy to a separate series:
> https://lore.kernel.org/all/20240501173303.115737-1-lucas.demarchi@intel.com
> 
> This now also moves all the refactors to come as prep patches. The
> drm-total-cycles addition is  in the last 3 patches.
> 
> [...]

Thanks Tvrtko and Umesh for reviews. I applied the first patches 7 patches
after double checking CI results.

[01/13] lib/igt_drm_fdinfo: Extract ignore_space()
        commit: bab6f1688c844a2b6503a962c0e4ab6f6336339f
[02/13] lib/igt_drm_fdinfo: Allow any number of spaces before unit
        commit: 1e47a01ba9553a4e9c7fec1b374f6daa627f4771
[03/13] fixup! lib/igt_drm_fdinfo: Allow any number of spaces before unit
        (no commit info)

	^ this was squashed in patch 2, as it should had been before submitting.

[04/13] lib/igt_drm_fdinfo: Stop passing key twice
        commit: f5ff62103ec67dd232aecba613ec4211f2dcd98e
[05/13] lib/igt_drm_fdinfo: Remove prefix arg from parse functions
        commit: 01c1ddba269b6a1f8e96b4a504e81fbb2fcc9dde
[06/13] lib/igt_drm_fdinfo: Parse drm-cycles
        commit: 55281583000fae8d359ee985b168e59f614651f5

	^ additional whitespace removed

[07/13] lib/igt_drm_fdinfo: Start tracking available engine keys
        commit: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

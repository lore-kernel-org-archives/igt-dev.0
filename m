Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A79FC624A4
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 12:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D9610E7E1;
	Mon, 31 Aug 2026 12:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzaeqK+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9999810E4CC
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788179589; x=1819715589;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eCs+zzu+UtxizanapqgSt/ou6D49AIJiVavWK4hTIds=;
 b=WzaeqK+eXQNIv87osOXe9ZHqlWot7f3CxsOJWPVC87gh/s48NfAxb3DI
 oUnGyt1TT0vQWOTqJWojsBx/Ap/nvptcU3u7mgKzu4cPrgBxlgrtkv/Dd
 +49CSct0r22rYyPyflb7fcP0uqZ6Gr26dJJDZuA/hjXJAjsLiIW+qSwxF
 5eTtfK8HMbEp10lMTjyyVMbUhr1pJ/5ZIGGCILL7lDl6d0vdhDan6s6Bn
 KV3vXP6ZJ2GNDYTtM1Ro0DF72dMDOoeqEzHJMIMAmT++0TTtaGpA3z0UF
 vDkZgZq7SUT4Bqpcrhweno6gj3+BCwQV727n2OAEgaVYYuKqswolXb9e8 w==;
X-CSE-ConnectionGUID: XbETMHe8RiCxmZhZf6oIOA==
X-CSE-MsgGUID: Pm7jOC75S0qgWJJ4HrWGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99746019"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="99746019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:33:08 -0700
X-CSE-ConnectionGUID: sMDLZbjwTNuhDLLgGlhwJw==
X-CSE-MsgGUID: 68MSAnk3Rci83DVeriyLgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265544508"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:33:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
In-Reply-To: <19d17250-946f-46dc-a640-44ed08aa6dde@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-4-ravi.kishore.koppuravuri@intel.com>
 <c9b431c59949a9499d79e166886413591de113e4@intel.com>
 <19d17250-946f-46dc-a640-44ed08aa6dde@intel.com>
Date: Mon, 31 Aug 2026 15:33:03 +0300
Message-ID: <a5e6c6f48cca679ef182b533cfd33079e20f5522@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 31 Aug 2026, "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com> wrote:
> On 31-08-2026 14:16, Jani Nikula wrote:
>> On Mon, 24 Aug 2026, Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com> wrote:
>>> +struct app_context {
>> Why doesn't the name indicate netlink in any way?z
> I am using this structure to maintain the context of request received 
> for the library functions and responses received from netlink functions. 
> So I have not included netlink or nl for this structure name.

"struct app_context" in code seems too generic. If you see that alone,
you have no idea what it's related to.

I don't know, I guess I would've named it struct
igt_drm_netlink_<something>.

>>
>>> +	struct nl_sock *sock;
>>> +	int family_id;
>>> +};
>>> +
>>> +void igt_cleanup_nl_socket(struct app_context *ctx);
>>> +int igt_init_nl_socket(struct app_context *ctx);
>> IMO "nl" is the wrong place to abbreviate.
> libnl is the user space library used to communicate with DRM netlink 
> socket in the kernel. All libnl API references have the word "nl" for 
> netlink. So, I have followed the same in my library functions as well. 
> Could you pls elaborate your suggestion, if am missing anything here.

I guess I would've named them igt_drm_netlink_{init,cleanup}().


BR,
Jani.


-- 
Jani Nikula, Intel

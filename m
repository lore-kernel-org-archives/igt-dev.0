Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6030C369BD
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 03:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D7510E0D6;
	Thu, 17 Apr 2025 03:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVU0xn/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D0210E0D6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 03:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744861109; x=1776397109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mFfvfmXrGB/Uy26v2/DTFeAun4taO0sMnTf/7Ztiq+k=;
 b=SVU0xn/VHGb0UPqOiYxU+aYraewilmbss2S2GO2asg0Fzgw5BlU9frBm
 2dZNYVjaU66Qkju+JilFLLEqHOgFMFXcCsL98E+ywXMwvRDZTi9+nijmH
 YO07x4EBAAQjS7+gKFwJrclxxHy7aAPtuMGdLali1B7nhehyl1HgoDaKC
 glgpKFMq+GlFNBHPh/ijaxl61Qx0uphn9pgBXsMT4x8rh5uw9rk95Bwc8
 /bWif8t5Uny1swdT6v+iwRab76lRbLUQm0YPYyU5Vuff3Nt1XLaAA/cMT
 gJjp3w6tTGPI1GofiNpQuUk1FGX9WnL70+MoItgIndfV8oqHw9NHew0xr Q==;
X-CSE-ConnectionGUID: PHGORZOkRXOB94LC+iaRRw==
X-CSE-MsgGUID: ySu+hOegT1+oU2v6ii2FTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63969587"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="63969587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 20:38:28 -0700
X-CSE-ConnectionGUID: 0eHbD/woQWqvsP22+uztlw==
X-CSE-MsgGUID: QPVOhw2PQW6kEjaJ2lgkDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131210595"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 20:38:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 20:38:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 20:38:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 20:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQZuymu36xYeFK1r8oN9xezl9FX2n+efdM33jG+iT0xCuBQhvfgiJljIWe1EcMPT0B7fw5TUzdttsVgO7LbkrGKg/TMvlc1Hq42u/YJxTN6cv38eg8xYqHzAbYnD5xecaLLh+yb4qBtStqVYglmx6pIMcGpt3vEruxoD03IIoVthZZtP0artVTsfwE+MxPSgjvuyS6jbK+xQ/I3IpIwwJYEo1EgArfBPo2gGDItEqJpAQz9U3sz1SFo0QnZ74GPppFDYMN1ReXzs6FPwkSHF4We5q8QRkQzFB92aFfLQVcYeglqw5vl842ZVTVjNYQ90cC1TUo4RsZFD8CcQIjwdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx1E8vVeI1tGVgtGTj/+m4CwMJkjL+QMvsK3OT1HYOY=;
 b=WhAboGNAgjdTUvLqHYph6RBh6BBhb9lRKnd/IKax79Mb0ZC7l2mTxZ9mkbvaHi9aeBZCvUsIzZElrtTmJCPaP3/AL2fdHshV/4IfAqT4PIfcZ9MhTmSgZkjQiVqZEmJhqcQMtkaQVQ5QKGYlyWlgRFgr+JIY+DGjzzxFT3FyqmBzF6XL8yQpYFY4ZBSRaz0TQ3KqcjfvKuoJjmyskwxb/xMQPdLpJFkEB20WUHCZS2GU5lJLSd5ycs4Ju2KOXQjRiViEPO90XFoG55dv3XRTNL4e04Wc3eE+0s0E6yMoaHXNZpoA18wntg0JjZjt34bGgiSuUShTPlrXeCAdWbPZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 03:38:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 03:38:25 +0000
Date: Wed, 16 Apr 2025 22:38:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t 07/10] lib/igt_kmod: Add rebind abstraction
Message-ID: <pmdrtiwyqlf5eotccp7gowfnqwiqjafbbjmiz2ab24sohbq32r@lpe6s4b7xqdg>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-7-84b1ad0b8075@intel.com>
 <c10278d3-24a6-4961-99a7-d94c4e1a18c3@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <c10278d3-24a6-4961-99a7-d94c4e1a18c3@intel.com>
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bf23e6-5cab-4e95-035e-08dd7d614f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aAG08DkueZxGPx/6PWdomEqK2Mg2uE8TNeznWz3nSLhcPi7unkqa3I1toK5u?=
 =?us-ascii?Q?y2Oy/n57SedhCbiY8c3CdvU8/H8SbIq4wjnvU9Hwrpf//ktOvvtwW+srYl2o?=
 =?us-ascii?Q?XQ6byPaPGX0MvnYOziCGmpBIWwNPIxSkiXa6SSv/1XaXTssjJyQ+2Wwd4nV2?=
 =?us-ascii?Q?BecD9J7E95Snnth4NpWr7RaXaE6dDevemQcxeSYd9Uf6DbcJUFVFBkKPvtJO?=
 =?us-ascii?Q?G/QIT9a8G3hijbLB8LW3tN/ZDz+Fs8sAcs8r/QOpe9a4iINX5N0evPcwrq7c?=
 =?us-ascii?Q?Jw9zlqK7sQ1YD6ckafo7Wwiru9Ax3hsZ3fJjkZ1ixpPZaORYflSndLxF1ebC?=
 =?us-ascii?Q?hKq7JmqHNU+RCD1gYR04D91WZ4PsKKfrJ+dsoitSBtG02GqVZzij6EZEswFw?=
 =?us-ascii?Q?TqmrgIR5RLk5qgCOR089SrXF/bP/97m/u75Ur+rVioEmOKjMMdN71X3XrfI8?=
 =?us-ascii?Q?FA8zg2xeGqRmgjWTNvCdBMK6fVVPjc6d+ZS0oTcFsxLvtIdtJqGIGTlimFI6?=
 =?us-ascii?Q?xUD3ku6co3hvQyiW8QftDbb6Gm9bPFeAzfFXAfElS/qA5ichjOLw5BSJlDN6?=
 =?us-ascii?Q?ZvMV7z71G96xoR0NgsJN+yHc5J1J6+Lh9Jbsh/RJJR6g/hQ8sS9LXup9YpPg?=
 =?us-ascii?Q?HOHOZnfarPc0PJHCw1jLpzucGBKyujLl82abWSVpmBLIA7FbK0qar+XkM+Uj?=
 =?us-ascii?Q?Iw8jRwH7+G5C2Nt1Rb1draC7nwWaAikVMCy52YKjb949icCSbdUIMngRni5o?=
 =?us-ascii?Q?cgr3Koq24vWpj/5pPmRJuLJPBMsrVnCqlYNifELqw/okTLwFxfAjqJI8FFUz?=
 =?us-ascii?Q?9pXq/9wkFGYhy+b7EzdoD1CUW7BmzFXM7hfbQlfJa0AWqACorKtFtXFm0h3x?=
 =?us-ascii?Q?Ty3kGsI6zJIChObTzbhMcH/4M7mqCYDhjbV6A4m/kMHhzYLdPQFW/T13XIHw?=
 =?us-ascii?Q?UxP0RHgMNCNf9FueyVG5PTqa0VPTJKCEe3X3w92FwqyT+EuhvLekLPzNSAtT?=
 =?us-ascii?Q?ecVQV1mt+7HlKwQL/7LLiKlVxo+sIviY26PC1VFlzGAiKHEa7Mb3rPfQTd5G?=
 =?us-ascii?Q?QjMFoRqG52Ucl92Lc4cB7su6YazAJUKJBbqUXRUZI6+zS6e2cM77CziAZHzO?=
 =?us-ascii?Q?Acyz7AV6nrWA04Mk93K8N0o7gRmZ1ykEUNLu0uLOKUMF835ADmqLFHQSHRga?=
 =?us-ascii?Q?Mb/k6sC2OO/284A0vZwuiY8eBeIqnWMVWvtwgRgUfbJB4SAchrgqAS3Z/z9j?=
 =?us-ascii?Q?8hga7SVFM+Kby0xw2kTX9P72KljTXZi7vpcU2BFMX4fnX1QLdZOvgVqzmBx+?=
 =?us-ascii?Q?owPMnl2TNekgoRrUSf+6RimQEkk2Z9ZWdJVS4W/Xz0jG/2uBdfovDDg+7MtX?=
 =?us-ascii?Q?fRkZ2KWtVEg7iEFKYh6LhtEkF2cuGNID3TW3crsVqGgPg17C+nRNzd0lr+GZ?=
 =?us-ascii?Q?aA3xcO5zXsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z+66T4XMxxW0+zv1H+jYzM2NG2zrIVmWXSiAR9W2H2RoIFFCtNBsS+AQGuPw?=
 =?us-ascii?Q?6sPsPnlwOawF2LQKt0Vdh1a373x9DfhZVq/Y+iu33gIml7DRldWW38JhwKMr?=
 =?us-ascii?Q?kh1WcntUpZripBtdfz5d0qMYHOvTapA84uBqtgiIXkkbTxGxctuzjgXJ5KiM?=
 =?us-ascii?Q?pe7ON1FrqPGHUJk0DodrKO4yikvMP6h0/GFfjZkaxu2f9Q17d8rXwKHCJMWv?=
 =?us-ascii?Q?you9rKnGIClmCcIZRd44qV37ThixNo/T/LoSJ5Ce4HR5SmZUcENvJ/GM4Yqy?=
 =?us-ascii?Q?9KDg61S145+cjloiqKyDUDhftgBqYZlxNvNTO3Hkm3SA/oHMNgoIiYs9UVcF?=
 =?us-ascii?Q?uVO8uCjeqigkAV8ZGRwcwOEwyvPA6MbcvGROzWXcVxLwSoQMh1oU5j0Pt0Jq?=
 =?us-ascii?Q?DdaoWlDUe7ndmUPcwvQ5bYiJoj8wK5UJ+mTRvVmCwgel4/4IwEvkvKSe2aLU?=
 =?us-ascii?Q?x/3RQ2gi1RDRt0NZggXwM4FF2nVPjmBwo4/Z9us5dIiRh79eJbvBECKYGhCE?=
 =?us-ascii?Q?B8F1pLZEHp26GNa/yU/xeoqIO+dkx6dOZXU51xK2cxnDVJVzeNJmrXDgJ/oV?=
 =?us-ascii?Q?nr5bRntTsf9eKTTBcvIRfr31/6VAAK3wEKlPd2+lrabzrs9o7aPpRk2I+tCy?=
 =?us-ascii?Q?qlncIQsn9jgVhZhXodhTSkzsIPOHo1SDCGCbHLN1wu7BK4TKuKu70tn1gJqy?=
 =?us-ascii?Q?csrFs4RzNkxQUMqnGc0MoWNyq4ph5pn9F1iirdI9f7+s/kUeZYifAV6qN2O7?=
 =?us-ascii?Q?biiorIxOKBRQn8Xj/FJlfWEuZ/X/cmAao3OI6bsKvk9MFAmm/zePlSXCf1l6?=
 =?us-ascii?Q?1Tz3WIwONHp0oJGAHnS68kjBGIuBXFSTRwa5PVDA/SLZcJgIJeg8t0rKqLOZ?=
 =?us-ascii?Q?wOM1+s0Fc15KqkL8V32/2KH3Od7DqNea4XleUQyWtFbSRfbcBdEg/Q5R+Y/M?=
 =?us-ascii?Q?8wBFlJyVqjZYC4y0nJGk/+NcOdVl6kZ2YNaE4WqnzFIo+PleF6jkO+nRFciz?=
 =?us-ascii?Q?lDRQfm2TefTBwUdOYs0cNQMdKBbqEfST6wEbBzT4oqCgzl/NASQTABR/5OWl?=
 =?us-ascii?Q?iZqTsW1jPYJMrEyDtgUchBqRt5Q9aSK0NwZ8aPwt0fC7JNNuNpU3vchpZWn3?=
 =?us-ascii?Q?nEYOpWRUiNfhMAto/qY8hyOq/fxjsjhTlnkJIW2NfNaHFFuSveJ5F7cLeXZB?=
 =?us-ascii?Q?6nqv0cw8/8F7NpJq/prn5y08ifkLGlaOPRJ3MR8psudzsWMpw9xrhOTYP8if?=
 =?us-ascii?Q?wjPXE83Wp3hERlCZnxttqHIiTZ29pvbKQUC266Y/hml0Fd6BvqBNPV/Qj9wq?=
 =?us-ascii?Q?L6XducJHJx+O09s+Htluvxs39KUTzauPoHRbwmNnDre6xnvdDo+ZQOW1QKK9?=
 =?us-ascii?Q?JVhjgCgYNVPEtOT50juExLH92QghxmQJEpWEpg6bQEys3BmicXSmjxxcS8cg?=
 =?us-ascii?Q?xOBnkUZwii+EmYZjYEGWfYAO4TPOwIHqLe/chnJ3dPdHftCA4PlAvryh6PGo?=
 =?us-ascii?Q?+r9JispaP/k2Pu4sW2W64oOiRVaitBZH5ju9G0/43nBZp9DHqn/3k9dOQemQ?=
 =?us-ascii?Q?TVRNg+YrDXKoY2bY53zMoM410GPoIF5vgLDIg3tuIbHqhmJaNdkY6DGD+Q6f?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bf23e6-5cab-4e95-035e-08dd7d614f2b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 03:38:25.7893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohKaHKos3JxxmdpqZ/Gns3By6gEGYmWc/hHK0KB0e9GyJSsypPlhP4jLJUFzvbnD513aWwiX0Gn+geQozWPvEDnuI5gB+5vbljjEiuYkHu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
X-OriginatorOrg: intel.com
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

On Tue, Apr 15, 2025 at 11:19:48AM +0530, Riana Tauro wrote:
>Hi Lucas
>
>On 4/11/2025 4:18 AM, Lucas De Marchi wrote:
>>Abstract the "set one file in the drivers dir" and share the
>>implementation with unbind/rebind.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  lib/igt_kmod.c | 11 +++++++++++
>>  lib/igt_kmod.h |  2 ++
>>  2 files changed, 13 insertions(+)
>>
>>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>index 14b6b957a..6d7f5705c 100644
>>--- a/lib/igt_kmod.c
>>+++ b/lib/igt_kmod.c
>>@@ -665,6 +665,17 @@ int igt_kmod_bind(const char *mod_name, const char *pci_device)
>>  	return ret;
>>  }
>>+/**
>>+ * igt_kmod_rebind: Unbind driver from devices and bind it again
>>+ * @mod_name: name of the module to rebind
>>+ * @pci_device: device to rebind to
>>+ */
>>+int igt_kmod_rebind(const char *mod_name, const char *pci_device)
>Why not have a void function? Not using the return value anywhere
>Also unbind always returns 0 and asserts for errors

as a lib, we should rather return int and let the caller know when to
assert, which belongs to the test. Migrating the assert to the caller is
left for later.

Lucas De Marchi

>
>Thanks
>Riana> +{
>>+	return igt_kmod_unbind(mod_name, pci_device) ||
>>+		igt_kmod_bind(mod_name, pci_device);
>>+}
>>+
>>  /**
>>   * igt_intel_driver_unload:
>>   *
>>diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>>index e3a4ce671..905070897 100644
>>--- a/lib/igt_kmod.h
>>+++ b/lib/igt_kmod.h
>>@@ -39,6 +39,8 @@ int igt_kmod_unload(const char *mod_name);
>>  int igt_kmod_unbind(const char *mod_name, const char *pci_device);
>>  __attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
>>  					   const char *pci_device);
>>+__attribute__((nonnull)) int igt_kmod_rebind(const char *mod_name,
>>+					     const char *pci_device);
>>  int igt_audio_driver_unload(char **whom);
>>
>

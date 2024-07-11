Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D9AC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 20:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA3410E061;
	Thu, 11 Jul 2024 20:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q73K/1nS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5675B10E061
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720730185; x=1752266185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j/W8GsmlzgnZendd1HDxJn+k8W+KBD3pRQ/ZBpWU9N8=;
 b=Q73K/1nSJmCTOMTE5Cft3B+Hf1o/zv2areEFaQQKlwVgQuh5Khie8kn2
 PECtprswUAo4F+I1Tln6FNgc4XUU9urO6BmScysssXRSNRjj/akKd64xg
 iIXzZJI6oaCUoUjdhq7c5bodgD4wS4UD/ak0rVXutb435j6qiaMCUOgBL
 Vsi/oOyc/OAqXQq2usp8F50JnIgLIbvP2jgVZPsRJwJo72IeWnvafL5sl
 bstd5Irn/iXvjF746XyQsGN/OaOgcLZ4MPr3XpK0sQ1jUv+GD+XOP5Dfb
 aBnCCZbfFaoM0DlPZs79cd/H9qAQD6ocGRufefg/k1PfJENJTHcFVXj0I w==;
X-CSE-ConnectionGUID: RIBzuZ6nQsibdhnM8ehs2w==
X-CSE-MsgGUID: zqCd6+c2SvKYVtSo+pvmiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18283069"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18283069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:36:24 -0700
X-CSE-ConnectionGUID: qqMv7u5lRBqKD5TbtDIQhQ==
X-CSE-MsgGUID: 6khMZnhGSjibydDiz6D8xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48566487"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 13:36:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:36:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 13:36:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 13:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TD20Cm0fwKrLw/PVFW7A+59E000qtq5SMhWj6b0qo0LPHwwjGUD1/OuFsdBT5B+HukVsIKlFVRagwJC73XSHpw0OjaT/lT+xLCfcwwDwKSZnCEL1D8A12RE/ox9HQx2AC5HwUrodCfXKupTB4QZUk/kAXsdOAqEpFQvjGMdxAXLZkBUqGW01wb7wYRxHdwBAvTYok8l/GiXLJ0mIHA9OFWFC1MFPk2ey0+CxmL+4+h0i5DRWIeqgknGVAGsGQi6F5Rzv0Ds1WYTJG/Ar0hpJciqV+rHUJXpWJMxzQ2IetZI2HlxIjSHoE08wEhuFHS3aOy9H8xgQO40Jzpms84Siww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/G3HgTF603Y6ql2E5A4fSsrZfNzM//9oYy/mEwtZxE=;
 b=Saz6tkIrefGi4/DaBSzGaSEecs1J5bpUpUAUl7uYCrjT82Sw1W5arQTChHOsZ1dM+aRhJ/tUD7aJUr3SrW7WN+OF6yKgjMzsSKbKqyCe8B+JRcdfdqUXERFOiczuXEE8QJYJuGL4wCyJnIfhGFX8quFkMC50jYnSyx0hOLSa63QbAs60l7BA1HV9WQAFl13u/q4HHg3SY1TSRy7wG/LDSN4IueEpZJ9FlTwOBxYOR9cg3iQ1zfHujuhrJz8Hk20YTYVVWcCxsviWz/GNWLDe2ngizCJtTP1e8iSxlvhViE19EQhhX7ndYKO3nzYM//vwao9aluiCHRUayH7OHCOYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 20:36:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 20:36:20 +0000
Date: Thu, 11 Jul 2024 15:36:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH i-g-t v2 01/10] tests/intel/xe_drm_fdinfo: Rename basic
 to basic-memory test
Message-ID: <cpkpadnhngra4rud52uypibg4d3theudfhz7nwqvkexumuelzx@bghu5paxdchc>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-2-umesh.nerlige.ramappa@intel.com>
 <7dw4w7s2sxkf4axlllqtpgf2m4v7fkxpb5tfhlgswvwrvxtity@gnkyeyww3qcy>
 <ZpAY0M6uBVka2lyR@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZpAY0M6uBVka2lyR@orsosgc001>
X-ClientProxiedBy: MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acb6bfa-7258-4c58-29db-08dca1e91ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7G/rvk/00yquAJ27BH7PzqedhwZyKT7VFZ+f/u7mEOl+Ue+81E3HoyF7GxdX?=
 =?us-ascii?Q?8fLPMHa6socLT4XEVaYpLuRZUSfmpxby8rFG7Zv0XnIv1oIiMlOkXIFWQpAz?=
 =?us-ascii?Q?WHWYOfc07BOnb+d05iS6L7DCYumTW/4CtArhpCm5O3BaXMJwS/hLVDzMe8Xp?=
 =?us-ascii?Q?Ihosd8l3bt6B5DLE10JiX4CKnL7ThQ8WhSKHcEPx2JuzFQZB2EcC+9C5eKMm?=
 =?us-ascii?Q?bmsGZSRodJDmtMnxtRxpV3U7Wf2Ll/0H5EapAcv0/dgG13TPfjeyrpkXgOVr?=
 =?us-ascii?Q?YvMVAxnJk3dXMgIZd+wexJNR+2UXWV5axysP65c94px5AdjhW9M8umYIIKTf?=
 =?us-ascii?Q?R9fCIXKdBhVjvhGrGvLU0cJ2C0LkmUvrNDvXIKvrKa20edSk2zVM79uQk3J/?=
 =?us-ascii?Q?2mDLYPxqHUjtRSK4wgspzREk3Xz4mZjdTaWTMeqbdtCxF5PnR0/jP9EBrbUV?=
 =?us-ascii?Q?pj3O+axa6eM1SYoFcNmUtosrsNtBrwx0oMS8YMPNgd7SymTUxmjHVVrG7+GB?=
 =?us-ascii?Q?hFhZHRo02e1HjRLGRseguhGWeNgi+V9Bqvm2qDrRv48CmGfd0fwIacmtUpz5?=
 =?us-ascii?Q?XchZRM+U4VbY99PUyWh196TMKlCw97dl4EhDQr0vrkV6yyrzdPgGympSxZK4?=
 =?us-ascii?Q?0zWgA4nL4LoJQupD5RAviGPQCxYOs75bxHxLqCNWP529lUo30LD1YZHh3sZZ?=
 =?us-ascii?Q?eKy64r4rF9nsUhZPIj5cuYKPHrFh0kBijBken/NVS54cw0XkfxkAThye45ZS?=
 =?us-ascii?Q?o0B9/qlU2xbk86G859Gj/CqkxUzurBhR1APquZuav0gjQhaH8Kj+r8PRa19U?=
 =?us-ascii?Q?wnNVUt00KvugLuNHFAYAkWIwe+x0BK41rLddThIz6PPW9PLV3LDkJBs9+7/6?=
 =?us-ascii?Q?lBtoDaieG2rWHF1ma4RoLb8alF+bNI6HoOyBOD4BTHLHLq8miNE56e0sICLT?=
 =?us-ascii?Q?aWsTY3gue2ynD+PYBlWsUH2jxCIMQ49laYwIgbqWzo4qJtpqf/wXPkZTYfNG?=
 =?us-ascii?Q?9yYT23RVr7XggY3dMgdEQaxQAFSXx23sAhVQK6sCueHTNmP4jDlxyL4pxqHk?=
 =?us-ascii?Q?egMahXkufNAlJNETS3gZY22O8JoUeifawUsIpcZG486uydGf6NTqaz43covG?=
 =?us-ascii?Q?5zl6yJIflDasaaIMMmGbYqblK05DDTSXtzZ9cbmWFtBgEJu3sxPPtWwseC0e?=
 =?us-ascii?Q?hUg9OThYcQ1XKs3G+116Zs9GDNixqT6R4UaLZFkT0M7652Vzdqm2t+mAne0U?=
 =?us-ascii?Q?/k6GDwWw99zHm7MOZbqRV7v4u+/KX5vq2PFrp6xaW/k8rMYbMYo8S8WlnYnV?=
 =?us-ascii?Q?uMc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cVQlcWSQlwi6DuxU9NgptSZqnH/F6mAUZu7odXNhTAub0uifqDd8DFZ4S663?=
 =?us-ascii?Q?k4lQCASHD7G4HeaZScHVF1BmUl2gUmEzPBxbwnMESOJCyPx5CVwn4SsLW/In?=
 =?us-ascii?Q?LFW/MVBnF/gMZ6q4dWL/Rt1e7+1zHl+PeBc/qfcYsvFKnmnIdpaeVJrdirxn?=
 =?us-ascii?Q?Jdwt23zWhMzcX8LuoKgkG74cp1AD2xDsPf4GkUMSJEfsVk6xmkQ7fm7EsjdR?=
 =?us-ascii?Q?9KE19P7EQPQlEa6ceiGj6nrGbJQM3MbX8qtRowWNqupnODhSsBFwEed1GxX3?=
 =?us-ascii?Q?9JcaTigPlUH01kBJP6V309+Kp+bBX/cuH5FKOY6yYz2NHWwiD8epBrSlcTUY?=
 =?us-ascii?Q?7fcpCBOb7w0M/9ecRtMYJRUoAuaM9pxkyRNePGbYClxBpcbNbw3Tcci5NpMB?=
 =?us-ascii?Q?6Cu1N8eLT30e16JA2Yg2bHczdu1C23lAGf2NSHRjlYv1BIYCUeB58k5PmRNf?=
 =?us-ascii?Q?Qqyvi96xfimsicasksQXCzarqbppZHd3VMzR5rces3PMmLn1ufSIDZ4835Rx?=
 =?us-ascii?Q?L+4ZFzd55fc0ucke/YGSooylU/9GYWKUA6YIIv2fEliUG3XqVt+Rx3XczWjn?=
 =?us-ascii?Q?Wy12vmPgV80v8jFWMFdUNgQL6eOXh2ekqw1Xx9Ece3FBuZ96oIs/PhDyw9X1?=
 =?us-ascii?Q?MLyDsJcwRMiepwVNYaWZzt9Eg4GzhRbNl5ub1egGSMQXKbHsXZgCx8v5Xa/a?=
 =?us-ascii?Q?+EV63HiqtK85toPp077rViedMMmh582ieWyarod+xlP+l70mFBX1iLxKIEvp?=
 =?us-ascii?Q?LdKKVQP0bTbk/OwtUZJDqJTNoovUCEzlSjToLaEPfCw8xcwOZ1lNemKxFd2X?=
 =?us-ascii?Q?L6QOdsP0b6i6kfPEpsuKEHQ2V0O38F6ktLsSu0401Qt+DztrSYBSgv8Q+k5y?=
 =?us-ascii?Q?ZR9XmaE6j0iOjL+s9Iou4cDMwqrBc9Ax3F4uW6RJ3GJ5sqVLS3C6bz/Bct/4?=
 =?us-ascii?Q?CDN9SisahWPxdAJV8bS+AXyGJut++V0ZjDxcL43TtnZEkd4rCjm4OeoMu1s/?=
 =?us-ascii?Q?igfwUavreCAVj+oI0Sb7Xt6O8ePPT89VqZ+FzqDUW6D/YAhKWobEyJFcEZHP?=
 =?us-ascii?Q?iu17S+fWhbCbSTuedWI+OtGtJWfysgNF4Ass9pPm+pSdiLxuvTIhPqx5eyuW?=
 =?us-ascii?Q?uwosTom14XSNSmf/36DXUB5rhLxVOVYUe6vmzyJy8dJ4Pz7W4FJj5wKGAwzi?=
 =?us-ascii?Q?LCRUuDAZn3Gwkg0j4ckZQFzM3BSSTYgXcNZXpNX5Gv5B4OpLuoYvVqWUX9Gw?=
 =?us-ascii?Q?alrCCqgqvo4qCOjjbgal+/L3uirxjrIYjqEOtEORziQhmXqoL4JwRHBJJCOU?=
 =?us-ascii?Q?U2zdjDkABBsUCEsHJbDB7hcnSr0kaMGg0Bh54K9TXAyYjYMbRWee35KnFHdP?=
 =?us-ascii?Q?fkCZ1T/a2AyDiG9OxxXfrBG7pKL09oN0Bl6Y+dwf2Ku+q0e1spFRplTDGHQJ?=
 =?us-ascii?Q?sWHcAl0N5B3knqDGxYV5l5vbziFrPsg843yQ9pGw4vsoBvQp+ybIveQqhmx+?=
 =?us-ascii?Q?YHF8/VsfjJw82eMTParujWBSx8tVOiR5L7837wfHpi+tUWDqUyfLMYwgBvt4?=
 =?us-ascii?Q?to6kXXrlVM4TNjWEqrxS3hd9Dji1LUSOTfTxjmECwmNGjFbcU+7Vl8k4n97o?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acb6bfa-7258-4c58-29db-08dca1e91ef2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 20:36:20.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWhKvEPnz+JTF5h30n/njt2/geCVW5RhnbHuDWdF0VtQpzZnGFOk+rVKG3Tte0wL0keaPDHIxgmb08eStExJFJtbBFP9eylO/NhsNCseqrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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

On Thu, Jul 11, 2024 at 10:39:28AM GMT, Umesh Nerlige Ramappa wrote:
>On Thu, Jul 11, 2024 at 07:00:40AM -0500, Lucas De Marchi wrote:
>>On Tue, Jul 02, 2024 at 05:25:23PM GMT, Umesh Nerlige Ramappa wrote:
>>>Existing basic test is checking memory info in fdinfo. Rename
>>>accordingly.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>tests/intel/xe_drm_fdinfo.c | 12 ++++++------
>>>1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index 2ceafba24..f0aa23e2f 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>
>>I was also expecting a change to the testlist... but it seems we don't
>>really have this there.
>>
>>https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=xe_drm_fdinfo
>>returns an empty result so it seems we are not even running these tests?
>
>Strange, for rev2 I actually saw these new tests run in the shards 
>list and was expecting the same for newer revs.
>
>https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11334/shards-all.html?testfilter=xe_drm_fdinfo

yeah... if I use the shards-all.html I can see it.. and that one doesn't
need a testlist since it's actually "all the tests".

Lucas De Marchi

>
>Umesh
>
>>
>>Cc'ing some people. For the changes here:
>>
>>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>thanks
>>Lucas De Marchi
>>
>>>@@ -22,8 +22,8 @@
>>>* Feature: SMI, core
>>>* Test category: SysMan
>>>*
>>>- * SUBTEST: basic
>>>- * Description: Check if basic fdinfo content is present
>>>+ * SUBTEST: basic-memory
>>>+ * Description: Check if basic fdinfo content is present for memory
>>>*
>>>* SUBTEST: drm-total-resident
>>>* Description: Create and compare total and resident memory consumption by client
>>>@@ -259,7 +259,7 @@ static void test_total_resident(int xe)
>>>	xe_vm_destroy(xe, vm);
>>>}
>>>
>>>-static void basic(int xe)
>>>+static void basic_memory(int xe)
>>>{
>>>	struct drm_xe_mem_region *memregion;
>>>	uint64_t memreg = all_memory_regions(xe), region;
>>>@@ -299,9 +299,9 @@ igt_main
>>>		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
>>>	}
>>>
>>>-	igt_describe("Check if basic fdinfo content is present");
>>>-	igt_subtest("basic")
>>>-		basic(xe);
>>>+	igt_describe("Check if basic fdinfo content is present for memory");
>>>+	igt_subtest("basic-memory")
>>>+		basic_memory(xe);
>>>
>>>	igt_describe("Create and compare total and resident memory consumption by client");
>>>	igt_subtest("drm-total-resident")
>>>-- 
>>>2.38.1
>>>

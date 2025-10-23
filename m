Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1944CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 13:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846BA10E0FC;
	Thu, 23 Oct 2025 13:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNXy0niy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142910E0FC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761225692; x=1792761692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iS0Phtate3nDpch1MlqAhZLQaG1t2bWPcOKVP/CLwnQ=;
 b=VNXy0niygMJ3fLxQTT4/xfa36u0SZBWm5EhrbbLgh180e8hIisaigxjG
 vCbfsXLoo11+t5ERMqg7cgbUI9Y3ae6ZxGJXRRusTswsLTtzNWlwG/V78
 RzCs9tHti37imoegWbyS83peKwbVaKWePwP1xx5hCnfouR3LDa/9Lj9Ke
 NMzrpXzmsUywAYqDZZFx5O7+xXc9NgylEmNuVwnK/hYv7EP2cIYxqdwIy
 W4HNOypstL2WcryF4yEetiTo1cEZTKhI9zC/N8g7tObWpZDChVk9lLub8
 kC5MU7BhUWZG0/MjeWCWD7/HEoyt2Vzm9GGh/VsW2+XlIrZWiTNKuEKFv A==;
X-CSE-ConnectionGUID: WnJd8LwZR8S9jwPE5oyLbQ==
X-CSE-MsgGUID: K0v6NXbJSJSdgo1pf5Xtdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63488941"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63488941"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:32 -0700
X-CSE-ConnectionGUID: 7xxeIBGeQgiVLPKcj5jJcw==
X-CSE-MsgGUID: qfkrX2oiRUeiDBB0zObB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184084015"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 06:21:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9EJDz274RlG6ZpOe8BcLzBRKtvACs7CmdGtjLnA7k8XWmrGpz16eNMH5PnwbgmXDArfkF8Y+56YTJiSBWDYNUvrVdr0HdBMJEjWloYCzIZgJvoBke4+HZbv38fNrMnBw/4ShCOPrjPZxCFha2BsRTWer7d5Vv6kzmMcmttqPyCN5GWbi4yNQGSiKjzROY4r7DyCRxR5Ung4hDdNwhSSd0CXNnn7QpQufcz3IUmzKcArqqvWfJRMz3TctvEMAW23JVc+5ccvjY+QTt/QznAVBIdpSAeduSZ/OKi2sXYkxtCVbCG1JZxEoTEjWSq7AYnE/B9uu1RsIv2SNbuflsaD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIaU05t7m94qP1FN52sCAXoBXAOvkreFPQK5hPwbGYo=;
 b=qXzlIvJ7lVXP9UQHFkVK097fS8r0pDyI/nc9mYgekJm+i+XsIe0Sil2Gte49Za01L9px7XF8uBbw9EjA2bgd9M9KKaYBO+Pk95jde62wXD53ax8C58ctZm/TCGS88OmRLChB4VEAZW6oi598fKMpD6njcEdxVx5zoa0BEKqG9q7jWtfRpOnQRc5SpGKWLGjHE2t+6VU8k/1pZExgza62wRJPuRLtLk6ezrrkBzpP9NmQdOM2CaeCjF8yoLoTK0P0LDgZFO2Xqp2WnCegZ5EONg5f3jCTXJz6DjyBg1ziqMdgDAxDwz3NWlNf0ZNHP9mGxNzjCMJGqFWxjmYfvchgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:21:29 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:21:29 +0000
Date: Thu, 23 Oct 2025 13:21:24 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, <dmitry.v.rogozhkin@intel.com>,
 <sebastian.brzezinka@intel.com>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <dmitry.v.rogozhkin@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 1/3] intel_gpu_top: Show interactive help in usage output
Message-ID: <1d0a1c1a321f3d5f78973b74c99836447b986085.1761225010.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.34.1
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <cover.1761225010.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0286.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::12) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: f69cb2f0-230f-4489-5671-08de12371394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2ZqWGVlWURTeWlxNGQ1SlVPcVV5TVZCcG55bFJUcnNhL28wRjVTSDhkTnk1?=
 =?utf-8?B?TGdkVFRVV2NSZ3hYYjk1QTE1eEJnSVd1MkJFYzdkcHlMQ0RxdEtONTFQeTUr?=
 =?utf-8?B?U2V0VFdOQnpMSG5YQ0ZVQllFMy9Nem5lZTR6c1p6ZFBFYXVrZWdtcWVmcm03?=
 =?utf-8?B?aEhQc1pZT3lRTkRBMFEyOXMrWE9VeDR3ZjFGU3h1c3h6R3FISXlBdWNQc2tB?=
 =?utf-8?B?Y1lCZjBzNWUxY0hwVEZkblFGTFZIV3ZWZEdWK0lXZ3MxdTl2ZnFFY3pZYVdX?=
 =?utf-8?B?b09CT3RVekxNYk04TUxkVEF1bjFXYjFYLy9FZ1A4NHFIb0VNUmRmTWxCVkJa?=
 =?utf-8?B?SDlZWHVENWFxeG9kUkpJYml2NVBxR3JwSFdmK2lyL3R2bnVHd3hlaEg5QUVS?=
 =?utf-8?B?ci83UFNqN1JpV2VQZXZLWTg1YzVORGdRQkJOK002VDhSY01wa0hDaGVFMjlp?=
 =?utf-8?B?Y0Z5Y2pzcUtLNDYwZ1ROUXUrT0p0N2FSdTJYUklJT1M1STFWRFJZVy8wSjV3?=
 =?utf-8?B?NmsyRUxYTWY5TEsra2lkQmVBUk5rU1VsOXRZWVIyYjFRRGRDSmpVN01uTVNl?=
 =?utf-8?B?UXpsT2FpVXB0TlBOZ2tUdW05MytSWGNmUjFlWUJsc1F0cHp0aThPYk1STDdU?=
 =?utf-8?B?d1RUVXEvR1R4T2FoaTg2N2JPZTZtMHlzQ3JyYUdjRHdBdjdnUFViRCs3T0th?=
 =?utf-8?B?R1Q0NkJmQkhPSkZTSlNzL1JxSU9kbmxMTkc3bGFNZDU5NEo3QklzbGhOSmk1?=
 =?utf-8?B?UW1IQitySHJ0WUJubU92S0NIWE1kZTZRUlh6MnBrcEU1bTVmZHZ3VDR1Y25W?=
 =?utf-8?B?aEJtcEUvZ2FscU1kNmVZVEh6VklxbU1sbDNtNEZ1b3dkWlNyZ0RlSDYyVWlz?=
 =?utf-8?B?RVVyZnVQVzd0Z2NCRytUbUo0V3VrYW1tZUphR2pKTFJLajdjQ09URSs3MTFi?=
 =?utf-8?B?MzB2K2FnWEdiMnc1MVg3UnA3bHZsODQwTit0ZEQvQ3lZVG1Xd2JGMEJoR0tN?=
 =?utf-8?B?VEg3WXJMOXo0Sk5GbStOMDVZOHp0Tk5pbkM3UFAxb3JBYjFsQ3l4d0MzdVFR?=
 =?utf-8?B?dWFtbU5vRTRCRm5WekJRUXM4NTRTMit3VUs3Z0o3Y2lsYWs0Q0VZdzd2aXI4?=
 =?utf-8?B?c2I0Mi82bjl0ZTlqWi9BQisyTFpRZTRMdmZFNVI4a0VmOFY1SVprc3oyYnFh?=
 =?utf-8?B?YnlOd3R2VnBnNzY0UzJhMVIrVFJpOUNoalM4VU5tK09aa3ErTk05OFVrT2dY?=
 =?utf-8?B?Y0ttZkJnNG1JcFpkY3ZhOEhzZ2hNYjA0eFZocnozcTl2OHVBV2ZneVpZYTJY?=
 =?utf-8?B?dmtXbFlrWGdqQ3ppMjI3QXlxU1I4NlB2SG5xQjAwc1RPMWExaUYxQUxNN045?=
 =?utf-8?B?NjA0RVcwQlQ4N1UxS2x6QXZTN0NDdUZacWgyODN6L3Q5dDZWbzdwd2R2NG1M?=
 =?utf-8?B?WDlyWVVrNHdHOXZDZFRaNWZTN0lzbkV6cGw1QncwcXRUek1QeHlxYTdOMzRH?=
 =?utf-8?B?Mis1aFpyRFNGUWpaUWZuK0ZhbTgvbVR1eUozVUF3Tld1VGRqYU50WnhoalhL?=
 =?utf-8?B?S0kyU3M4Vko5QVRkRTZ0UkdZcXNjN3p3aDVnSjVJT0pENXhWY0tUWkI3bGIy?=
 =?utf-8?B?RFNDbFBIaEdpVXRJQXdwaFdCc0JtWjh5bkRZR3YvejBUVmFhVk1YeFdySzFB?=
 =?utf-8?B?SEZLM0p0TWlxeTN1MkR3cjkwMFNHYWM3d3VnSkszWXhHL3hkV01VT3pmcmk4?=
 =?utf-8?B?eXZwMGkzb1J6ODNSWXJncTRGTExSL29OdHlvNWUzNHgzeXRrM25SRnpQOWsz?=
 =?utf-8?B?d2ZYZTcydmx0eThHa25NbHQwR0c4ZGFQNlBBY3R3Q0EzTmVNcFptZU5zYUF4?=
 =?utf-8?B?b05ZYTF0MlBlakphcG5xSWxvOEhVRkZOZTAxRWVRTnJEWWdDdm85a3k1ZjUy?=
 =?utf-8?Q?uEr3kA4ISGUPypzRz+G6InU5l3BpN6BB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjZHU2VDN3JGQzN2RGJnZlpmd0dYNVZVbW1nY2pXcWFOVXVMUVhXZ0w0ZWM3?=
 =?utf-8?B?M0o1dkw3RUxURTJHdmJVdVRNODNqNVhXbU9PU0t4blpTWGhRdlFLMytqT3lW?=
 =?utf-8?B?aXZtbUlnSXowakp5NXkxbStRNFFFenYvbTJ6ay9JUGk0NFJMdmhsMTZtSUNF?=
 =?utf-8?B?Z3NkWWJBVnk5b2lYaFkyb1BkazRBWVJsYlVIOTZKbHcreGVYYXdMdXBQaS8r?=
 =?utf-8?B?b1pwRkRyMlp2N0NUYkg3N2dEbSsvSUpqUkN4ZExTd2tQNEp4ME5ySndFaENH?=
 =?utf-8?B?d2tOK3BDajNGUEsxeURwY2prc0FLSkFXaHMyNmZ5WkFOcXo4SmdZemU5SXhV?=
 =?utf-8?B?cERwUkcrbjRIZStyRmloV2ZuOG40OVpFa3k2VDVJM0tZZ0xJcFo5RUthZEM0?=
 =?utf-8?B?YkJHem1qd01Va3d3UDJKMGxmNzA5eEtpWFJHRWV0TEQ3SEFLT1l4ek5EQmVN?=
 =?utf-8?B?UkFuS2VCN3JyanlTdFVXTXowdTRqZWRaeTVFWFRhdVZRREcvd1k0TVQ2am1U?=
 =?utf-8?B?RENiTzNxeTdOMFVwRUZwbW1wVWgza3ZVUW4zZkdZeEZTeDZQY09OUnpjQzJv?=
 =?utf-8?B?WjdZbTNmcG9jeHg4ZmpZbGJBdThwcmNFTzVLc1J5QkxNeDBTZTJoQjhaOXVJ?=
 =?utf-8?B?VW9qc0t2d1VCcEplM21uekRVMlJ0eDAvbGwybWYyRWZDNVphWitKVitwOGZh?=
 =?utf-8?B?bTFUK1NwZWFzUXUvdlYzQitydExTU3hJc05UUFJGSG00ako2MytCSjM1bm80?=
 =?utf-8?B?Smpmcm9NbENzT25ZUmJIZy9QMVlEL0x0ZEtDN1NncXBWUzN6SkFrWUw4dlBl?=
 =?utf-8?B?WUowS2pkaURUYVpKeXZLN0FMamhucEE5MHkvMDU0QW95dGordTVIZ0diWTZX?=
 =?utf-8?B?dWw0dFJXenkrczlIM0xEUTBqeXl1QktNTm42OVBhYnNGa2xPYnFSVVhCaTlZ?=
 =?utf-8?B?Ylp3ditTMWRYQTI3Ty91b3RZckdOTEpFSlUwMjBHRlFIMjVLcGhJTjhsakYv?=
 =?utf-8?B?RkVYZ29LTVhzaDhUNHNEMkdOVVNUa28xWVFVRWw4dmNGNStYWE5mdnpwMjlm?=
 =?utf-8?B?eU5teU5DakhFeDJxL1NUY0xQcUoyYUJlR2l2WGUzdUltT2lMcTVrWURKTXRz?=
 =?utf-8?B?bUYxeFhFWWlmdTU0MU14dFBvU3N2U1UxbjcxZ3dGUzFDM01CeVJRWXpMZnlt?=
 =?utf-8?B?bTJlSk1UVVNBMUFPdk44dXliQTlPVEFXdFZWbGdFNmVkNGMxUDdmeVliRTQ4?=
 =?utf-8?B?VkJIMlROWjBpakdaMUN4UkthS25HNHZMTmc2OFRtVkN6RXVTL3VCd2xiTHRp?=
 =?utf-8?B?TEtFNmFEc2J4N1VySUxPVlFKWTlVSDFoSjVpRUFJY3d1T3AwREVqUlUySSsz?=
 =?utf-8?B?VEgvNTBuYUVRTHFSY2pMcTZkb3NRMWxxVVVtN2xBek92NXdPQTVSTWpTTHVv?=
 =?utf-8?B?cG02OGt1bmo3bEtMRisvbnlvVW1rMEEyc0Z0ZURCdlFWMjFwdDRCMlA3Qksz?=
 =?utf-8?B?U3ZCWW9xanhjVENIM1pVR1hPS1Q5cVh2TDY0UWV3aTJUUWRQdExTRmw3ejRB?=
 =?utf-8?B?SEc1TjBvaEd5Qm9ZVnZQZlcrWVJuSzRLbmZFT1Q1Nys2Q2lzdS9Gd2wzZXVR?=
 =?utf-8?B?RWl1alFhejlYQXA0K2RSL1lRdXltZmlJSnRvZkd5dWJoOFl1OUhKWEsxN0JE?=
 =?utf-8?B?cWpyY3V4NVVQLytqYkduTjZQTit2RlhRSVljZVYzMC9QMktScGJTcTNHVmgr?=
 =?utf-8?B?cDRRWS85MG5HalhzSUE1alcxOWRCOGwrdmdyU0RRaHlFdlp1TG1xUVdOSUQz?=
 =?utf-8?B?T2t3Nmg3MlpKR2VTUDNFL3lmVTdYMjFrNy9qOERKMHlGUnVZMmxKdzRvSWs1?=
 =?utf-8?B?RWJJdEkzSWVjdWJxMlFPYUg2YUJLeTlhd1loa3dBRkFEbktBNGVlc09EbFlO?=
 =?utf-8?B?djFPT2Q1NW0zSVo5Q0Z4T3R1N2JudnVxTjZHWnVNZTkzYkR6VE9hYStHNDNp?=
 =?utf-8?B?YjZ3bUhzOTQ4WkhaMWpnYlU1Z21rNUFhOXJCT1hxdlppS3M1M21yeVg0NUZX?=
 =?utf-8?B?RklHbWFzOHhYV3ZiWCs4d0FRYVpUbm90OU1KV2dxYTJYUUdJNDNuSnMrdlh2?=
 =?utf-8?B?QWxQOWIvYTliNzk2N2xUWG9zclVOVkxvVkQzRjR2emNrU0ZOSzdzOXRpMVdX?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f69cb2f0-230f-4489-5671-08de12371394
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:21:29.5399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbePxWa/XOeuJMR8QOJLdP/ibULZgXURN2Q9qd2G30AmN+SYcYKP/lt8UGGTwDLHvmMeNC8CgCLHc424NPHve7j8oefU2sim1LW57L6XvxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

Moved show_help_screen() closer to its usage in usage(). Updated
the usage output to include a message about accessing interactive
help with 'h'.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/intel_gpu_top.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 54e71e559..f1b7ab46f 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1033,6 +1033,20 @@ print_percentage_bar(double percent, double max, int max_len, bool numeric)
 
 #define DEFAULT_PERIOD_MS (1000)
 
+static void show_help_screen(void)
+{
+	printf("Help for interactive commands:\n\n"
+"    '1'    Toggle between aggregated engine class and physical engine mode.\n"
+"    'n'    Toggle display of numeric client busyness overlay.\n"
+"    's'    Toggle between sort modes (runtime, total runtime, pid, client id).\n"
+"    'i'    Toggle display of clients which used no GPU time.\n"
+"    'H'    Toggle between per PID aggregation and individual clients.\n"
+"    'm'    Toggle between aggregated memory regions and full breakdown.\n"
+"\n"
+"    'h' or 'q'    Exit interactive help.\n"
+"\n");
+}
+
 static void
 usage(const char *appname)
 {
@@ -1053,6 +1067,8 @@ usage(const char *appname)
 		"\t[-m]            Default to showing all memory regions.\n"
 		"\n",
 		appname, DEFAULT_PERIOD_MS);
+	printf("To access interactive help, press 'h' while the application is running.\n");
+	show_help_screen();
 	igt_device_print_filter_types();
 }
 
@@ -2470,21 +2486,6 @@ static bool has_drm_fdinfo(const struct igt_device_card *card)
 	return cnt > 0;
 }
 
-static void show_help_screen(void)
-{
-	printf(
-"Help for interactive commands:\n\n"
-"    '1'    Toggle between aggregated engine class and physical engine mode.\n"
-"    'n'    Toggle display of numeric client busyness overlay.\n"
-"    's'    Toggle between sort modes (runtime, total runtime, pid, client id).\n"
-"    'i'    Toggle display of clients which used no GPU time.\n"
-"    'H'    Toggle between per PID aggregation and individual clients.\n"
-"    'm'    Toggle between aggregated memory regions and full breakdown.\n"
-"\n"
-"    'h' or 'q'    Exit interactive help.\n"
-"\n");
-}
-
 static int gettime(struct timespec *ts)
 {
 	memset(ts, 0, sizeof(*ts));
-- 
2.34.1


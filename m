Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21026CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 06:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE7910E08A;
	Thu, 11 Sep 2025 06:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7YuAtMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8975D10E08A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 06:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757573221; x=1789109221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=onO5tnwY0/U56jFuv98pgUn57STcDaPo8h8r7rmJB4E=;
 b=A7YuAtMVPlnpvAYjkvvTd2xtF46QklUbgk56rEFfZbmcLrik2W7afzCN
 aruNyH45HZ3Kxxp+AWHNtfgTOSF79WYH+avpjTcYAsmcPHXpa6MEBeIZF
 zdRzXtEcBJNnwODfi5zFxk6TLtxmS+eafAexf5ITHkhDx08TsxnGP/q03
 6vYmFGZ97/RHNOlMMGGJBwGr435LOcJPkyy7Tfz2KJVr2lGwU5BESiF1F
 L/nTnbViQoH9hl5T/H6MLts3sBp8gezK+qSV7SgOoL0nGANWlqxrUzKB2
 irXF+zVXm3hbbCbarQNCbELDQxmI7f1FVTgTWIWCj4O6dLe94Of8x6mq4 w==;
X-CSE-ConnectionGUID: rW92PHFbTUaZ5Sb68ivOWg==
X-CSE-MsgGUID: TdEejx9hQ0mQpiQked4dkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59814569"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59814569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:47:01 -0700
X-CSE-ConnectionGUID: 4H0QQ4k1Swuemuj+zJPwzQ==
X-CSE-MsgGUID: +6HRPq8VQGyoxLuqvnrvhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="177912046"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:47:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:46:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 23:46:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:46:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhdGGSMZkO6HiFKvgRCvQLX/5H7XeTtFc9QzrhmVQEjEs4uTawuo14Xyo/5zuFk1eH1CHaW0Hh+G9OrLKP1XhPJ3dZBHQaiSuxFYOOti60/XjmDAEXqle3axrTc5EAYwJA5xHiW7r0aHAs/wI1AnYiRkl4AeDsutGCfJcq0aoVvynhJ7qNsR/kqcGA48GES6bM1/qqoA/IQ7jkVqBur5k2mUfMWJnhTj91PYTfkOcHamuvqUIM3gat9mhT3fpFpVgALwWm0w1IWzlOPXDtArKTqhBXtvwQKWGYrb7ZUINSnxAz1HOQKGDEVkecemnxvv3S6FtCHdEM6FOHsMymWIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nf5F9usQlbK93k7f8jN6ZEWS4nKDI7CuqiEK+NRnsA=;
 b=ZUNVS1q0QP8gcR1a+nbqvBDGk0AXLoxGlmoJW4mv/RDFyLc5wo0twsDNfvjaAm19XdsatLIVKuTBv5NtLFiO5j5z7qjW4290jr35nPCClvMTzrfwyyHLwMHlANIhzT+Wa1TsvjVEE3yJ/K1ESFZnZoK28YfK3KQotr3lWEkD1cM3/MbuyWB2T0R9siCaGCWvYloHuQv5+dzZlDCEpgXwCFBDH2Hsr6w4olD6R5ADVXCiGSACD91SyY9L2Oc98+OcMYRVmBF/bIMLrMUAIIjnABlFZU5sBAbjfr/lrCRkDzgF3Et6I1i5OdepzfA4sn9K3rwU7IgUKFJk1qrHdvqJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:46:56 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 06:46:56 +0000
Date: Thu, 11 Sep 2025 12:16:49 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_mix_modes: Fix, refactor and cleanup
Message-ID: <aMJwWZxXZodsVHHe@bvivekan-mob1>
References: <20250910123946.1144932-1-balasubramani.vivekanandan@intel.com>
 <20250910125257.vshhygh3iq3ir3rq@kamilkon-DESK.igk.intel.com>
 <aMF6g_jTDt40Zq6g@bvivekan-mob1> <aMGTIkO3PuK4UJ9y@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aMGTIkO3PuK4UJ9y@fdugast-desk>
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a35843-4e82-4669-b678-08ddf0feffdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkNMZXlVcVRGeHp0TVdzV010TWNSY0oyKy9ocGUrcitvT1dFK2RmN0h3RDBC?=
 =?utf-8?B?aFFqVnA4TmRsZEEwOFBlMnQxNjR5TVdkRE41RnZKRzVnL1ZkcVlTalE1cTFo?=
 =?utf-8?B?S1JROFBsdXlseUVKOW85L0VXYVQvcTA3eFU4VWp5b1JmVjcvb09qbTRtbXFR?=
 =?utf-8?B?VmJIU2NINXJJaTd6cUxiUllPSnkxeFZ3NDA0THAzMk04MXJYcTM1V0c3NnR4?=
 =?utf-8?B?NVRKRU1LNnY3MlhJVFpRZkNCMUlydTdZVVRXWTBhU1FuL2J5dk1iNU1yNmox?=
 =?utf-8?B?VjllbkF4ZlhPTFVCcVk3QnJua1kzd3BpRUFybTNoc2N4eDEzL0NTdUhZanJP?=
 =?utf-8?B?eXluYjgxOEpOQmM1MTc4ZHEyTkpCTWs2b3VCd2pZYjNwQzJucnRBNm9pOXZ4?=
 =?utf-8?B?azJMUnUvblYzcGVFN3RMVHgwUTZsbUlTME1ONzlsQXNlaGR1WEVlUlhEbGFH?=
 =?utf-8?B?VndFUFcvVTFMZDk0S3JHVXZzWndGNElYWTVHN3BHZHY4V3NXcGpQeVdnbU9n?=
 =?utf-8?B?TlAyRDJQUVd5Y0NBSmx2bXFDelJnKytpRUtERE5udFZxTk5hUU1jQXlGTWpC?=
 =?utf-8?B?c2EwWGcvZjVSdmNtM0FCQ0hGMWxzcVZMQTVudTZPeGhjTWhMajN1YmpTOEln?=
 =?utf-8?B?N2NXaHpSUk01QmxobmRuMHZ0MlJtY1lub3l1WWlTUDE2ZHRLbzJnSjVYcFcw?=
 =?utf-8?B?LzBiRGEvOVRsSGFMbWl3S01mRm9QRVhtRGJSTndTaStwRGNxQ3pkWVVlOUtF?=
 =?utf-8?B?cVlncnBSTFM0bnUwaE5KdTc0TkV3RFdmMEhZdHdWRUtwcC9XSzBQeDM5cklX?=
 =?utf-8?B?dVZ4QUhDclQvSWJkdTVOT2UyRDk0Q21CNWY5a0F2RzM3VnAzZkNFVy9UOXZn?=
 =?utf-8?B?UWltbjhRL3dlWnZFdTNxa2htYzRoRWwrbjJHZERCYkNwOFVUVVc3ODZ5b2Zs?=
 =?utf-8?B?YW1SeHl1NGEyWHZOUlhyMkpla1Z4M1AyTHQvOUxtVVFyT2JYQUp3NlFaeFI2?=
 =?utf-8?B?WUpPSHk2cmxCeE5NUys4TEtDOHRaZXd5dzkvRXZSZktYem1VSk9BcEN4K0Vz?=
 =?utf-8?B?bi9OSXkydTExQUc0NDA0U2pxS0w1NmFIUUFOd2xkc0VpbUYwdnJkNzNQY1JH?=
 =?utf-8?B?NTlpbEI5bjJQVlc1OWcrVjZ2T01QQzY3anVXcTVjVkhzVDFTYUVMOStKTWZB?=
 =?utf-8?B?N3UzSkNNeFU5T240MzJqTCt2T21IQW0wRTZ4T3UzMWJVSVhnc0NRN243dHYv?=
 =?utf-8?B?ZGtocGtFSi80NmV3Vllpc3NoTjdWR0F0SFF3RWVYNUJYQkI5WTc5azZpSnJU?=
 =?utf-8?B?V05ybzNocEFKOWtKUlR4elpsSFRiSHplcDZCVDAzOGhBSmFjM3lpS1ZvNm5U?=
 =?utf-8?B?VVljMm9QeSthSnA0aWtkajhiMmYzMkVRMVREcDVvMXMrTTVZR1p4WHc1UThT?=
 =?utf-8?B?cXhaOWRBNjBoTktrRXg2WXRzTUExbXk5bTZUKzVFR1BVUEkyUTB5VFROZC9u?=
 =?utf-8?B?dUliK3pOZkg0VWxhMmNkR2toTGZmVHZUd1Q1eUN5NC9CQTVpTG1USnZWS28v?=
 =?utf-8?B?Z0dUdlpHWmZuWFlzcndTemx0NEo5RDF4MW1EME04TXhBMCt0cmhrcElRdThj?=
 =?utf-8?B?THlORG9YQ252aE5hRUxHK3BNK1dLVHpvNGFEU1gySnFjVmRUc3JZUmEyZEo3?=
 =?utf-8?B?SlFoQ0lEUHNLTlFBc0pwOFBnOFB6c1NnSDUvWUVZVUNMZHQ1LytyeGs1ZlNB?=
 =?utf-8?B?VWxNd0dVT004TDdtampiSVBET3lnU25TdzRKSFhYOTJHWlQ5OXp3Mll3TnBp?=
 =?utf-8?B?OHRMNkhMQjJ3RTliSFIzd0VVaDNHVGQxVVhaU0t1ZW93SzFkbExJNXFSZU9N?=
 =?utf-8?B?WGRxOVVZU044QUxFYkhTdG9ZTVVhMGU4NWZsYzNoZktsTjJsRUNrQjJOM2tZ?=
 =?utf-8?Q?6NFMx+h3S1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTFRTkRGRHQ3L2JqWGpBZG8rOUFzcWZ6Wm5RSmFtazM2QS9WYk96czNERlll?=
 =?utf-8?B?S3pyU2ZSTHo1TTBOQ09KNWRXWFhVWFdRTVJXTDF0emVVYkxydS80b1J5RnJi?=
 =?utf-8?B?ejVXTWNZaC85bHNiTUx2QTVCMEorTVhHY2hnOTlTQUJrRk5oa1VZc3hvdHZx?=
 =?utf-8?B?ZGcxbmE5bmdIOTJlOXgzQkZSUm41QWl2ZmtZUmRpMitCN2FRQXpOOGxoUHl5?=
 =?utf-8?B?SnR0TTNvK3cxSmtXZXNuZVVrQisrclZaK2xScFZWdGhkalgyYVZ4d1pXRnhU?=
 =?utf-8?B?K0o5akg2TE5nSksyT0tZUW1QSjBQQ3h5Qk5HUnd6eGhrWXdDVkgyZDlJZWdJ?=
 =?utf-8?B?eElva2RHaU16YkpXR212bzRib2RNU0VKUndTUmhjVXM3dFZjb2ppNWgwTlND?=
 =?utf-8?B?WnRDWlFJL3NHdHozc2Fiei9mTFdjbXA4THQ2czJNV0IraWdvdyttZjdJUkZL?=
 =?utf-8?B?UWJLMWI0Y1dVZkh3WC9rQ3VtZ2t2RHROMC9iMzZTa3EweEMxZk44TlFtLy9w?=
 =?utf-8?B?WTRYcnBNM2xyN1p3SGpucDVJSEZCdHRJZUtUeFgrdmttZXRaWTFiL0w3UXJK?=
 =?utf-8?B?SnJuWWZXT2h4OTJKcHU2bnhOZjBpSkVWSWRucjQyUExwYXFvaG9HZnNuZnpV?=
 =?utf-8?B?YnU5NFhrMVJJZnExcURzVm14ZlR4MHl0VEI4SW5zV2lQNHgrTVJSY2plRGEx?=
 =?utf-8?B?ZDVtK3hoK0pKV2NjQm5CR0ZMenZQRjcySDNvclNYdjF1UkVzL0xrTGNBSCtz?=
 =?utf-8?B?cVJkM1Y2NjkvKzlWQ0RHbmVRZVY0RG55dGcwMVRRWnlycjZ1Y2ptWFZMaEpK?=
 =?utf-8?B?c2h1VVJPUC9lLytTN3Fla21QcFU5RTl3aGFrcExZZytPdEZtLzd3bVlKbk1F?=
 =?utf-8?B?akpBSmFjUlVjRVRnWXpiQzB3eER1YXNEUkgwMGE2TTJha0hpZW9GYWhwZmhY?=
 =?utf-8?B?OWJhbXgrMm9IeTlNY3NnNlhLUGNQRmFQTUg0RmR3RmN5UjRQbldDeVNnSi81?=
 =?utf-8?B?QjAyYlpXdkxaTEZpbElSTU85Z0tGQTYwMWFxaHBEMGdGRXRjRGg5VkxqVVQ3?=
 =?utf-8?B?QzhnVTRsbHRaRHlESkVYYzJCeFB3WkNJQmhKVkpmSFpUaG9QSVdNM04wb1FM?=
 =?utf-8?B?SWtpL1dQWmRnbGx1OVAxOWYvb253SEEzY3htQzdoWFdydlFSaFdFeEgvSzAx?=
 =?utf-8?B?bDVVdElGcXc4bVJQWHMwSDRrci81M2E5cXUvSlpEQUVtdGhBaGdDZk92cDly?=
 =?utf-8?B?emcwUUhXTFBnLzhDOFh5eG8rV0syTDQ3QStUb2RyVVoyTEM3U2hickRNNWdB?=
 =?utf-8?B?UjlDRnI3dW0wYkpOYkxnMTJuM3dUSndXa3l0Zm45SDQ5Wmg1czBPVlpNdXBo?=
 =?utf-8?B?SjFmTXhscUEvcUZYQU1PcTJxN09xVDJhWHFET0wxRFVrVWNhcjZuTGxTcDNX?=
 =?utf-8?B?OVdQd0VwNTllL0hidkE0bTZscmJtOHp3OXZjNHBNOXV3RkRZMVNsSC9YV1RZ?=
 =?utf-8?B?UHBlTlA1STlTSDlHN0FhWDZpZERsV1lpOWVrUzJORkFjYXVJK0ZRS0UwR3B0?=
 =?utf-8?B?dzBCN0toZ295aTFOTXVwVFVRYXRna1N2S2dhLzFhUFVKRU1OVHZsOVJ2U1VV?=
 =?utf-8?B?Y2RCeGJKTXAvU3dMN0xsYXNSRWkwd2FnYTRTcG1rYjZMbjFBcTVJdEhsQVVa?=
 =?utf-8?B?WVRUTk0yWGhiMzRKNkVqNVd6eHNWRi9PRy9DV3prVkFuWmFETWFtQU9VNE4y?=
 =?utf-8?B?K2grcW1PSmlIZXNzVVVnSXNtQ3dvRFM3bVlUQ3ZrK0FaWFJzclRMT0VSakVT?=
 =?utf-8?B?N0h3VGJ5Uk41N1pwYjZwNktYL29yWW9EMFJsOWhGdTNFbTZVY2IrNld5ai9a?=
 =?utf-8?B?bjJablpwUlRjL29rR0lZZ3RFRDZPZjZaZENKbG5GNGVta20wcmxYeStUbzlF?=
 =?utf-8?B?M2ZjR0I1Q1JLYldSdWJUSFJTbTdpcGliR1pnTjZWVk1RWWl2Q2o0Z2NJS2N0?=
 =?utf-8?B?VkF0QnkwbVJqbllCLzk3MDVmbWpwQ1RwQzJ1MlREeEE4V0U2d3M0d0pNV2ZG?=
 =?utf-8?B?WDhRVEJHNThUcDNlMWIyaWozbmFLVzNRUk5zakZkd1NMSVhtUElwa2V0YU9Y?=
 =?utf-8?B?a1UzelFaUDJMZy9FZ2RjUEdtTmtPN3hMMy9BSW5IYVJYdDZGV0Q4ZWdZZXF3?=
 =?utf-8?Q?oOiWDkoH0Ra/jsovCLPyVsg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a35843-4e82-4669-b678-08ddf0feffdc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 06:46:56.5507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEqk5p4bVv+4lXPLsAquZ7EhDJUD8VMXcWsnbk3UEDdiOysidQX1IpNWL/fu7S3WK3vT5joclToglxrMnieNcuCkWKcWMNmBQufc5BGMtD6emSrDPd/NqVOvX4roVhts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

On 10.09.2025 17:02, Francois Dugast wrote:
> Hi,
> 
> On Wed, Sep 10, 2025 at 06:47:55PM +0530, Vivekanandan, Balasubramani wrote:
> > On 10.09.2025 14:52, Kamil Konieczny wrote:
> > > Hi Balasubramani,
> > > On 2025-09-10 at 18:09:46 +0530, Balasubramani Vivekanandan wrote:
> > > > After the recent change of xe_exec_mix_modes, fixes were required for
> > > > the following points
> > > > - A local variable spin_arg was used uninitialized.
> > > > - There were some variables and macros left unused.
> > > > - There was an unnecessary loop.
> > > > Along with these changes, also some refactoring done to simplify things.
> > > 
> > > Is it a revert of recent changes? If so, it would be better to make
> > > it a revert + fixes, e.g. in two commits.
> > 
> > No, it is not a revert. It is an improvement on top of it plus a bugfix.
> > 
> 
> Kamil is referring to the partial revert of commit
> "tests/intel/xe_exec_mix_modes: Remove absolute duration value"
> 
> Your changes bring back absolute duration values which creates some
> issues, please see that commit message.

The wait time you see in this patch is not used for the same purpose
timeouts were used earlier. It is actally used in place of
timeout_short.

timeout_short is defined as 1 nanosecond. It is very small to validate
what is intended to. In the following code snippet it is expected to
validate that the interrupting job is still not executed

--------------------------------------------------------------------
   if (dma_fence_job_spin) {
           igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
                                              USER_FENCE_VALUE, 0, &timeout_short));
           xe_spin_end(dma_fence_job_spin);
--------------------------------------------------------------------

But a one nanosecond wait won't really validate it. We should be actually
waiting for a long time to ensure interrupting job is never executed and
waiting for spinner to end. So I have replaced it with 500ms wait.

This wait is always expected to end with timeout. So it doesn't affect
execution on presilicon environments. It has been validated on both simulation
and emulation.

Regards,
Bala

> 
> Francois
> 
> > 
> > > 
> > > Please write all Cc before s-o-b:
> > > 
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Daniel Charles <daniel.charles@intel.com>
> > > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > 
> > > Regards,
> > > Kamil
> > > 
> > > > ---
> > > >  tests/intel/xe_exec_mix_modes.c | 101 ++++++++++++++++----------------
> > > >  1 file changed, 52 insertions(+), 49 deletions(-)
> > > > 
> > > > diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> > > > index e65854d0d..b74247bc4 100644
> > > > --- a/tests/intel/xe_exec_mix_modes.c
> > > > +++ b/tests/intel/xe_exec_mix_modes.c
> > > > @@ -28,7 +28,6 @@
> > > >  #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> > > >  #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> > > >  
> > > > -#define NUM_INTERRUPTING_JOBS	1
> > > >  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > >  #define VM_DATA			0
> > > >  #define SPIN_DATA		1
> > > > @@ -96,9 +95,12 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> > > >  	uint32_t bo = 0;
> > > >  	unsigned int vm_flags = 0;
> > > >  	struct xe_spin_opts spin_opts = { .preempt = true };
> > > > -	struct timespec tv;
> > > >  	enum engine_execution_mode interrupting_engine_execution_mode;
> > > > -	int64_t timeout_short = 1;
> > > > +	/*
> > > > +	 * This is amount of time the test will wait on interrupting job fence
> > > > +	 * to confirm it wasn't scheduled. It is set to 500ms.
> > > > +	 */
> > > > +	int64_t job_wait = NSEC_PER_SEC / 2;
> > > >  
> > > >  	if (engine_execution_mode == EXEC_MODE_LR) {
> > > >  		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> > > > @@ -153,55 +155,56 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> > > >  		interrupting_engine_execution_mode = engine_execution_mode;
> > > >  	}
> > > >  
> > > > -	if (allow_recursion) {
> > > > -		igt_gettime(&tv);
> > > > -		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> > > > -		{
> > > > -			struct xe_spin *spin_arg;
> > > > -
> > > > -			if (job_type == SPINNER_INTERRUPTED &&
> > > > -			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> > > > -			    interrupting_engine_execution_mode == EXEC_MODE_LR)
> > > > -				/**
> > > > -				 * In this case, jobs in LR mode are submitted while a job in dma
> > > > -				 * fence mode is running. It is expected that the KMD will wait
> > > > -				 * for completion of the dma fence job before executing the jobs
> > > > -				 * in LR mode. Provide a pointer to the spinner to the interrupting
> > > > -				 * dma fence job so that it can check that it was blocked, then
> > > > -				 * end the spinner, then check that it was unblocked and completed,
> > > > -				 * see "if (dma_fence_job_spin) ... " below.
> > > > -				 */
> > > > -				spin_arg = &data[SPIN_DATA].spin;
> > > > -
> > > > -			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > > > -				false, spin_arg);
> > > > -
> > > > -			if (job_type == SPINNER_INTERRUPTED &&
> > > > -			    engine_execution_mode == EXEC_MODE_LR &&
> > > > -			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > > > -				/**
> > > > -				 * In that case, jobs in dma fence mode are submitted while a job
> > > > -				 * in LR mode is running. It is expected that the KMD will preempt
> > > > -				 * the LR mode job to execute the dma fence mode jobs. At this
> > > > -				 * point the dma fence job has completed, check that the LR mode
> > > > -				 * job is still running, meaning was successfully preempted.
> > > > -				 */
> > > > -				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > > > -								   USER_FENCE_VALUE,
> > > > -								   0, &timeout_short));
> > > > -			}
> > > > +	if (allow_recursion) { /* Main job */
> > > > +
> > > > +		struct xe_spin *spin_arg = NULL;
> > > > +
> > > > +		if (job_type == SPINNER_INTERRUPTED &&
> > > > +		    engine_execution_mode == EXEC_MODE_DMA_FENCE)
> > > > +			/**
> > > > +			 * In this case, jobs in LR mode are submitted while a job in dma
> > > > +			 * fence mode is running. It is expected that the KMD will wait
> > > > +			 * for completion of the dma fence job before executing the jobs
> > > > +			 * in LR mode. Provide a pointer to the spinner to the interrupting
> > > > +			 * dma fence job so that it can check that it was blocked, then
> > > > +			 * end the spinner, then check that it was unblocked and completed,
> > > > +			 * see "if (dma_fence_job_spin) ... " below.
> > > > +			 */
> > > > +			spin_arg = &data[SPIN_DATA].spin;
> > > > +
> > > > +		run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > > > +			false, spin_arg);
> > > > +
> > > > +		if (job_type == SPINNER_INTERRUPTED &&
> > > > +		    engine_execution_mode == EXEC_MODE_LR)
> > > > +			/*
> > > > +			 * When main job is executed in EXEC_MODE_LR,
> > > > +			 * interrupting job won't end it, main job should take
> > > > +			 * care to end the spinner
> > > > +			 */
> > > > +			xe_spin_end(&data[SPIN_DATA].spin);
> > > > +
> > > > +	} else { /* Interrupting job */
> > > > +
> > > > +		if (dma_fence_job_spin) {
> > > > +			/*
> > > > +			 * A spinner job is executing in the DMA fence mode as
> > > > +			 * main job. Until we end the spinner explicitly, the
> > > > +			 * interrupting job won't be scheduled.
> > > > +			 * Make sure the interrupting job is still not completed by
> > > > +			 * waiting for on its user fence with a long timeout.
> > > > +			 * Wait is expected to end with a timeout.
> > > > +			 * After that send signal to end the spinner job. Once the
> > > > +			 * spinner exits it will make way for the execution of
> > > > +			 * interrupting DMA fence job.
> > > > +			*/
> > > > +			igt_assert_neq(0, __xe_wait_ufence(fd,
> > > > +				       &data[EXEC_DATA].exec_sync,
> > > > +				       USER_FENCE_VALUE, 0, &job_wait));
> > > > +			xe_spin_end(dma_fence_job_spin);
> > > >  		}
> > > >  	}
> > > >  
> > > > -	if (dma_fence_job_spin) {
> > > > -		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > > > -						   USER_FENCE_VALUE, 0, &timeout_short));
> > > > -		xe_spin_end(dma_fence_job_spin);
> > > > -	} else if (job_type == SPINNER_INTERRUPTED &&
> > > > -		   engine_execution_mode == EXEC_MODE_LR) {
> > > > -		xe_spin_end(&data[SPIN_DATA].spin);
> > > > -	}
> > > > -
> > > >  	if (engine_execution_mode == EXEC_MODE_LR) {
> > > >  		if (job_type == SPINNER_INTERRUPTED)
> > > >  			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > > > -- 
> > > > 2.34.1
> > > > 

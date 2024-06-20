Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3C4C2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C4A10E2FE;
	Thu, 20 Jun 2024 23:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfsTonac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327DF10E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925917; x=1750461917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IBBkibhUOcbAbFTmTrZ8pxGLouqN4IHK198siI22Bew=;
 b=TfsTonacCLhsRSIc7cNPUFQV99O8yjoQGVHeu7cjsv2olhSCCgfCN2xH
 4KhITPO38OMWdF39vW4jH+HgpP52iMLejJ7+9CTpxj0f6TboOJJhYvEah
 vPBk2aab7UovEuPufMXpzlECCZh9StQ7W4dS7IzggZOIVhaBxaInv9f8U
 qwpX7ggRvmtYtf7BQwX3XVAx7ztPO1lRnr+8eQ2WX5kJsxV5FbRuwPLgE
 KfFAfTTvomSDSfSXx7zY4m1CatOcAoXGMcCg2caTiZUtewDVffCx9lZou
 PKb38aI4sXyM7W/kr6wgJidujkld4RUXQQFQwKgBTdt3FvA7GocXcVnY3 A==;
X-CSE-ConnectionGUID: Oa02eIJDSiyGwfJ+dn63jg==
X-CSE-MsgGUID: n8qaveNbTv+flB4nL7S21A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26536009"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="26536009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:25:16 -0700
X-CSE-ConnectionGUID: 91b5OeaVQU+iS8KR8MGAhg==
X-CSE-MsgGUID: WGUDWsR9SLORf1YXT/KJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42308384"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:25:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:25:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:25:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqbtxIDwP0+983Rpo7uYOffs4Rxn/+xBiVuqQEuy+dtC7ZFi9EvPKdAefgLJ92Yyy9LXOxEjn9jO8DGp28jodN7LEu2FmSYaswiU43X+ZBCZghcC/FNjYeF1peu0NzDenKUOhAwEMQeBp27Qkpc2sT6SwCoCKNMawGqphrfLIipPx0cRXh2qrMOFAw1nMPACaSjz88MVAOLebv8spC0VsYOij+yIrZC1dQBK2EC5Uu5pc/mOxfcXT7UwbHmqfLMHjjwZi68MdO+a62FIUWbpjLlXghXchKXJMG/cXa1ly342utJ/tYIvusfEsmux0RCdb7dj8GvhGQH5L+lnoK3e0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwrwtnMQVaOM4w5VNEioWRU9/UJXvsFIERfQuzu6y50=;
 b=jBIOSyZnCL85a5v3CNzPQGMAYzx+aAzo1W65TZgk8akyxxJLxGUYGClYuEGrZzujzeanPYP0qYVpYMgU4ZAm37mABbD8xaItS5IAUb4o4qDE2m5YfO0RlkOd/0JTAMX0K+2xPJhRL/iqBpoo8CbxLii+YdCJhgqr8ymArVQnhUHPN6kpi2Dfpvu1RDLAMt0V9Q0KV+0AQxfCcJUzkfXaNQJhgT3NWcjb2ORrHxc5o89NlFNmiDrnDlwknzOeRYws1T1YtefOAcv8zkK6PyZIp5fdeeSgjkCDreQln23uXnMefgvtYzpK3j3PsyNPWthktU08blet03xm0DQTwH9YtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.20; Thu, 20 Jun
 2024 23:25:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:25:13 +0000
Date: Thu, 20 Jun 2024 16:25:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 09/28] tests/intel/xe_query: Add OA units query test
Message-ID: <ZnS6V/Pb74T++ZbW@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-10-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-10-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR16CA0067.namprd16.prod.outlook.com
 (2603:10b6:907:1::44) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b236e0e-cec7-4527-0124-08dc91803c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEdFTHNYTFk4bEFScXAzaTFsNnRRMjRmb094NnBPQk50Wm5wVmRpdzBwTnB3?=
 =?utf-8?B?eUxaOGd4VGl2OUVtUkxYVHMvUXdDY3FYNVFLMFZKU1BkSWFCRmhXOVFIUnNo?=
 =?utf-8?B?S1Z3L3NaZEJvaHpOTHNvNGlYZmxzV2FlSHZCQ1l6TmZ6RE1uZGFPM1o4Qzkv?=
 =?utf-8?B?bG5iekp2QnJWU2Y0NVJKaVRHT1BlNTNWVHM3V1dZS2ZWZmc3ZlYrSGEyUThZ?=
 =?utf-8?B?Y1R0RWhKQnFyT2RuV2hXckdvL0Z1bkIzbGUzSVZZVHR2aEtLcnhCQTlVMFFQ?=
 =?utf-8?B?Zkp4Y0ROWFZ2ckNLY3B4cVhkY3ZvVjRRaU9PSCtDVU9QakRYanRSRnhQVkpT?=
 =?utf-8?B?dWlpbzAvQzNSamdCMlRCTktGZU9NT1l5R2RXZlgraEJTSDEvampDTnBvS2Zs?=
 =?utf-8?B?ZUFtTWFQV0NmUGYxS0U0N1lrZU5SMEdNM2lGL0JBSWozalRWY2JsZ2ZwallX?=
 =?utf-8?B?STJuNXVOMTk4NnJZL201dmdyZmdRdnVJRVhWTHpTLzJYVjlFNm83RnljQlVP?=
 =?utf-8?B?WkpTWldnZkZyRnErbmw5emEyNmRsbGtPSms5N0VLZDh1b2sxOWJ4YlFTV2xY?=
 =?utf-8?B?cHBHOE0wK0RaWENxMUxUNDB3MjI1d0FORW8yN3NhRkcvbGEzWk1oLzFUemNH?=
 =?utf-8?B?Z3VLdjhBN2diM0xMaDFVMUYyWHAvSSszSlkxZVVET0tLTGN1WnBodTJleVJu?=
 =?utf-8?B?OENUaE5rN3BOOWhabE5JUzlNc01qTTRUd2h2cHpqa1RSczliUVVyWXFQQ25o?=
 =?utf-8?B?blo4Q21BdHN3WEFrbGxHczFrYmxRMDArdkdUbUt4NDllbUtvL1A0aTVNUmZv?=
 =?utf-8?B?bWJ6bERCMC9hRFl6ZlFKOTlPUVFDMVBtM1ZHcHNqVi9kc3hNSXkwTnp2RzBn?=
 =?utf-8?B?Z21XSFFCNHMzbUc2L1IxWVJkQVdjc3M0bmk3bDJDSUdYNmtMMUdkUnp4ck8r?=
 =?utf-8?B?OFNTeWQzMDFCTTh2UTg5RER4bmdna05ZRnBvMWY2M2FaRTErNEUzcFFGYlpj?=
 =?utf-8?B?TkZtcVU5NGVBbGdCK3djRDhaanNPa1k5aTRINmRNSy9Yc3padXcwekpOMkt2?=
 =?utf-8?B?MnZFWU40Z2NPVURHWmZ6MUxVR0FnL2p2QmQ0MmQxVzVVSzV4SzhPSGlrRnV3?=
 =?utf-8?B?eHRVdmFaejZtWC9PSUFuemRtb3JhaTM5MVJtNFBYTzBzN3QxYUJacWhSU2VS?=
 =?utf-8?B?Z1h5ZFplWnpCWTdXM0RvWkIrM0RsNGdLSktpdUFkTGc1cVMvYWI1M080dnBC?=
 =?utf-8?B?TDJaZUFjZGVrbDJGOGxueVBrcWt3OXViN1ZqTS9EOVkvRGVDMnlVeUJYOEx1?=
 =?utf-8?B?WTBoL0Y3TGJlRzMwdFVhWUZCMEZybEhPNXN6S3ZXN01kSHZtdWNuSGNFV0JU?=
 =?utf-8?B?eTBIck1LamV1eWExdDBrMnM3N1hsMlVONGN6bTBTTWViTG5FVTBncnkyeFlu?=
 =?utf-8?B?anhtV0FxSFVzYTdDbDFBL0NqdDJLTldnbjY0Vi9TVUV5NHNQdC8wMUk1VUo4?=
 =?utf-8?B?SmNmMnF6aHQxMUpwL2pXMFdMVnJmVllCbWJKSjNSRjduS1RjWnB2OVdkSVNQ?=
 =?utf-8?B?eEdYbVpMUjFwMHpMU1dWOG9jRGxlaDBFRVVTdjRQYXBXeE14T2U3c1RLRmJX?=
 =?utf-8?B?M3hsU1ZyQUJxcjhHTlpJTEtneXdXazFPeHdITWphbnpubTVYQW04aWxaZ2lq?=
 =?utf-8?B?Yml6aE92VzFOdEdCWk5EWWIzeEJ2bURQTnFYRFFFQ3Y0UUxaMTR1SWx5eDRu?=
 =?utf-8?Q?lZ6nKJYNqg8UN9H4RPYLu4wU2BqIT5mNKGcZTJ7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFYM2tSZDRMNmdKRTF0MVNqdkJFdVF3WXZRbkNYQ05DMXhRV3I4Ui9PbG1H?=
 =?utf-8?B?NXlEMXZPc0lsbXFnKzdqOGVUb0NaandhRUVCbGZYVEgwc2lsdVhGMEk4QVEv?=
 =?utf-8?B?ZnZiaytnVndJaUJmMGlWSXR3b2ZYdUtRZmtpNUJmbmpIMVl3WjNNRVEyYVBn?=
 =?utf-8?B?ekNyQ0pkdWI0YjJXMkNzZlpjeUZBaE1sREIrVnVGM0ZXejl1UksrdG5Sckpy?=
 =?utf-8?B?UFVWN0RrM2daSVNrZGIrOG1TVUVPd1hQM3ZDZ01jRVorR2xqN2ZiNWZqajJi?=
 =?utf-8?B?bWxvSWQrK2lMZ1BNVGE3ZEZjaGZBWmtzL2s3T2lEbHNKSmNDQU5xMDdGakMr?=
 =?utf-8?B?ZDNvRkVYNW5sdmNxSFo4QVJDSkdpK1UyV3pJZFJZTzAxMlJWVWZkZFBkWklX?=
 =?utf-8?B?STN1bWlDWU1DUkNPQ1EzNkJ2Z1F0Mmhzc3grcFRJdkZoc1JQeEZVRnVpYUdn?=
 =?utf-8?B?NU54RUJQYlpFNmVZQk14ZzZvRVFFTVV2aUhvTldHRGpiOWpzeDFOU1l3dWty?=
 =?utf-8?B?enArWVFUU2RpNVB3bnRMS3FoODNOU2dnbGVrWVJpYkJiekE2SkFVcVFrZ1A1?=
 =?utf-8?B?VGZKeGY0QTBMY2JJSHBNNGcrcHd0cHFkYWIyTXpjQUl1Wm9rWWEzbGpxVnlH?=
 =?utf-8?B?Mmx1QnNUTzV4RTgwdlVPdGg1RkJ4eHdCSHY5SU1reFRCQzhrRTlLcGJXOFJU?=
 =?utf-8?B?dThKR3haanJlazRERlRVTEQvZVhsZWMwajdwUTVEN2FKZTF1ckV3NVhwU21W?=
 =?utf-8?B?Y3lPUll4T1VHWTVoYm9hSnVGeG9lTDBZWTBuZC9MdnhsSWlWNWxZTWcyUjN5?=
 =?utf-8?B?c0xhbWo4QkNOT09IN1NXWkU5VXNmazJ4Sk5FeDBHblJubm9scWJWRE9NS3h5?=
 =?utf-8?B?NU5Dc1VhTmYzVlMremVtNTFxd0swS0RLdXM3NDRjWnRkdU4vaUlYK0FKV0l6?=
 =?utf-8?B?K0VlOTRqQ3B4NXVvb1puSElMRmxGZkMyK3hIT2l0elFGUGk0NlU1Rk12a1FU?=
 =?utf-8?B?RHR5dUxRdmVNZTl6MUdBQ2IxeDNRYXVpWWd2RnZRN3dnY1BTTmI1ZGtwY2dH?=
 =?utf-8?B?eWJWSUFTcy9nYnk5UThyT3E0djlpNmJSS0UzZ1g1RVpJY1ZGUjZTaGlIY1ZP?=
 =?utf-8?B?YlY3am9sUFg4WUU0K0pSSSsxVFdOL09SZXFmRUNDQ0NFbkdrNXRjNnZxazR3?=
 =?utf-8?B?MUJ4MjlUaFJyMHdyTFA2NVovWTVBaVVVRGM1ZjFSL3JiYjBFMng4cjJjR2J3?=
 =?utf-8?B?SktGbjEyWENneDB6UWI4TkRYRk5lSFlFUHBRMHN0R000WGVsWFhCaGhsTS9x?=
 =?utf-8?B?VFR2NDBKZTFPVXJHTXJIWU1YeFMzUUQwMVg0NzlnRHByYU5ZUkcvM0dUUEJO?=
 =?utf-8?B?dk04OHVSUGhQUEVuZ0FoRExGSWlKdG14dzF1SjJGUGpBcHJ4RStZalEzZlcz?=
 =?utf-8?B?VEVxQjNJL1ZyRWVFMlNJK21LS2FMRDR3OVRFZFZGcDNvN21mTGlnTm5Dd3Ew?=
 =?utf-8?B?dmpvcnhYd3ZjbGlFY3FJL1RRQ0Faa3BiZHNjT0x1dU5GMDNOaDJMdGF5OW1T?=
 =?utf-8?B?NG04aERSUkdqQnRSYnd3MUdNWGtXbmoxMTFkY3M5TndCT2Fxeit5STQ3MjF1?=
 =?utf-8?B?aEdock41NkIrME1zVXB3ZmpubXdpSVlBYlBpd0V3UkNFRGZVS0lqNTY2MWYx?=
 =?utf-8?B?YXZZL2Z1THBvVXl1ZUwweE9BbnpIamlDM2c0RjR0dUZUYnRNYkZpTmxLZHpG?=
 =?utf-8?B?WnppaEJLSWRYYUs3QzVacXpKeXV0SGxJU1YrcmV6VnduYzdoQk40UkdKeXZz?=
 =?utf-8?B?WTZKZWd3K052MkdvSTg5NjNLdkhMVlB1Qkx0dG4yblF1b1RWVjgrRkNBQ0Ir?=
 =?utf-8?B?cUw2cmtINk5ZTE1yY0lMUXZyK1ZFWmF3ajFBb3dabW9ZOE1CQkx6V0RzWnd5?=
 =?utf-8?B?ckVOUmtZelkxYlZQZDhTc29rUGsyUFYyUm9sZG0vNUEwUHZYeHBZVlp3M1lP?=
 =?utf-8?B?M1hJbnJGNGNxWXFNTFpFTXN5azd0dG54VWhSc01sSkhDNHpsalFNZlNnaGp0?=
 =?utf-8?B?VTFZNUIreUNPUDJkR1ppdXpXTHF0SDJBbnEyREcxMXYxOGQ1LzZsTmxmUjhk?=
 =?utf-8?B?Z0tQSy8rUHN3S1FIVjY0MHU5Q004cmdranVpdE56L1duWlNEUm5yd0lOUUty?=
 =?utf-8?Q?A0G8tP2UvOXvAexMy3+boEA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b236e0e-cec7-4527-0124-08dc91803c3c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:25:13.3191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uUyOFsb+Kgktm27r+wNbkLwRSwO0WTGK19V6ek8T8mldt0wcWc85SWmnFW6IgABamdUZAAKuYk0bd4mp6qAOEZwHO8dG5NORx9bCjr808Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

On Thu, Jun 20, 2024 at 01:00:34PM -0700, Ashutosh Dixit wrote:
>Add test to exercise OA units query.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_query.c | 53 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 53 insertions(+)
>
>diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
>index 5b0db4d28b..92f82f6eef 100644
>--- a/tests/intel/xe_query.c
>+++ b/tests/intel/xe_query.c
>@@ -995,6 +995,58 @@ test_query_uc_fw_version_huc(int fd)
> 	test_query_uc_fw_version(fd, XE_QUERY_UC_TYPE_HUC);
> }
>
>+/**
>+ * SUBTEST: query-oa-units
>+ * Description: Display fields for OA unit query
>+ *
>+ * SUBTEST: multigpu-query-oa-units
>+ * Description: Display fields for OA unit query for all GPU devices
>+ * Sub-category: MultiGPU
>+ */
>+static void test_query_oa_units(int fd)
>+{
>+	struct drm_xe_query_oa_units *qoa;
>+	struct drm_xe_device_query query = {
>+		.extensions = 0,
>+		.query = DRM_XE_DEVICE_QUERY_OA_UNITS,
>+		.size = 0,
>+		.data = 0,
>+	};
>+	struct drm_xe_oa_unit *oau;
>+	int i, j;
>+	u8 *poau;
>+
>+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+
>+	qoa = malloc(query.size);
>+	igt_assert(qoa);
>+
>+	query.data = to_user_pointer(qoa);
>+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+
>+	igt_info("num_oa_units %d\n", qoa->num_oa_units);
>+
>+	poau = (u8 *)&qoa->oa_units[0];
>+	for (i = 0; i < qoa->num_oa_units; i++) {
>+		oau = (struct drm_xe_oa_unit *)poau;
>+
>+		igt_info("-------------------------------\n");
>+		igt_info("oa_unit %d\n", i);
>+		igt_info("-------------------------------\n");
>+		igt_info("oa_unit_id %d\n", oau->oa_unit_id);
>+		igt_info("oa_unit_type %d\n", oau->oa_unit_type);
>+		igt_info("capabilities %#llx\n", oau->capabilities);
>+		igt_info("oa_timestamp_freq %lld\n", oau->oa_timestamp_freq);
>+		igt_info("num_engines %lld\n", oau->num_engines);
>+		igt_info("Engines:");
>+		for (j = 0; j < oau->num_engines; j++)
>+			igt_info(" (%d, %d)", oau->eci[j].engine_class,
>+				 oau->eci[j].engine_instance);
>+		igt_info("\n");
>+		poau += sizeof(*oau) + j * sizeof(oau->eci[0]);
>+	}
>+}
>+
> igt_main
> {
> 	const struct {
>@@ -1011,6 +1063,7 @@ igt_main
> 		{ "query-cs-cycles", test_query_engine_cycles },
> 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
> 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
>+		{ "query-oa-units", test_query_oa_units },
> 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
> 		{ "query-invalid-query", test_query_invalid_query },
> 		{ "query-invalid-size", test_query_invalid_size },
>-- 
>2.41.0
>

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBC606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ntEU37/x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366DE10E3B9;
	Thu, 22 Oct 2026 16:12:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A78112792
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792685483; x=1824221483;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=hNcnGg8lUeRVwzi58qhjA1KC9y5tH84hXvxahDjvkUQ=;
 b=ntEU37/xWHxUxJNx2ovMpLsYebj96h+eXGysqXrFfUwvx9oDa6ic8z/1
 opCiSFH9HhYPc38RH4bJ6EUyzWPFm0jInq986bGhLSipDidk4+pzbMrbg
 oUqNIqKhaiqO9xsSUiRO4cRb+poc6cHtd7/L6z+AlBcyjNKEJqMkyJX/4
 gkVSFjwtuPECI0TTJe3rTV/Z4LHhh8LXsAwb/x4rYL+u7cjLkwckLpi/P
 sE/rua8Ml2/Y5+3UXh4yDKct+0EbsuJtSfkw81TSjLDZv/SiN/GYVXN6+
 KnwGBN1DqXiCdCw9wKEsNRk8MW9ETl1VDmOGpTZdQ7ZFrqv0OjfZGvs09 g==;
X-CSE-ConnectionGUID: uweHu1/5TsupegLm34ZXnA==
X-CSE-MsgGUID: LxsrwUE2SmeF71KFs3o50w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1317153"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="1317153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:11:22 -0700
X-CSE-ConnectionGUID: hhziPFCCQh21mNvwHCfuiw==
X-CSE-MsgGUID: yMx9FYMPSGaHaEPxjqVNFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="3747972"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:11:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:11:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:11:21 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yT8xcCizNzpib5IOKGv8hAlI+QpKM9hmfkvVdQC0aQ/WYkCntqTLVEskm9d2kyFqn3O+vmmaXE1YUnBlKOCBoE+vUoM/c/aWWIkgXfau5M3YYiQxgFRGrOmUgh2e2RShi7H6iPWuBSc2LGxppiakmnXh7UIGzy18pMuqKgAdn17OALYACVETrUeaoaznnoYB0LJSZOXLG7Ua+EFw25MFay+UpTMAZdJ+8eMBQFzz5sQGga2G8dBipMLUmOML+v/l6htfJyUK2K+Kf0W9sxc3cS/r5Z2V63JLxoIMIC28hjuG+rQ5DiQkH2rArA+OUt3U5W30JBgYgo5roThnubnYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgnMhhuU8ioLqTvEhR0ouX7w0ULy6ZUOOTpoAdhcTqM=;
 b=GIw1B0EBq/VjdYExIYOpCmbfoTpOxF1/w8nLiMeUW2ebuh7/67z0VialSGk2a/MPpfVhn8+o5s7LqpLWUQ17k8Pd61VCsILhSU0rPRwpM2D8djDj2HxOffNsX8hHCjQCzWg/KS+Tsm/Idr2XJ1h2f+sJ84f2JroOjTXPTOgrh0hfLTJgWQ9WiGLlF+rDiqmS5CaAfPCHgJ0+ANvevaYWBfBBDLKtgCPWaUmwDWgV6/NKnLPpebevDQ3pNthDkx/G10/36zaz3WfX7P4MSRuq435I94OfaY5lUarEBgpf3UrykyaaeALqQ/XiqdnDnlC9Fj0MsLtnA9VJ+uZyGK1ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Thu, 22 Oct
 2026 16:11:19 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:11:19 +0000
Content-Type: multipart/alternative;
 boundary="------------XqbLUAOKrPG1wYDqq6LH0epE"
Message-ID: <0f394435-4ca7-4a39-84f3-57db6555864a@intel.com>
Date: Thu, 22 Oct 2026 21:40:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on
 simulation
To: <igt-dev@lists.freedesktop.org>
References: <20261016052243.633897-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20261016052243.633897-1-pranay.samala@intel.com>
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: dc778b91-4609-418c-0140-08df30571b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|10067099003|261021121427099003|8096899003|3023799007|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: rvWl8fRuBisA3D+lfHe/hhkUXLmiT6uvgdApln4mvUmKQqgLVIDbVuE7b0TGNLVNFZN9d6BahSuZQ/02FB4obufyJdUoo2rJkwThvJWFiSestFUwke85H8XPlJCL5UJJysAn8zJPWE+xtNx3HxeVNnr3m2hxOPT/XdXQgxTSnwuWmFUe/4OQCJyvKIylELJ2FS6SHT2fHcjQiunPZNAeG18zY1DPemZlM66tbL3oNiUxGnttwG/gv3anaipGaMJDt5MbNd1Wmj3GG5IDn6bBAyjeTm0txRHuBAMTdtPkDYn2JHFZKtfCEWcQ77Pilf8ltuc4vevMxuBfh6mFUouEwHx6z31USCe1/2StSu4u6gnow+HIRpTGhjiT45Wc6Qc48Jmc7ki/7VuJHWcwRhvQjkHX3FtAa7Y8paRVeKGQktb8qnPF8pTgV3Vy1sA5jItSKERiDfYXY1S7oO+pddD+jogM/zVJ0UPRPh/QujwglyGXdlOzwoYkEhc1vz+gMK7J2BHpSxFW7qo2opf9pDAd1PGU3/QDfJz472O+3OfKpkjp87ypJ89tUx9cV27I0+IUuiS4SUuiYK4/oGynXmEB9GTC1X7V/oVaA7KpoP3MSnxs+LmQtIJJDGn/XmI4qT2EyLEOSdDZvlbAzw5I0ybLzXnURfSc2BnPlA/wkiJRiRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(261021121427099003)(8096899003)(3023799007)(261021123027099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEwvM3Y5MUpuK2poenkwSzhjalBHZHFCTStWMnl2enNWZys5OUxBVkllaEdB?=
 =?utf-8?B?N1lHTnVmUEhuRXVkcCsrdTFvSzVnWjJEb0xiT21VTnN4YlowdGlDOHR5ektK?=
 =?utf-8?B?ZWhpVi9vMW5GeTAyTVR2NlgwMUdla21JZHlvODVmMkVMSG5LTFlMME5pS3ls?=
 =?utf-8?B?WWFQMG90VVBpZU1VdDBNTFppMG93SGNhSVdkYVF4bmNqZEkxT0tvQTJVQmtS?=
 =?utf-8?B?blEwUXFraTdoZkFPWHk0TnE4SHc0VGdkVkp2VWpOWHZ5ZnhjYmlVYUFvbHRS?=
 =?utf-8?B?ekw0OFhUbTU0d0YxZDdqZDFPSEVQRTJLR2JUZmxIUkYzVHdlWGlaMEh6d0dH?=
 =?utf-8?B?aW5iNEMwaGI0bUZkWktPYUNWZThKdVhibWlhQUh1QTRtMDRJbzg1RFVxbFBQ?=
 =?utf-8?B?S3RxbnZra3U2a09ZTloxZkRPRm1XeWs0OTVBcDBvMmRVVEZEUDQ1WkhpNytY?=
 =?utf-8?B?KzN2WnpVTFBoWm01ZlBvYXJtOUlSdjVudDR1UXkxbE8xRm1mV25jSzdIRElv?=
 =?utf-8?B?Szl6U0tzOElqckdYZzZhZnc3cHF5TWZlbWhZeTNyUFF1Y2ZJcTZZWDU3MjdS?=
 =?utf-8?B?bUJkMFVlVEpPalZGUjYxZHQ4d20ydFhwYS82NjhkYmN2ZzVaemJDcFFQUlkr?=
 =?utf-8?B?YWJsNkR5S2hjOEdGd3RUQkttWnRmN3ZJakhuU3d6VkNleUpMRXQzVE4rTi9W?=
 =?utf-8?B?YXYwYVZkZSt4S2FFYURuelE0VUtpaEVoMERQU0xZRnJHVXBMcElvYm16VUFr?=
 =?utf-8?B?SEtGTWtDN2grYkFlUGRwVFVSL3FkbkwxUGRGQ3pmdzNCTzFNZWJEaGZDUTN3?=
 =?utf-8?B?Z3BxSld4RU5jamhMd0w0NEFwWnNtSEVOZmQzMldyaUdLTnRYb3I5UFZ4QjJS?=
 =?utf-8?B?alhTT01PTnQ3VlNTN295Tml4OStUS1dsVEREZFUzeFZjaTVydXNPSnE5bmhs?=
 =?utf-8?B?Q3VHbUtBQWozeFBWd25oV29jczQxeTB5VU5idy9vR080YStBQmpVdjZtNmlX?=
 =?utf-8?B?UUxoZ212eTBCVDdaRmllSnVHNHA1dllPTkp3a0taQ1l5RVB2U1V4UVVqTEw4?=
 =?utf-8?B?d1lVNWhRRkREaXUvL202OVhJRE44VEZzYUQ2VGZkY3kwelRydXRIelFNREJZ?=
 =?utf-8?B?Z2x2TithbmVVTUVadjZxNzdud2Q0eFZQWVducFQ2THp5RzY5KzUrNVgyNytX?=
 =?utf-8?B?ZjN2azQ3ZDJpWmJYK1RyYmlzd2pOZHUxd1RvQzl0MnJ4OEdSbDFxY3BGKzRE?=
 =?utf-8?B?Tzhva1NncTNxcENXbGlZZjZzaHdxbk44MUIvTm42bElnSUFXa0ZwaWNKTG5Q?=
 =?utf-8?B?TWo2aEV2a1FBbVVBRDUwcGFSaWtuTlBxcndFVUxQbm5oajZJSWtReGt2TTZB?=
 =?utf-8?B?emZxcDRua0xjOTFZckJLdExSTzcrTVBZRG9Xa2NCODVLS2xRNUxVaFU2ZTBJ?=
 =?utf-8?B?TWVmbUpreDhCYzV2a3Y0ZnZSRmlkOFpmVzdtQWJjQWdrWmU0V1ZTS0VVb0Vw?=
 =?utf-8?B?dC9tNEUzQ2RybFJYeUxhVG14TDBEVGRNWEJtaXJiM1VXQVJDdXlxc2dtM1Av?=
 =?utf-8?B?VkVJSFg1NWUrZlFwdC9taWRGdWp6c3NUd3k1YXZaSjIwbHVVdDREV1E3VFhR?=
 =?utf-8?B?L1ltMm8ySzd2K2VzZm5BSDB6aWd6aFQvRC9oUUF2WStxVkVhWGsvMVpqM3hh?=
 =?utf-8?B?TDFOTDNZR0ROSVNKdW83aER6ZlNBdnlueFBweEI4UFNGSzM4aVF3WUQyZ0tk?=
 =?utf-8?B?b0FZSFdnQkQ5SWJOZFN5b1phVkRMWHRCTVo0NXZKU3A5SFA0QTRVajFZY0R5?=
 =?utf-8?B?YkFRYUt0Y0lOUnYrVUtpSXYwVHBBVGJUay94WVIxanlIb1F4RDZkaG5EWVB2?=
 =?utf-8?B?d1VYWHUrTjdEZU5za1BnN3JlU2xLaU0yQ0dNcVBZRWlMY2h1dEhPYlYxd0Fn?=
 =?utf-8?B?eCs3ckozSXN2Sk5JaUEwc09ZY3J4UGk1SzgyYkozQlVhVFlaTGhGdnU3dVVR?=
 =?utf-8?B?TnlkU3BlT3h1d3FDM0JlNVRBczNkbDJkZFhDWUhTdzNzUXluSk1QNmp1VDZG?=
 =?utf-8?B?bHdBUHRxUHpncUMwS1c3TXcyV0VQaitEcTJqanAwdFZLNFF2V0V6d0lsNHM1?=
 =?utf-8?B?aFdNNGNycGxZM3Z2OHNQMm1tZFNsUzNxMFpsMTNlN1dNUEhXTXhGUTNUVFNN?=
 =?utf-8?B?NTIreVhZMWV1aG05UWxKTmxFcDZUS0wwM29vYmYzWDk5VERucGt1UEpFa2Vy?=
 =?utf-8?B?MGtIWjlaRU05c0JiRE5KczFHQ21TWnRNR3Z2TU5NajB1V2M1QVpXdFF3VHlF?=
 =?utf-8?B?aUNLdjBNbVhjRzV6Y1ZtRGpMZWVINHlWUCtiK1B2cE04aVJRYmJjQlhKUytF?=
 =?utf-8?Q?TORC3W8Vn0K2l4OU=3D?=
X-Exchange-RoutingPolicyChecked: DYnhYKhdw+nAa86d5yex3BPnjuP8wRjE7t8hgG0b0p//mvFkJGtYnWYfGgGWoHuYb/x7XQhRyHSn+OsYgYifMGWQnlraYXmIQ4ciYY5A3AjVHXpgstihNDmO+CfJqZy52bzpbbNqugItqoLuVQrcheIGkFInGkqNVPJvF/FmMVqPg4sk79xfKU/tSZRo7pc8LHYfNlQhXyS2Sfq+BkMNYMQJBhVI3A3cNZs2ou0CLDBau8xfxvQGCVOWQTfRXL1BbCxd41phYzjc0PSH0fTMhFuzt5qZuHNxtgyI6wmH85rhdenNRuJwyrrRFGTlKFx3Y8bJDbxXokN7OISvXhsdsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc778b91-4609-418c-0140-08df30571b9e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:11:19.4770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnlC9/49Vu/U0W7HAkwtzpJ8HKK3oSLh9xL80b9SnQ/6lOFH2wQgeheoJXx/pZsEo4oTNgNljcXtJk3oL4VV6b52gbxvKKNbSQH/gvqm8jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------XqbLUAOKrPG1wYDqq6LH0epE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Pranay,

On 10/16/2026 10:52 AM, Pranay Samala wrote:
> The test creates, fills and copies full-screen fbs with
> the GPU, which is too slow on simulation, and test hits
> timeout.
>
> When running in simulation, limit the fbs to 1024x768.
> The CRC still covers the whole pipe, and the reference
> and test frames have the same layout.
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/intel/kms_dirtyfb.c | 30 +++++++++++++++++++++---------
>   1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 48fcb6c61..4674bd2c8 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -50,11 +50,15 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
>   #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
>   #endif
>   
> +#define SIM_FB_WIDTH   1024
> +#define SIM_FB_HEIGHT  768
Using a hard-coded 1024x768 framebuffer can break on panels whose native 
resolution is smaller than the simulation size. On panels with 
resolutions smaller than 1024×768, the test may require scaling or may 
not represent the native display configuration. Consider deriving the 
simulated framebuffer dimensions from |mode->hdisplay| and 
|mode->vdisplay| to keep the test portable across different display 
resolutions.
> +
>   typedef struct {
>   	int drm_fd, devid;
>   	int debugfs_fd;
>   	igt_display_t display;
>   	drmModeModeInfo *mode;
> +	int fb_width, fb_height;
>   	uint64_t modifier;
>   	igt_output_t *output;
>   	igt_pipe_crc_t *pipe_crc;
> @@ -106,10 +110,10 @@ static bool check_support(data_t *data)
>   		}
>   
>   		if (!intel_fbc_plane_size_supported(&data->display,
> -						    data->mode->hdisplay,
> -						    data->mode->vdisplay)) {
> +						    data->fb_width,
> +						    data->fb_height)) {
>   			igt_info("Plane size (%d, %d) not supported as per FBC size restrictions\n",
> -				 data->mode->hdisplay, data->mode->vdisplay);
> +				 data->fb_width, data->fb_height);
>   			return false;
>   		}
>   		return true;
> @@ -234,8 +238,8 @@ static void prepare(data_t *data)
>   	data->pipe_crc = igt_crtc_crc_new(data->crtc,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> -	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> -			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, data->fb_width,
> +			    data->fb_height, DRM_FORMAT_XRGB8888,
>   			    data->modifier, 0.0, 1.0, 0.0,
>   			    &data->fbs[0]);
>   
> @@ -256,8 +260,8 @@ static void prepare(data_t *data)
>   
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
>   
> -	igt_create_color_fb(data->drm_fd,  data->mode->hdisplay,
> -			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, data->fb_width,
> +			    data->fb_height, DRM_FORMAT_XRGB8888,
>   			    data->modifier, 0.0, 1.0, 0.0,
>   			    &data->fbs[1]);
>   	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
> @@ -265,8 +269,8 @@ static void prepare(data_t *data)
>   			 0, 0, data->fbs[1].width,
>   			 data->fbs[1].height, 0xFF);
>   
> -	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> -			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, data->fb_width,
> +			    data->fb_height, DRM_FORMAT_XRGB8888,
>   			    data->modifier, 0.0, 1.0, 0.0,
>   			    &data->fbs[2]);
>   
> @@ -382,6 +386,14 @@ int igt_main()
>   							      crtc,
>   							      data.output) {
>   					data.mode = igt_output_get_mode(data.output);
> +					data.fb_width = data.mode->hdisplay;
> +					data.fb_height = data.mode->vdisplay;
> +					if (igt_run_in_simulation()) {
> +						data.fb_width = min_t(int, data.fb_width,
> +								      SIM_FB_WIDTH);
> +						data.fb_height = min_t(int, data.fb_height,
> +								       SIM_FB_HEIGHT);
> +					}
>   
>   					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
>   						       "FBC isn't supported on BMG\n");
--------------XqbLUAOKrPG1wYDqq6LH0epE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 10/16/2026 10:52 AM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261016052243.633897-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">The test creates, fills and copies full-screen fbs with
the GPU, which is too slow on simulation, and test hits
timeout.

When running in simulation, limit the fbs to 1024x768.
The CRC still covers the whole pipe, and the reference
and test frames have the same layout.

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/intel/kms_dirtyfb.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 48fcb6c61..4674bd2c8 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -50,11 +50,15 @@ IGT_TEST_DESCRIPTION(&quot;Test the DIRTYFB ioctl is working properly with &quot;
 #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
 #endif
 
+#define SIM_FB_WIDTH   1024
+#define SIM_FB_HEIGHT  768</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>Using a hard-coded 1024x768 framebuffer can break on panels
    whose native resolution is smaller than the simulation size. On
    panels with resolutions smaller than 1024×768, the test may require
    scaling or may not represent the native display configuration.
    Consider deriving the simulated framebuffer dimensions from <code>mode-&gt;hdisplay</code>
    and <code>mode-&gt;vdisplay</code> to keep the test portable across
    different display resolutions.<br>
    <blockquote type="cite" cite="mid:20261016052243.633897-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 typedef struct {
 	int drm_fd, devid;
 	int debugfs_fd;
 	igt_display_t display;
 	drmModeModeInfo *mode;
+	int fb_width, fb_height;
 	uint64_t modifier;
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
@@ -106,10 +110,10 @@ static bool check_support(data_t *data)
 		}
 
 		if (!intel_fbc_plane_size_supported(&amp;data-&gt;display,
-						    data-&gt;mode-&gt;hdisplay,
-						    data-&gt;mode-&gt;vdisplay)) {
+						    data-&gt;fb_width,
+						    data-&gt;fb_height)) {
 			igt_info(&quot;Plane size (%d, %d) not supported as per FBC size restrictions\n&quot;,
-				 data-&gt;mode-&gt;hdisplay, data-&gt;mode-&gt;vdisplay);
+				 data-&gt;fb_width, data-&gt;fb_height);
 			return false;
 		}
 		return true;
@@ -234,8 +238,8 @@ static void prepare(data_t *data)
 	data-&gt;pipe_crc = igt_crtc_crc_new(data-&gt;crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_create_color_fb(data-&gt;drm_fd, data-&gt;mode-&gt;hdisplay,
-			    data-&gt;mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data-&gt;drm_fd, data-&gt;fb_width,
+			    data-&gt;fb_height, DRM_FORMAT_XRGB8888,
 			    data-&gt;modifier, 0.0, 1.0, 0.0,
 			    &amp;data-&gt;fbs[0]);
 
@@ -256,8 +260,8 @@ static void prepare(data_t *data)
 
 	igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;data-&gt;ref_crc);
 
-	igt_create_color_fb(data-&gt;drm_fd,  data-&gt;mode-&gt;hdisplay,
-			    data-&gt;mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data-&gt;drm_fd, data-&gt;fb_width,
+			    data-&gt;fb_height, DRM_FORMAT_XRGB8888,
 			    data-&gt;modifier, 0.0, 1.0, 0.0,
 			    &amp;data-&gt;fbs[1]);
 	igt_draw_rect_fb(data-&gt;drm_fd, data-&gt;bops, 0, &amp;data-&gt;fbs[1],
@@ -265,8 +269,8 @@ static void prepare(data_t *data)
 			 0, 0, data-&gt;fbs[1].width,
 			 data-&gt;fbs[1].height, 0xFF);
 
-	igt_create_color_fb(data-&gt;drm_fd, data-&gt;mode-&gt;hdisplay,
-			    data-&gt;mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data-&gt;drm_fd, data-&gt;fb_width,
+			    data-&gt;fb_height, DRM_FORMAT_XRGB8888,
 			    data-&gt;modifier, 0.0, 1.0, 0.0,
 			    &amp;data-&gt;fbs[2]);
 
@@ -382,6 +386,14 @@ int igt_main()
 							      crtc,
 							      data.output) {
 					data.mode = igt_output_get_mode(data.output);
+					data.fb_width = data.mode-&gt;hdisplay;
+					data.fb_height = data.mode-&gt;vdisplay;
+					if (igt_run_in_simulation()) {
+						data.fb_width = min_t(int, data.fb_width,
+								      SIM_FB_WIDTH);
+						data.fb_height = min_t(int, data.fb_height,
+								       SIM_FB_HEIGHT);
+					}
 
 					igt_skip_on_f((IS_BATTLEMAGE(data.devid) &amp;&amp; data.feature == FEATURE_FBC),
 						       &quot;FBC isn't supported on BMG\n&quot;);
</pre>
    </blockquote>
  </body>
</html>

--------------XqbLUAOKrPG1wYDqq6LH0epE--

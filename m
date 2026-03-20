Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B0C109317A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 05:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5039210EA7C;
	Fri, 20 Mar 2026 05:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Anflh7X/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148EB10EA7C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 05:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773986018; x=1805522018;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NFD3JjPckCSuYZRsVrP/mOJxVykLxYxJVntyjySEblg=;
 b=Anflh7X/9pcydBviCxG52SQzvsQosx2S4HGpDGFcrE0CeQ2HTKf49Xlq
 topxQjUK2wtuLAl3CPuFMNh21y0DdvPUXt0cjZSsuYi69Vfnw6lFGFY36
 cyZPPaxmVOH+R5HWOug75Qs7n8nbKBQ2ynONv0lMNeVrPb03aH8zyrf0s
 udkHRun8n7wQh1nemgjeuLJF0CRiC55nf4VI7UHR5ZoAx7H13vVw96rWp
 E48hxeJOw52r7NFupP+AqssFv/Q30+/54XR3T7oFhrLCH3waC2SV0Y+k/
 zEpcjuDdvcCCnf+zHBNA358UrcvP283nkB4okE07D8sLI5+24uUziYqvh g==;
X-CSE-ConnectionGUID: GnwS+Q9YQAmPp5ceQBxHcA==
X-CSE-MsgGUID: sn7yqqwYRymZhfvikJ/00g==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74082509"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74082509"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 22:53:38 -0700
X-CSE-ConnectionGUID: +hwUvuRTR9G80Ka6Ur8m9w==
X-CSE-MsgGUID: lxvULpEJRzOhSNwZGDUyAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222284225"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 22:53:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 22:53:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 22:53:37 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 22:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2ENfC+dFNY6/D/BsjUv3BC6a0keC+lS2IgsgMgyhRc5IdmNYdav50hzmUIHDdvXirr4Y3NhTYMAlvVldVpSjxl1WDrkFAODRERiCpDqtSb7m1eRhHBm3TbpyahT6ZYK6wFsyoDXRu7FWQjax3jXmuOaIBtA2veMOY/+0WT3eQvqYjhtPgR6uAw5MIma0XzaujCX6OzOyC2CVGQISTfHCcmNWi03Rq37quH6ZDjBNCUQRDo6ijG37uBVo3an3aR6rRAkntOOrjVxB/mRdxAdyzBML6/Bj9Mk4x3C9BpxQqVvAm/K98tybki+UPdP2EYj+zB9IWxpNms0UBrnI+3b+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZgs2X3N27f1nYNH2HEVo35iwQNOKpmnqLIKCLz9PEA=;
 b=BIRkczggyEKoOhzMz3rRR6AMeKaGpnI7C4MjGNBIB1DBlOxPF9PvVulSomoQJn666BLgLroVsZiB5XwGG8cAy4MZ+brVZC1qiueIlt6pKcH5XaciZhlviWcmCuAkqLzhCtkwY09cJlN4NElusTRBYpmFf261vAclXckv4HuAfycKAGMpp29YWfsmbicA4BsQdaqa/hVuMRHeffC12IxxLX4gjKe/7J4dC//6mT/K2TvVFkPWpsbWdF62WdV5WHLsd6kpcyCW2k+w8QauwS5YSbCyr+jNKiEKEc/IsR9mysPQRU5Hg5lY2SsUyCEGwF1iLU3+ftqlB9uOdp73gUneVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 05:53:28 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 05:53:28 +0000
Message-ID: <82ebd2b2-f1b2-4130-aa1d-e911d9ad4194@intel.com>
Date: Fri, 20 Mar 2026 11:23:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability
 subtest per output
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
 <PH7PR11MB6796402811960601C074E56CE596A@PH7PR11MB6796.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <PH7PR11MB6796402811960601C074E56CE596A@PH7PR11MB6796.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0237.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::17) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|IA1PR11MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 4226586d-2889-452a-8a63-08de8645011e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K0Bp7CTjvduN54uhVRRCirMsRe1J56aXwLyTW4u5fZOMoVWJWkHjnvr33gjH20eh4OyHQ3O4o1BOucHArhpomTi5ad5manru4ANImsaRIVv4a7J8vwkhTvrjpOM6zuZ19cj44S21+B+vc+ZEUQpOBf+uhsPq54DSi5JZOM1As7JL9r9LpKifLTAFFYxIr9a9HS7LYctfu6lIWLcz/ocQIl9J/M2z8cULTyHbZe+o6DfO3P3pKshhiJdWWb1HwKSgTJJI2HC15gb9W1mnD9UzH4DoM8rU87S3Bsyvbb+O4Bro+Rt3smpdYhHeSOFnyDmFBX7RzGyLE+kvTMtlfGzowvp72v8syHjiUwEIEFxtMkxtFjazD/AiZ2DD3zakRFW6nONCpvcDaZO+gDfsOAXmOYE/YxHi3EV9jZiOd4tTnHD6TIj3jRCxRK5vM7rNBcYDRSstLMTojHFZqf6au1/wJX7AroZd5+NATESkG6yyTn6nFtoIrjMu30t2emDLRjdQUDdRbynZueLEufcn97tBmGsrKFWnmaxklG7dSCFYkpRHLZe0+ng9cFC1kIesNDI9O86g7H55WO3009ovQDZCsx3mj4v83mxiwziqGvmZpxgTR4Ft35CxO4gBamUOL7o1t2cwU1c885h5x1jCV+R2ULNf4MN2y+f1/I+YhYLzJ1rv0F8u6DBvfaZGx5GSWgfgFmKQoxGrY4y73eX0vdnTW2TRGAC/eIEASs8xE5U0PtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R25yTU9ENEhVenEwVHl3OFJ0azd3c1ZJa1dkMkZ0M0pmb1c3QlJUUVRucHlh?=
 =?utf-8?B?aG5nWmdDZDBJaURsMlFVeWM3NWRmVlJhQjc0WC9wcFdxOUJsZnNiVTVjd0s5?=
 =?utf-8?B?cTNOUGxSUVFhcUdHTmZYM0g5eE5zMzZYbTdRSkhpZU8wKzJPR0JsR012bFhG?=
 =?utf-8?B?WlpKcWlCODZySDZ1c2tjT2ZtSVJmVkZ3ZncrL1VSK0kxbGNlVVBaZHdWT25N?=
 =?utf-8?B?RmRpZlp4L0tDQ2tTWFBBanNaTEhSY3JleVV0ZmlEMTF1Q3JiT0ptamlYc1NQ?=
 =?utf-8?B?Q3lWY1ZaUTFibGtaOW1KWjljbVFZVlFkWDRQQ1hlWHBFTFRBdUVtRE12WGNB?=
 =?utf-8?B?cjFwVEJ5ZkhENjk5cG1Dc3RMZlBOV0hIOGdPZVRxYTIybkQ5N01MRk5NbFFP?=
 =?utf-8?B?bXEzZ0lkbncrNFpYc1VoRlJpRHhRd0tKaWI2bzhVN3NmRmQvSVAwVTJMakpB?=
 =?utf-8?B?L0NoMjRacDZ5Qm1oQUxEa3JBRXA3UmRNc2pkNXN5SHM1UERyQ001OHVpQjk2?=
 =?utf-8?B?eGdvQVJEU0ZodllsQ2ZDS2EvVG0rejlzSGZHdEtnSkRVc1p1am83MmpVb0k0?=
 =?utf-8?B?TDJTWXlSemxTNE5PQXBGZm9nb1VyUzVaVzZPcExJK1VidDBMeTZvUHF4SWp1?=
 =?utf-8?B?ZDVkNGwxbTB6QjBqMGxUdU9reXh3bm04SGtDa3lVSHNMODZjaDBoUzEyUnZS?=
 =?utf-8?B?b2FKNWx0UWhSTjJNcGxma2VYNTAya25UNE83SUZMeHVBdXRxblZmb2J3SE9v?=
 =?utf-8?B?clRWTFBOdWhDNDF6WitVeEVDeFQ5VVI3TGt5SnIxUXBRbm44Tm1LSlhLbVkx?=
 =?utf-8?B?QkFZbjRwVUFNeC9RZVJsUGhGb2FFeURaclVtYW9mRWVKQUdIWDhTSHQ5OVpU?=
 =?utf-8?B?WmNxcE0vdFp6TVcyczZxaVlzUFY5OVdEeGxiTWtSOHN2a3kwMENRS2NvbSt5?=
 =?utf-8?B?OFRmcDlQYmJxSDNrWVMwYXZQSXpkUGpGV25Lc3hiM21XdXRCdFNxZk9WSmFK?=
 =?utf-8?B?LzRjQU1NRDR2cXVtcVJTZUg1ek1acnBzNnp2QVZIRGFQKzkxSFNqMVI5MGgy?=
 =?utf-8?B?R1pWWUNGU3ZiTWdkMVpMQzArZTIvc09JaS9Dc2JjMkd2ZitrQnZuNzcwdDVG?=
 =?utf-8?B?SllTRG5YaG5IbjN1Qldha08wVUtZNW0rMkd2T1kwRlROdjErbm1NaVhrQnYr?=
 =?utf-8?B?RXNBeUtGNEx0djdVMDFCR0dIY0NwWHROZUtOOGlEVXRpRS80ekJGNWkrMG1W?=
 =?utf-8?B?WjlBekUrRXo5M3VIQXMybmI4b2JkNVl5dnNMazhGcmYvaWFhRkZVYmF0b25v?=
 =?utf-8?B?cVpPV1ZFc2ptbWx6cGx6STQ0VmhBOEpEM3ZXdW0vVFQ0TngzNTU2VlQ1b0ZM?=
 =?utf-8?B?R0poTzNUUWROd3ZQNytCZmJWL3BrRm5NWkFKczBOY2l5MHI4M0VQRFEyc2hN?=
 =?utf-8?B?RmNXOXFNSGlaUGlxRmY1NzVpSnZSbmowckVPSzRyVEVHMmtrbGFRZXdPTDVV?=
 =?utf-8?B?akJ6SlgrcG9QMVI1UUNrWEVpZlAxRGY1TzdZRnNadEx4S0pYMC9PalgyZjJp?=
 =?utf-8?B?N3ZZT0x1eG81Rm5EWGxZdjN0d0NmT0dyQjlXK1lRTjJMK09UWDd0L1V2QXZj?=
 =?utf-8?B?NTBWdjFUVE5HQk5aam9TUm8xcTlLV2FZUFVoa1R6ZmlkTGtFeHR5UXZoL2lK?=
 =?utf-8?B?R0FXbXdGUDhNVVB2WWo1UlBpRVMyekd2RWtMaDRod1dVTHdsUnNMTFcyN3cv?=
 =?utf-8?B?NlBSaVZtU1VUbTR6dDJrVGVQOGlKTnNVdG9jYkdKQ0FBSHRCWDJqUXlGbnps?=
 =?utf-8?B?L3ByN1JMc1hRUWZrZ0o2L2FnSXVNMTNkRmhjSzRnWE5HZVZKZFFVZ3J3WDFa?=
 =?utf-8?B?K0dLSkRYMkJTTEREZFRUalc0dUtONmJ3eGZudDUrL3loZFptNC9Ua1daL3I0?=
 =?utf-8?B?UWNZbW11UUN0ZnFHaTF5RGI4dW9XOGxybStUZ1lTeWZITW1OMnZYRHlBQlNh?=
 =?utf-8?B?SDVnb2dZY0xvMm02ZDhUWjZ2T1UwZ1lGa2dQN2ppeUpHWWVVcnlVSVlDZjZE?=
 =?utf-8?B?bW5ZVlFQbnBSdWdkcXdXS2xPY1lvZXF5OG1EbkFuYkprWmwycm5DSEphSk5D?=
 =?utf-8?B?RDNwZ0lPMGtkOGc2QTFTZUpxZTJEdHZqbGlITmhPOGVMSUk3TzJ3Y2E0M1lS?=
 =?utf-8?B?c1ZJVlFyNzZDNkRuV3I5Z2lsZmV2ZHFxaVdneStiTmUwVUY5Q1VxelJacEN2?=
 =?utf-8?B?QXEvMlFYZHBEZzN1OUlKSXErSEpnSnl2c0RkWDdrRE5rVEJ2b242MU50a1Uv?=
 =?utf-8?B?TDUrMWZRdVdXaU1tbGExSzRtdVdzempXMlVrdWtmQzdqL0VBb0Mwd1VQZVV1?=
 =?utf-8?Q?5x+fdjlsr6ElTga8=3D?=
X-Exchange-RoutingPolicyChecked: Y7QDcFQkWbbZ22k+ai4p7nyx3MELjeitk011AXQmov3tom47+JrTw2jZII6rKqiatTWNcK+7bd1WZx7LDKIlVk98vk9Ja8f3k4hkb+YNQkfdcWh4FcYbM6FumWLCNBLq05DaT1P3HhiN3OkcUkJ9QqUSlvk/XveGRqORngVh2iwAizo+UG3R7Hd0OpyqpzyEGd3uap6+L9z/5kLhu1xr8L8iD2K3pzQ4o4nwIE7lP4zDVhXLYwCWlwtyOMJ5DQS78QqjRN10H1zVLekv4MbbJjOLiks5cYamdbqrykiOCp6Obitk7WBg2pzEfOoh3OlThTA28lAg8ftvhQYfuAkphg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4226586d-2889-452a-8a63-08de8645011e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 05:53:28.3497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAhkxj5RbSsWB/QbmkvyRSY5p08EKvhk3qgGH55Tmi4ACsvSabEd+VhlxRovYdor/+71jRqPTwF6bZXlWQv6vLXTPnnhAhofD2mjk/QHK9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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

Hi Sowmiya,

Thanks for the review.

On 1/21/2026 10:28 AM, S, Sowmiya wrote:
> Hi Ramanaidu,
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Naladala
>> Ramanaidu
>> Sent: 21 January 2026 05:43
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability subtest per
>> output
>>
>> Add a dynamic "vrr" subtest that checks vrr capability on each connected
>> output, skipping if the driver or output lacks VRR support.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_feature_discovery.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
>> index da80ecf66..bf36740cf 100644
>> --- a/tests/kms_feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -60,6 +60,10 @@
>>    * Description: Make sure that we have eDP panel with PSR2 support.
>>    * Mega feature: PSR
>>    *
>> + * SUBTEST: vrr
>> + * Description: Make sure that we have VRR support on output.
>> + * Mega feature: Adaptive Sync
>> + *
>>    * SUBTEST: dp-mst
>>    * Description: Make sure that we have DP-MST configuration.
>>    *
>> @@ -155,6 +159,21 @@ int igt_main() {
>>   			igt_require(psr_sink_support(fd, debugfs_fd,
>> PSR_MODE_2, NULL));
>>   		}
>>
>> +		igt_describe("Make sure that we have VRR support on
>> output.");
> Use igt_skip_on_f, so only the current dynamic subtest is skipped, not the entire test.

Sure, I will update the logic to use igt_skip_on_f.

FYI, Using igt_skip also skips only the current dynamic subtest, not the 
entire test.

>
> Regards,
> Sowmiya
>
>> +		igt_subtest_with_dynamic("vrr") {
>> +			igt_output_t *output;
>> +
>> +			for_each_connected_output(&display, output) {
>> +				igt_dynamic_f("%s", output->name) {
>> +					if (!igt_output_has_prop(output,
>> IGT_CONNECTOR_VRR_CAPABLE))
>> +						igt_skip("Driver not supports
>> VRR.\n");
>> +
>> +					if (!igt_output_get_prop(output,
>> IGT_CONNECTOR_VRR_CAPABLE))
>> +						igt_skip("Output not supports
>> VRR.\n");
>> +				}
>> +			}
>> +		}
>> +
>>   		igt_describe("Make sure that we have DP-MST configuration.");
>>   		igt_subtest("dp-mst") {
>>   			struct kmstest_connector_config config;
>> --
>> 2.43.0
Regards,
Ramanaidu N.

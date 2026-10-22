Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD65606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qp8Gwn0p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D0710E3C7;
	Thu, 22 Oct 2026 12:42:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE4910E3C7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672866; x=1824208866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xKuZyiU4hBrI6txLzWtywKaqupRmKbKrfTgmS2WPtlQ=;
 b=Qp8Gwn0pp3Oi9P4eakWILx1NHnUZGBZaYvJvZJEP4pKXjG+no8YMyhLV
 lZf7MJsWEbDDlP0MtDNMg3DlphWXZZUfLoKANIpfs3KgHQf9AZjHMvdrS
 N/EQ7BHy5MwZTkaibmonn7B/uLsW8Vu5xsWqDDLWqXWVaQyqkPyFWZNOO
 wyFK5GJHeoyTWGs7CNNslKeHhrT59VcJEgwYjMhd+1DzUpG00futBgZXe
 n9JXc7KP14IBC5dOQWf6SLCZ2b3rUX4cSb/fI1pI8Vwaz9mav1fxiMkKF
 npxyIVKdGGVDwKuSNLGwjXFLDzcQf1K+FFOoRLfg404kgtMqDb5LGOBU0 w==;
X-CSE-ConnectionGUID: a3EJ+OZ/TUmCgure+alRQA==
X-CSE-MsgGUID: mwhUMQwORJa95OzbziHG3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1431137"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1431137"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:41:06 -0700
X-CSE-ConnectionGUID: EBDveFGkQ1KTHPJjCEyakg==
X-CSE-MsgGUID: /sLPfs7sQPqkbkZlYq5LLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="5117674"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:41:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:41:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:41:05 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:41:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCRgvy2rhNMkebAnu5q6+Z3PFPt6Y+Uq9qSJqrHhCyVU45p3KZRbjmOXoDSMDqsJssMXpjZSIPkp/OutGODgyomxxzkfk8Uuq9JIuZ8Iz77bStjob2tu1ll0XtyQNXH20ue2GDdScSYl+V/7JzbPnqMdHWxYDPeO8A+raGHstgixjlFxJg8YrnDZlpWcaJ3RH6a+zWkc0Fbmw2Ie6YIOvwFpPbwPvP8y5u6b4PJTtsWj8HZ2SZCQdoFCFtgWe4ZDpqGm8en3EtnINdRXsb+nN0n4iUJosQkM8jJg00jb1xNxGWWxQf4CDH0p81GgrfKs1ayjopPL/GwejaWpuggNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NReeC7afYHqVcyQ4zhM0p8wvFSrxKMDDLlHtPQXGoi0=;
 b=sAme3v3tbt8gXEyrAuPGSjKbyPQ2v9KCZtLIrj7sL4siExZ+bdLyUXZt3LAJuBmfU3GRBlFkX0WbGZ5aRmGsVYflqZlTkpTzzLIvqAvIddqu7OCHskh5OAnPQoRQsCbRJTUPbtU3fQJCsX8hkkco5H450iPDpgXKEs/tzBjk3fh0eaOAMBGufzlpo0Grr5EXFy4KtVODz2S9Z9xojg/cJTcKUCKKlOJd2i2lgu1i4zTuZOiRKo7jmUUGyNpkMlu7g2gP4TgPcfXheYCM/F/KD0k+XzoAzfx1krt4/EOIAxWU2odj6JOA9kBJZpScJ35pA35iFsQFfl4mrAaVOlixGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by EAYPR11MB9562.namprd11.prod.outlook.com (2603:10b6:303:2bf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 12:41:01 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 12:41:01 +0000
Message-ID: <6a914cec-f435-4af4-a5e7-1e0ae817dcf3@intel.com>
Date: Thu, 22 Oct 2026 18:10:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-5-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-5-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::11) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|EAYPR11MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a5bb6e-a14c-4173-6a13-08df3039bab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|4143699003|11063799006|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 82yszHff9PSr1TRackujLjXqBOEOrTPuInVkAPm/51p992H//Ewr2FkH4D8Mb+VvNnI8msh3HBfnRiKlwrptaOJ3cLCVZn8dWsXSFgou1E8PihayMmuFLxxa0/ymR2YAbc53vcSZqZbBxD1yloK8+nDad1x+6j04pw+VtcerNGtlYmPd3Z/YDiFUrUL1VwGfky1eStIbHXX0b/UAaO2Wh0hubZczg0uBdttErtnXNjY84+FwwcBsHouC/Om3e/mtleAL9PNcJyIBfHw0IGtxYAtSV2UxDrH2y5yydJnvdBcn6ho20/1394L+daE8wEoU0/mAESeXuJVkeujWEtGOiuKjNN5tIbQ3/xrzgY/c1hkACBvJeZYMJiLE1Amt0uhdecvvx06jZeGNfUXK4HST6ZB8LjjAvLrMEtuZWDv7yuCbvkLLuv0jXBdCSAUd9ohoU51+OT4ZoqbHiSn7g1qlhRZs7MPZq2z+GDopyN4557/w6DOlR3MsWgcTZCGsWqShJsupAg3TAje1npL7RZsDBRb9FrXPD4fB+7/UL8n8CFToLTHjvzXiQplePAXpoeIfZ0TBCQYI3/JawnfWmAHF8mEOBEDWDy9gB7irLbNl7PDPTfbeEkshu5DY7V5m52GMwEaphcjjsnIHrTAobZqJTdiQ+jS+JoTOH3UiGQvESrE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NllWR1NOeHoxdFJMY0lOYjlSKy9LN2dhakxWaGhlWU5oRVZTcGVJNjliY3Bs?=
 =?utf-8?B?alQzSGo3eEhidUZiSGJHTXFWMXd4dGR3K1NuS3pScmhxV2xGV3AzY2hxK3px?=
 =?utf-8?B?d1VzNTFMd2w4K0F1Q2RRaDZkQnZtTHgxTSthU2xmaUZZNWtrNC8wT0lUQ0FN?=
 =?utf-8?B?aytSZU9tQUFZU2pacnJRMXQ0SERJTDdSdUloa2lwZVhFVTd0TnJQV3hvL25r?=
 =?utf-8?B?eVljSEVFY1ErUm44RHVPOVdON1VocXpxK0NHZ1lnTXBTVVVCQ3Y2TWxtK3ox?=
 =?utf-8?B?MmRUTzVIcTdCbUtFdUpZaFUyb05tT3EvdGR5SXFCTE93K0VZMXc1TGk3TmU3?=
 =?utf-8?B?RWVYSFl0Q2FzUG9Id0JZSEQvRXg5RnBISmhFQURFSjVqTW9OUENZZ01WOXN0?=
 =?utf-8?B?RjNtWHhHa09uMVlnbnhMa3dQOExnZm9LUG96MXBHSmx6dXE1MjMzODNWREpn?=
 =?utf-8?B?Mm1Sa0hEd3JCc3lycnZEWFZTRjJRVHN1VUhXbFdkVmtpUWo4Q2FZNGhSUFd2?=
 =?utf-8?B?R2NxSEdGQ1IyTmJXQ0NMRE1lbURjT3pjNDNiWUdkKzdBZ1F5cDhDQjFkSGxU?=
 =?utf-8?B?aW1ONnhGMk8wczUxZ0IyekdCRnIvaWEwVDB6RjQ5MW9VOHVqeXNycmREVjBV?=
 =?utf-8?B?WkZrZnRvdjRQMTVzckdOQzJ3NUZJY3pRMXpQVUdaWWYxS1FENEpFZ2tRbGZX?=
 =?utf-8?B?M3gxaGNRTzBhS0ZYOGQ5SzhieDljZEZHQnVwQXd4UnhiNEh2ajVSb2JiLzd1?=
 =?utf-8?B?eHdCQUo5eXF5bmNFcUo0LzFVVkF1UUtYMHo2Vmk4dUtNdHV6NDVMZWpERTRP?=
 =?utf-8?B?NzlieXFMYWdKbVRXeUZBVEZXUW5Ic3FsVE12dWxUZ2I2RGFmc2ZNR3d5RFhQ?=
 =?utf-8?B?aFFEU0p1ZWhLQ2tJelY5cGlVUThYdm9IdkpTSUw0OVIwcU9EdHlrM1h4MVlx?=
 =?utf-8?B?cVIxbE5xNDRXZitsTWtES1BYTHJYL2prTU82STIxU0ZnQXVWMEt0RHFNZEt0?=
 =?utf-8?B?N2pXbGNYVE45RVdBZEc1Zit2bkZYWnN3cFpyVWpva1NhVzgvOVR1SmtmdElD?=
 =?utf-8?B?U3pYODVhRm53Q0c3Wlo5TkFWdDZDSWp4bXhRR0I2MTN2VXYzWmgrVjArcERz?=
 =?utf-8?B?NTJrMHRJTUpGbnhvM0x5eG5YQ2Vzd1VDK0ZqM3ZNTkFoc25RRHhXdlRONXNj?=
 =?utf-8?B?Skhmd3U1ODlPOWM1LzFQM0RoZU9KMCtGRFMrZVJiMTJibVN5aFJpZDF5SVF0?=
 =?utf-8?B?MGxWMkE3Q0pLQzdVQ01IdWFlQXcweVgxQkQyWWROd3htblkzanVtZnpKWDFL?=
 =?utf-8?B?ZFA5Y29HWVc4TUpPRWtwdWpGKzhqUjlDZTBLdzEwQ1RlNUQzWS9SRm1oRWNK?=
 =?utf-8?B?QnEyRFFyYXNFVUVrdWNOSzFKcUpqSkxsZDY0MW14SmM3M3pWOG9kUDZLY1BU?=
 =?utf-8?B?ZG42RTYveGZvN2RVNVBDS0pkVEMxWnlCdnN5eCtqZkFIZk4wV3Y4cHhMTmZi?=
 =?utf-8?B?OWhRQjBxRDltY0NrZXBXaGFKYS92RlVxTVFWWTZPdGhzbTlNaUw4YzBzSlRC?=
 =?utf-8?B?S0swdFhSMGlZK3pHaVg5REFqbkxyTVluMmtBWU5mdWFrWGtON3dmL2RxWHRM?=
 =?utf-8?B?bHVoMlNaTTB1T003bWFrWFdtbmZFUkhVUUFMVE0rSHVNb0JGNUllU2hleCtJ?=
 =?utf-8?B?Qjd6c0xVMk1EcHl3b09hYjNhb2l1WFBEajFEY2Z1Z1hmY1VLcmRtb2U5R0tm?=
 =?utf-8?B?aTYrL1g1QSthWnNtSmd5RTRadm44S0NOL0dhN25UNW9xN3JkMDg5NU5QMDhL?=
 =?utf-8?B?MlhFVWFpL2tFc1lVVm5XcFNlZzVyTlVKRWtKTllrRGRlUGswTnRINGU0d0dW?=
 =?utf-8?B?MGtqYVJndE1TVmVPelBrbGh4enpuQTZxbVllRTV1ZEJtOHBzTjB3Y21BaDND?=
 =?utf-8?B?UVlWc3dFdEhPYXVVZXZPdkdIdXBPQzJ1dDcrZjNqVVAxS2hlRDRBUSs4U0kv?=
 =?utf-8?B?ZGc4UEZVQ2hJU3FGK2YvT2Vjd1hIRDB5TVE1S2JhV0Eyc2FkdWY2bm5laTY4?=
 =?utf-8?B?Y2xBOGxwdml5V2k0RDcwdDFCLy9oaXNvcGZtb3pha0VCdWZaU1RSVjFHU2Vz?=
 =?utf-8?B?bUpLK1czcmY1ZHdOd2QwdDJXMlpLWXA2ZmpYVkpYQnlNRlFpZ3o5MW9Dd29Y?=
 =?utf-8?B?N1ZaZWM2SGtZeWVmWVBuT1hTanZTMWFpMW1ZV1ZtWjFud3J4VTZuSTRJSE91?=
 =?utf-8?B?M21ORkluWmJnL0U1d0o5SFpvZU9qM0p4eFBrUnZka2N6WWMrZ0RQdXlXQ2pR?=
 =?utf-8?B?MlJzcituUjFKZWdJekpENGpmdG5GNDlsTDNLa1V0YWdON29ZRE04Zz09?=
X-Exchange-RoutingPolicyChecked: Ozf8PP7QCmEn8H59LmHEQ8CWxa1Trlg9PsDozkDBLdjBcxpYoKPvS9Us75D0xl/y4HpNaPCoOOPNiClR5sIRRFyXleCwAi0Y4IWGAoIrTyb4DgSQ097aAbGtUQRvvK8tIBw9lX5py8MHiO9V8No5IxFz6gqTv/2YzlHdzKl6x474BXdjYEwGH50qjJWma1M8CqRJWqoOFIzl4B9YMtaIoTl9OYqDoN/IRg1JQ93xoJnC/K+XKSXXUpMQTx21O62M41h6L4SJ7NICgJu+5f3iQgHeIN3VffBESlhFQJeyM6HtjaEZeRWX8UeP7V1agESOQ2vG6Fmqm1yifgZxUVjZAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a5bb6e-a14c-4173-6a13-08df3039bab1
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:41:01.6508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ow43wkoV7eUK2iSbJmWLVyfhndd44NeweFGry1R3jJ2qX4NJKCmrIDFCHGo4yCiGzkADLdHPJdyKYVlSb9hRNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9562
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v5:Renamed library function names prefixed with igt_drm_ras_nl_*
>     (Riana and Soham)
>     Normalized libnl error codes to standard errnos (Soham)
>     Added error messages for error handling functions (Riana)
>     Changed the error-id max value from UINT32_MAX to DRM_XE_RAS_ERR_COMP_MAX (Riana)
> v4:Added support to poll for incoming netlink messages with 10 seconds timeout
>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>     other cosmetic changes (Nikula Jani & Kamil)
> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>     Added a check whether error_value updated by valid callback or not
>     Added a check whether response required for the command or not
> ---
>   lib/igt_drm_ras_nl.c | 312 ++++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_drm_ras_nl.h |  34 +++++
>   2 files changed, 344 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index 2822361d3..a465a53e7 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -3,14 +3,282 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include <errno.h>
> +#include <poll.h>
>   #include <stdint.h>
>   
> +#include <netlink/errno.h>
>   #include <netlink/genl/ctrl.h>
>   #include <netlink/genl/genl.h>
>   
>   #include "igt_core.h"
>   #include "igt_drm_ras_nl.h"
>   
> +#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
> +
> +/* Normalize netlink error codes to standard errnos */
> +static int normalize_nl_error(int ret)
> +{
> +	if (ret >= 0)
> +		return ret;
> +
> +	switch (-ret) {
> +	case NLE_INVAL:
> +		return -EINVAL;
> +	case NLE_NOMEM:
> +		return -ENOMEM;
> +	case NLE_NOATTR:
> +	case NLE_MISSING_ATTR:
> +		return -ENODATA;
> +	case NLE_OPNOTSUPP:
> +		return -EOPNOTSUPP;
> +	case NLE_EXIST:
> +		return -EEXIST;
> +	case NLE_NOADDR:
> +		return -EADDRNOTAVAIL;
> +	case NLE_PERM:
> +		return -EPERM;
> +	case NLE_NOACCESS:
> +		return -EACCES;
> +	case NLE_NODEV:
> +		return -ENODEV;
> +	case NLE_BUSY:
> +		return -EBUSY;
> +	case NLE_AGAIN:
> +		return -EAGAIN;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static int ras_command_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +	struct nlmsghdr *nlh;
> +	struct genlmsghdr *gnlh;
> +	struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> +	int ret;
> +
> +	nlh = nlmsg_hdr(msg);
> +	gnlh = nlmsg_data(nlh);
> +
> +	ret = genlmsg_parse(nlh, 0, attrs,
> +			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +	if (ret < 0)
> +		return NL_SKIP;
> +
> +	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
> +		break;
> +	}
> +	default:
> +		return NL_SKIP;
> +	}
> +
> +	ctx->reply_received = true;
> +	if (ctx->ack_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_OK;
> +}
> +
> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	ctx->last_nl_error = err->error;
Is it a NLE_* return code ? if not then it should not be processed by 
normalize_nl_error().
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	ctx->ack_received = true;
> +	if (!ctx->response_required || ctx->reply_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_ACK callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_FINISH callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_ERR callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
> +				struct nl_cb *cb,
> +				struct nl_msg *msg)
> +{
> +	struct pollfd pfd = {
> +		.fd = nl_socket_get_fd(ctx->sock),
> +		.events = POLLIN,
> +	};
> +	int ret;
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	nlmsg_free(msg);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return normalize_nl_error(ret);
> +	}
> +
> +	/* NL Reply and ACK arrive as separate responses */
> +	while (!ctx->cmd_done) {
> +		do {
> +			/* poll for incoming netlink messages with 10 seconds timeout */
> +			ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
> +		} while (ret < 0 && errno == EINTR);
> +
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +			break;
> +		}
> +
> +		if (ret < 0) {
> +			ret = -errno;
This is already a linux -errno.
Make sure it should not be processed by normalize_nl_error() and should 
be preserved as is.

Regards,
Soham
> +			break;
> +		}
> +
> +		if (!(pfd.revents & POLLIN)) {
> +			ret = -EIO;
> +			break;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0)
> +			break;
> +	}
> +	nl_cb_put(cb);
> +
> +	return ret < 0 ? normalize_nl_error(ret) : 0;
> +}
> +
> +static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
> +{
> +	struct nl_cb *cb;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +
> +	msg_head = genlmsg_put(msg,
> +			       NL_AUTO_PORT,
> +			       NL_AUTO_SEQ,
> +			       ctx->family_id,
> +			       0,
> +			       NLM_F_REQUEST | NLM_F_ACK,
> +			       cmd,
> +			       DRM_RAS_FAMILY_VERSION);
> +	if (!msg_head) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER:
> +		ctx->response_required = true;
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +				  ctx->node_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return normalize_nl_error(ret);
> +		}
> +
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +				  ctx->error_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return normalize_nl_error(ret);
> +		}
> +		break;
> +	default:
> +		nlmsg_free(msg);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	ret = register_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		nlmsg_free(msg);
> +		return normalize_nl_error(ret);
> +	}
> +
> +	return send_and_recv_nl_msg(ctx, cb, msg);
> +}
> +
> +static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
> +{
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = DRM_XE_RAS_ERR_COMP_MAX;
> +	ctx->error_value = 0;
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +	ctx->family_id = -1;
> +}
> +
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>   {
>   	if (!ctx || !ctx->sock)
> @@ -18,14 +286,19 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>   
>   	nl_close(ctx->sock);
>   	nl_socket_free(ctx->sock);
> -	ctx->sock = NULL;
> -	ctx->family_id = -1;
> +
> +	reset_drm_ras_nl_context(ctx);
>   
>   	igt_debug("Cleaned up netlink socket.\n");
>   }
>   
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
>   {
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	reset_drm_ras_nl_context(ctx);
> +
>   	ctx->sock = nl_socket_alloc();
>   	if (!ctx->sock)
>   		return -1;
> @@ -48,3 +321,38 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
>   		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0) {
> +		igt_warn("Invalid DRM RAS netlink context\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ctx->node_id == UINT32_MAX ||
> +	    ctx->error_id == DRM_XE_RAS_ERR_COMP_MAX ||
> +	    ctx->error_id == 0) {
> +		igt_warn("Invalid node_id (%u) or error_id (%u) provided\n",
> +			 ctx->node_id, ctx->error_id);
> +		return -EINVAL;
> +	}
> +
> +	ctx->error_value = UINT32_MAX;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ctx->error_value == UINT32_MAX) {
> +		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
> +		return ctx->last_nl_error ? normalize_nl_error(ctx->last_nl_error) : -ENODATA;
> +	}
> +
> +	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 011f3bc05..f51784524 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -7,14 +7,48 @@
>   #define IGT_DRM_RAS_NL_H
>   
>   #include <drm-uapi/drm_ras.h>
> +#include <drm-uapi/xe_drm.h>
>   
> +/**
> + * struct igt_drm_ras_nl_context - DRM RAS generic netlink context
> + *
> + * Holds the state for a DRM RAS generic netlink request/response exchange.
> + */
>   struct igt_drm_ras_nl_context {
> +	/** @sock: Netlink socket used for the exchange */
>   	struct nl_sock *sock;
> +
> +	/** @node_id: DRM RAS node ID to query the error counters */
> +	uint32_t node_id;
> +
> +	/** @error_id: RAS error ID to query the error counter */
> +	uint32_t error_id;
> +
> +	/** @error_value: Error counter value returned by the kernel */
> +	uint32_t error_value;
> +
> +	/** @last_nl_error: Last netlink error reported by the kernel */
> +	int last_nl_error;
> +
> +	/** @cmd_done: Set when the command exchange has completed */
> +	bool cmd_done;
> +
> +	/** @reply_received: Set when the command reply has been received */
> +	bool reply_received;
> +
> +	/** @ack_received: Set when the command ACK has been received */
> +	bool ack_received;
> +
> +	/** @response_required: Set when a reply is expected before @cmd_done */
> +	bool response_required;
> +
> +	/** @family_id: Generic netlink family ID */
>   	int family_id;
>   };
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A32D591C4
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 06:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7400A10E5BC;
	Tue, 19 Nov 2024 06:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dm0iFrdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2A210E5B9
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 06:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731997211; x=1763533211;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+xubB3Y7fPqqw/Yq79fKhdm2ESvfvWiHI5qU6iPBYcg=;
 b=Dm0iFrduKax7NmVyU+qDKYxbNMimi6c/ckz+/XTgTFjenI1wEkd93OqO
 kpfshifi1XEevoYYjSd59slcnNTibjLIINOpJyo/bmR6k0jJCwkQ6Bmwq
 +lOCvQB/78sJSFZGyLvCbFUycyEnHWL5DG0vgBgBN1su6V31KYhzsOq+v
 JJlyX6SYaHbBPr78/d+E2o9bcVIsDHL0NIdJL07cIHyPnkUDcdLE33sfq
 g+htCeOf5+BJPY1OmvTTzC1Bq0TqWpS7tobjxBRTO45BvA4ngDaReTzA5
 l+Dew1QwewhRniR/hn1MtEleGvBCkXE4htGPu+scaZiSNcjIieny49Xlu Q==;
X-CSE-ConnectionGUID: LURuCam5TTuQiCOGQVRj1g==
X-CSE-MsgGUID: TMxsl9DLS2ugxTB2ESN0bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32038128"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32038128"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:20:10 -0800
X-CSE-ConnectionGUID: l83le65YRd2zVvcBItWNIQ==
X-CSE-MsgGUID: CI9m5lPRR1WW+hTbPrHbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94530410"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 22:20:11 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 22:20:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 22:20:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 22:20:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGJiqC8WU0kl0jy/bn1vGrCusr4zC1Ee2+Uj9NR7Q7HYi/XtFfETrXMgYViF8n/5B2oXTUrTkeMYjq/iRtYHK9XBIn205joadmwsI9xrajerMWO2j1wZnikucSow2Jx+lL5h9fp40I9wev22tSZPPZFI2vlCGjZ0DCu5R3fe4no4R8DGdAMeptk8NDFR31l6FiDw1kIAcIWR6AJAEISATcQP7bYGpnMtmkenkSzHJMw/cQBsDXbJhItosI+H/It7OAMghBg/BxMEIYjxXfRak+i43+OnHqtkySPywvk8Q/aOG66WSiA9OuoiHMUi4VmGqqdEgsKlHjS83SiOuUv98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFMyYu+GqiJM47fDy8SmrbrgUhiW28yjWMiA0rlwfeQ=;
 b=UaOMnUbJttaA4I3zW+JAPgnjBS655xIKLy2rFTWtlsWloTyv+6b+/hEkFDTkaqqEkLcsyqpNXvjoiVTFtIwAwVJYVP9QkfqJBKG54iP3LVfTIpqPtFKLcTA/bJDNoDaTniFfBXk2WNtRIaI2svTUqNufS0EXMUt6r2Q6tJrElz51ZtID7b5vxE71M03FN2l8qAJfm1m81i4TuhG0ropGAu3UY2XnO6w+jLaZcBtaZHdSaJ5OHkXADHZ21e95Tr5noUrbtVb8dvH5fCA77xxK3tYP8tPTGWqMbIlXukPvnDNN7xo3P6FWU4AUJTV2H5lbYY2yY4AeYqBTeV+SPR7+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 06:20:07 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 06:20:06 +0000
Message-ID: <323e358b-d7aa-4e82-b105-4ef9b3e30829@intel.com>
Date: Tue, 19 Nov 2024 11:49:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_oa: Fetch OA buffer size from
 observation IOCTL
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20241118063223.3974722-1-sai.teja.pottumuttu@intel.com>
 <20241118063223.3974722-2-sai.teja.pottumuttu@intel.com>
 <85y11gwcag.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <85y11gwcag.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::10) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|DM4PR11MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a251f57-10b4-4ec7-c0e0-08dd08623610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0paVkhzQmovR3VGRzNMVlhuaHVqVnR3N0dWVkJFOWhPQnFweHc5OU1IZStW?=
 =?utf-8?B?b2I1aW14U1JCbFlTYlJnRkN2dEs5eklRS3Jick1rWXBXem1NUXQxTzcvUktZ?=
 =?utf-8?B?cXVFQTVYMUZNK1JwbkRVVWY2N25MZVVuSHhDbVpYdGtMODVTOWJrWFVhZFMz?=
 =?utf-8?B?OTEvSFhWMmFONldLblNxS3I5NjRnYTd4cVViMFZxUllqaEIvelpHREJLNDZG?=
 =?utf-8?B?Nkh1OGhCQVFGNHZVWTVuZFFJcS8xaFp4a2RqN3RRbDFFcDU5MUxya1ZMR2pa?=
 =?utf-8?B?dG9NSDlndHhvVUtQU0xobkZ2ZjQ2dzFKU0paZWFlNjNRdUs4YUxwVU9HZDlI?=
 =?utf-8?B?RXJmMVV5UnJJZ2I5NWN3dGhsSzk0RjVmL2dLL2pnekJyTzBJRjJZMU1HK2RO?=
 =?utf-8?B?MWtCMmFXWnAzam13SUR5dkZiQ2Q5Nkt4NlFxalI1ZTRBRis3bWpBTFFZcHVh?=
 =?utf-8?B?Qkl5Mmh6M29WWUhPSTlMcUtaSUhQdHczOW10eTJzeVoxSitCTVExRCtCRWlK?=
 =?utf-8?B?QkhyRDN4YmVKdGJoc1FhSFBjaTl5SytPOTdjVGxGcXltYjBWQVF6ZWxEc3pi?=
 =?utf-8?B?bTNhM2JlaUFjYXN6Zkw4QnBINFZwRlJkVDBsUXJDWTNxREg2T29SMndWQlAx?=
 =?utf-8?B?VEEyajFLVGlxUHdkaDZWSis2USt3aU1iMWxXaFcxVmk0ZnhNeG1LUzNnQkRJ?=
 =?utf-8?B?dEtDVkgrd0NtMmJGNElkZWUxb0d4aDBQblpqY1RVVUFkdGZHSVBBN1k2QzVM?=
 =?utf-8?B?ZFd6Z0F3UWJDYzRMUWpUamFkaGpIU1NBa1ozbVh6MENBY1JwU2pndTdCZjVU?=
 =?utf-8?B?eGNxNkZYWVFrQjh6TjhlVFdrb1NKelJkUEE1SFZ4enNpanozUVhhQll3c3By?=
 =?utf-8?B?T0FKMjlqazRPVFdLSUhCTXJrQ3g2RnhpN29oRjB5MDRuTHpIajhzRkFWSHhS?=
 =?utf-8?B?OWZpbDJKc2ZucGJDTjZaZWR0cWNoVFdnbWlhZTk0ZmVHM09EM2VDS2lSZGQx?=
 =?utf-8?B?MlR5L2xDMjNSTVhXYmt2bWpLZGNSSVV2VWNxb0JJVytrclJQS1AyWjBhbGE2?=
 =?utf-8?B?WTVBNUFjTm1JcXhtdWJqcDZqbDlVcTBuME5lRmhEdWE5SFdBMGtFTWR4cDVH?=
 =?utf-8?B?Wng3aExzbmNpNE4xZTBqNHBQd25LZTdydXZPTGltRWoweW5oeE5FK0pJVFg5?=
 =?utf-8?B?RlQ3dEJ4U203bW1kN0tVak9WVU53clVkeVVncGsvSjBoa1hKZHpCSVVTQ0FL?=
 =?utf-8?B?Mk0zZWhKVnh1UENQdHVENEpYL1RtYVZlWDdka2ZHTzVOaldvb0ZFYWhGU2w3?=
 =?utf-8?B?Sm5VTkRTK0dVckFHcmdtQmNBeHNlR2ROZWJOWmh6U1h4M2p5eHVIZllJSWNz?=
 =?utf-8?B?M25TT3ZKMmQ2bEFrME56MS8yWFhDVXNvVWFyNTdFazgxQWRPOGRsM3M1YkVx?=
 =?utf-8?B?aHBXOXoxMXdpZ0RwcGM4cUlvM1c3NGJPRlJ4T0N3WXFJZkQ3UnBIaVJqK3Jq?=
 =?utf-8?B?NlBEL1ZST0NtVnh5bjJvVGVWNjNjQlFkQUdtN2U3UWpLK3JCS2hQRVBpeExj?=
 =?utf-8?B?ZFJwUlQ4dGJnVEJ2cnEwa3pxTlFPd1hCSzl5akFkanZCaERxZkZBTUZDbmJx?=
 =?utf-8?B?QXkzV001WUd6MmJDaEhxWHNYeU9DUjh6QjFNN1VCTjhCNjYxc1lXck9DcjZx?=
 =?utf-8?B?TEo5YkJuOHZmTXhFMnVDbDJaZUFsUDNOUExzQlRqVjdXTHQwaGdCem9iSHpy?=
 =?utf-8?Q?FZv46fDu9dqXA2NzLmNXDYscBr0XFydh7L/VeL4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEhablphdVFNcmV4RWJkRVFWM0VjMGdIcEJrd2g4SGx0MjY1K3dUVGVycnRV?=
 =?utf-8?B?eEJ6RElIRWhFbzhwRHg5UjBVZ3RkMU1QYkZpMFVKVlZKMUN4b1dSQjdsZ2dP?=
 =?utf-8?B?MUIrTFhLOHhBT1pWS1BMeFcxcEJjTS9yZk1HNlNCd3RKOGI4aDFBQzFBbVgv?=
 =?utf-8?B?dmJVY2ZkcGxxVXF6THVySjhiN3hTamZlVHpnaDluT0Rob3hBZ2NtV2RIdk5B?=
 =?utf-8?B?cTNjSmhTdUM0b3g0SUdpSHVkZkhpNVdZZmR5RWM3MUJBazIwWnZTSVZocDRq?=
 =?utf-8?B?YklWQW1PQ2o0Z3ErZGlaY3NRcHhFTTFsNEJGVUlQQXlLa2hFRDN6czMwSGJ1?=
 =?utf-8?B?Y2xqblVudGNZU0xYYUx2bjRhaEZnOWFwRmluUXB2c3BLeFl6TkFnUklqZ0NP?=
 =?utf-8?B?Z0tKU3hubzJOV3pYSUV0SllIT3grdCtUWHlWVzlOTndFa3l5NFFMQ3BIdmZO?=
 =?utf-8?B?RXJ1RWw2dFV4Kyt3eDNLeVJBc0pqa2Y4bzFId216WWV4eld6V08wTnR4eWNa?=
 =?utf-8?B?cHVtKzdnUEk5Tld3Mktjbk9VVVRXajd2RU5xZ1NkYTFXRWdyRXZsR0drQUt2?=
 =?utf-8?B?V2ltZnZZY3NoeEJlL1Y0aVlydmNGUnorOFFiWDljVVFsYWZZMGlBdU5nYzd1?=
 =?utf-8?B?T0pBczJxdTVpNWhxMWNWSHA3Um1RRkJtMWtranBFZGhCdTNIZ1MyKy80ZkFC?=
 =?utf-8?B?L2FnUjJodWJ0TnZDN0FmaFpYMGxmWitqSHNKU2p5ZjdTaUxFcGdBTjlCNCt4?=
 =?utf-8?B?QjFEbjNKWUFqR05qbGpLM1VxVk5ESXNxOENOS29rQXRadk80ZnFjSDFySXk4?=
 =?utf-8?B?ZWx2Uk9MdHAxTDJ2OHpGbWw0b3pEaCtiNWhja0Z3WHp4aVozQld0SGhRY0Vk?=
 =?utf-8?B?Y21sRU5rdzJma3Y1RXFuTElDcjlVU2t2ZTFIU21nSVcxU0h1Q1ozZHRIN1Zj?=
 =?utf-8?B?NU5CSXUxSDcwRTQxb0YvRVBJUHR2eDljWXRhSjVPcUQ2aTYrRnZoMkpjemFE?=
 =?utf-8?B?cGU5akJCY1B3SmlQMnM5aEJ5dXhRdmlUY3JyR0JFKzVFTjNxNEYyZ3NJWXUv?=
 =?utf-8?B?bEVrSEFyRHJ6Tk4zVGdZajRGdVRKNSswQUNiY2lJenhaL2hIamVUMUJUQzRy?=
 =?utf-8?B?QzAyNmtWSGh0NnlPL0dQallSTm1yR2haUVpRK2pwTlA0WGNOeHBhbTJleVlJ?=
 =?utf-8?B?ajRoL2lRc2p4eXhPWHc2dHFUSkIyQkcyeHYrNFo2bDR3VTYwQy96cEptUmFK?=
 =?utf-8?B?L2ZPYWMrb1BjMU5BZTZCOXZpQTZESExiTE5lQXVRQ0ZMRnJzOUtSMzUvcGg1?=
 =?utf-8?B?Z3hQNlFQOWppalB5RG4xQ3Vnd0dYL0JUclBOK0c0VlJZYnNBMGJXYTlzNG9S?=
 =?utf-8?B?dEZ3cFJYR3NzbFJYWG9KMjIxY0xMdXRnSUx5UkpJd3h5TEFUNVo5VFVUUDZD?=
 =?utf-8?B?cEN2a2djbHY4WWJCbnV5SS9MR21YV2h6a0RPOGdvZDgySTRtVFJyTnZBZndD?=
 =?utf-8?B?djNxK2NEc1B1M2IxaGNqM3BocUtEaWV6WngxU25nS1NHRGVVZDAvMDcza29M?=
 =?utf-8?B?a0tiVDZZVG9qUHNuYUFOS3JMMzVnN1pHRVJCWkRTVHh3WkhFZUN4MWpnVWp3?=
 =?utf-8?B?bVVOTDRpZDQ0b1hXVlFkelR6V3ExRkluOHZuUkVCc3pZajFVNWhqRENXck9K?=
 =?utf-8?B?dWF5Tkc3Sm51U25SMzl2QzJvZ0dZWm9WNUwrWkJsYWM2WlBvOGtSd0J3WEpq?=
 =?utf-8?B?T0lMSWdURjlIejZSZ0EyQk4zaGJ3T0JiV21NTFQ5VFAwWGU5V052bnIxMFVT?=
 =?utf-8?B?OUl4U0VyQmE3RGUxc1lkME12SDh4Q3ZuRnA5RHpzemlMeEd5a0U1V2VEZ1J1?=
 =?utf-8?B?M05mQXp2VWFhL0Z6MmF6ZWhXSXlnNXFRRXYvWTBnLzBnUXVndVQ5OW1CT2FP?=
 =?utf-8?B?cXlkSnliVU92S2VOZ1RGT3JPcXJnRUxGQXI3eEFKN3lmMm91ZnUweVJIcVlz?=
 =?utf-8?B?dkhXcnRnRFgyWWFZZy9VbW81QmRma0szbGgra2o1NTNzaTd5UlhJVnp0MkQx?=
 =?utf-8?B?UGpQRnhCbDdzM2FCVDRUWFVVVlFSeVd6a0NTbUpjZklRWG9FYXVzdEdsTkFx?=
 =?utf-8?B?SnVST0M4ZTBCRUJPSUVVMC9MNURxaG41eWt5Mjh0RjZoU28wSmFBclMzRGxw?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a251f57-10b4-4ec7-c0e0-08dd08623610
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 06:20:06.4280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhQIuHNg3KZwb0hEl3+THd1Z/4+O0+mLotNarXkOzcJdpcp5k10mHjDYekkJYwb89Aw3xz/a84w873kTT3KcZi/NubCUR421n91bsaNETMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
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

On 19-11-2024 01:21, Dixit, Ashutosh wrote:
> On Sun, 17 Nov 2024 22:32:22 -0800, Sai Teja Pottumuttu wrote:
>>
> 
> This one mostly looks good, just a couple of nits below.
> 
> Also how are you testing these patches? To test I suggest just run:
> 
> 	sudo ./build/tests/xe_oa

Yes, I ran all the tests that way multiple times and all of them passed.

> 
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 33e978a48..4e4d0fabc 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -63,9 +63,6 @@
>>   #define PIPE_CONTROL_PPGTT_WRITE	(0 << 2)
>>   #define PIPE_CONTROL_GLOBAL_GTT_WRITE   (1 << 2)
>>
>> -#define MAX_OA_BUF_SIZE (16 * 1024 * 1024)
>> -#define OA_BUFFER_SIZE MAX_OA_BUF_SIZE
>> -
>>   #define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
>>   /*
>>    * Engine specific registers defined as offsets from engine->mmio_base. For
>> @@ -303,6 +300,7 @@ struct drm_xe_engine_class_instance default_hwe;
>>
>>   static struct intel_xe_perf *intel_xe_perf;
>>   static uint64_t oa_exp_1_millisec;
>> +static uint64_t oa_buffer_size;
> 
> s/size_t/uint64_t/
> 
> Also, for clarity, let's call this default_oa_buffer_size too. Because
> oa_buffer_size later can be changed per stream. So that later when we
> introduce different oa buffer sizes etc there won't be any confusion.
> 
>>   struct intel_mmio_data mmio_data;
>>   static igt_render_copyfunc_t render_copy;
>>
>> @@ -511,6 +509,30 @@ __perf_open(int fd, struct intel_xe_oa_open_prop *param, bool prevent_pm)
>> 	return ret;
>>   }
>>
>> +static u64 get_default_oa_buffer_size(int fd)
> 
> Let's make the return type size_t here too.
> 
> Rest lgtm. I'll take a quick look at the next version and should be able to
> R-b it.

Sure, will make all these changes and send a new revision.

Thanks for the review
- Sai Teja

> 
> Thanks.
> --
> Ashutosh

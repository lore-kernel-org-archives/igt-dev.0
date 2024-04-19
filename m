Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01A1C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 10:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D1010EAFD;
	Fri, 19 Apr 2024 10:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnYnuBve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42F710EAFD
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 10:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713521394; x=1745057394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CWBrvziUExr3U22xUG5kyklg0NBwOI/CgPjkhKjcqcQ=;
 b=JnYnuBvedsK6DIdEQwQ2YaXBkC17bznNcsgeyC5ImgRZSMqEP6C24Q2p
 5LfpQFqSopQ628SlAxD3tWkrR+nLoYgsfdCME8eXy5Hts5omL2fjjIBnK
 7ovBYHUGNxtV2vX5m14d9qPpigwJCRMMVkh/gx3qRuYKnDC1a+dAffR8z
 zdPh0auyjb/3P5PG/+uMmjocR0gks/3W3Ka5S3Al1vVf+mql2tsucYWzY
 IGPaGFWhNv3X6552WwSgvUePBBxSlq6fSCkeip/pRBxuWpycaTqru8KWq
 yzhO2aZ/Rj3OLWVb6+2VvXqWc6MFbuz0v5RFsjhEUeIdt+YutLAJ23HtS Q==;
X-CSE-ConnectionGUID: uHMq4LPeSSaIj1ym5DOHZg==
X-CSE-MsgGUID: 3tk4hanTQRO3zHCGEXg3yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19679131"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="19679131"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 03:09:54 -0700
X-CSE-ConnectionGUID: yOs029K6SZisBlmVIOR8/Q==
X-CSE-MsgGUID: 5ZVCdM4oReaZZAGWvP55Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27904780"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 03:09:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 03:09:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 03:09:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 03:09:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 03:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3rJ7sUfRmoExo0giEnMO2pgHNORDMlZwKTvWpDr0kS7ARONVTh7xCXsoc2K6t2jFpc1FEmuzAlK1lOI2S2qHqPHe+ZJdt3VxMF/nt+htu1GJHd4uEW/n3aVrK6shoj4/bapYm6a/owVu7KiBhQhEMOF+QQVVGulVYMh7mR0lcNm3OmYrsUSnlb/sbF5KiPUd03IKkjKKAGzVCyblUXkUiqQC7NKJyKxUl2M1gTs8C5vAOA7DGw3DZAXKr8Zr6PgoX0AnF8tE9Tk3kiQcbBEbPl40QToLaEWuy6eyCc5pfJEAHuEHi15Tc3Lp56Mqw+hk9FS4YRLWXSHqJ2SyntL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN02btLZuT2WXmYOhj/l63fU99Y/aXEzERpqpFcFYVk=;
 b=ItjdI7m0XfK9dwfBr7C9bcLQEWWSqC+Vvd/zUuv9Cu1VrmGHXYaIp1dNPdOZK+Uc2+ieBG6AHgshKjoMX3/E0pP5XfHfdb311IiAlgFW5eEZG55ZQwEYj18xfrjRibU2/z1wwch4SRLPdO4tibD4bemvUOnlh67licOLH3BEmmtNw46UJkhsLzydwhXFvfopbB4lBgbr+03QYLsKgUty/CvoIT4GbY92ySLSQicdbdy4sMZxeH8ziWZhPbb2BJqyZ71washSFMB/muvSLMzm0gNLe/Gup5SOrUxdm3X8h38QuN7241QtCs/SpJ2KzoPLV3lsq7dypKr/w72yPW0/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Fri, 19 Apr
 2024 10:09:50 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 10:09:50 +0000
Message-ID: <0d0731fd-4034-42f9-afa3-1504542ab659@intel.com>
Date: Fri, 19 Apr 2024 15:39:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/7] tests/intel/kms_big_joiner: add missing commit
 after reset
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-4-kunal1.joshi@intel.com>
 <63cfd345-bcca-453a-b6b2-465307bc9308@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <63cfd345-bcca-453a-b6b2-465307bc9308@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d8e7c2-da2d-451e-f120-08dc6058d9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGJCaENTT1hLZUxvVHprTUN0YmthWEN4YXd0VE9wbDVZNU1Lclo3TmxyWTlj?=
 =?utf-8?B?RTdVc2h3MEd6ZGlNQjJhT3JabEtuSUFiS3ppMFN6UDFMN01SamJnR2d4aitF?=
 =?utf-8?B?V3dJUGtEdjkzMStubldTUjdHRFVXeThmcDVZMDdFcmZlSEtHWU4xNHJEZENQ?=
 =?utf-8?B?TC9rbEkrN1Z4UFdrMWJlK1JQalZPeGdGd2FxODFWaDN5bmVHVXFiZEcyNDds?=
 =?utf-8?B?OEc1dzYzRUtEdW1qWVhpbWx2ZG5uVUVyMHgyenJYQ0FxNnZEM1dIbWFrMFRR?=
 =?utf-8?B?ZTJiZW15NHZiMnhJajNFTHpaRHVoampjUm9hWVYzMkdOdFNmRURxTHQvQXVz?=
 =?utf-8?B?MUdpTGVmMmdsR0wycTNmc1VNNTQ4R1NLdmJEOGdxdGFrU3N5S3llVDU3L3RK?=
 =?utf-8?B?MFRDa1RGSVhjYVdJUi9IMVgxR2ZweUpSaVpsSzYzWmg5UFVORldpdFFIejlQ?=
 =?utf-8?B?WHRCbFJzaXFhYXRaakNXZVVIdHhsdERVMmtYcDY4SjV1R0M3c2YySVhsck9j?=
 =?utf-8?B?c2FEOUhYczZiZVAwRDM4ZW1qKzJ1djU5T2NDaHJ3VkFoWE9EU3h0cEFpbnlW?=
 =?utf-8?B?dW1PMElySDJzSTh5MjNrKzhXU3pFUlpYMDNwaDcyR2JRVldpWGxiTGR5L3hN?=
 =?utf-8?B?MncwdDRDSFpJMzRjdGxhUDVSV1dCajR5ajZ0UzkweUNNbERBaTRTcjBoZkJr?=
 =?utf-8?B?TUdyaFE2VjV1TUJ6NndDYlFxbU10Mjl6U09xRisvUGJ3RE9VV3hQd0hpVXlD?=
 =?utf-8?B?cjhkalJyUWNLWERBN2VpV2ZKNGlSQkpZUjJ3TlJkTi9mVnVHWFVmS3loQ05D?=
 =?utf-8?B?WFB1ODJEbzF1V1FuNElYYVlTbnVjU1JTQ0hPSlVKSFJKSlFrT3U5YXJCVk51?=
 =?utf-8?B?b0tGalRrenNSZFN3V2c1T2NiSTgzYTg2aUkveEp0cm13WkVNZStvUXVsL2ow?=
 =?utf-8?B?Tlp6Sm84d0FERnJmOGVhVDl6ZVFTTXpCellDSy8xUXRjaFNxNHd0bDROZ1Mx?=
 =?utf-8?B?c0xNemFJSlZiaTA3eTh4QlA3RDY5eHZLMitUSk02b3prUVp5eUxTWlhaSDRK?=
 =?utf-8?B?SkkzQkkzU1FZbTRSUDc2U3FIdTYyNDQ2UjU4L29XYjlHNXdKZjYrbzl1ZjV5?=
 =?utf-8?B?emkxWVpNZURjUXo4OFFKdDJWemlZODdqQjQ1d1d1c1ZIdjZWMHJjazZvb2s0?=
 =?utf-8?B?QnZLRmRTeTVXN2l6TjBKUEh6MTNpWVliS3M0N0hkd2loWlpBU0VGcHFOQkgw?=
 =?utf-8?B?ZjlBVEYvTml0YUVNWXo0MEdocGFydmZjUVNEbms5WEtTeXdZcnFYZUc4OTdi?=
 =?utf-8?B?TlpqYU92dzB3SnIzU05pY0VTYTdkaFZ5aHdqekNmbU1jR21uYmtNQWxNMk9S?=
 =?utf-8?B?TWdrSnhVKzAwei92TDNxNTlvSkxFNk8zaGNZY2pIdHd0WHVaV2Y2SlUrMi9I?=
 =?utf-8?B?MnlhVzhqeTRiWUthd1kzOTBsdlNSZVoxY3dqSHYvNE5VenFvT0kwTmtDdkxQ?=
 =?utf-8?B?SDFWaWhHZFZUQ3ByOWJGZFNPb0hZeTZpMElNZXBsYUtraDI2ajBQbi9uMGsx?=
 =?utf-8?B?SERUNFVFaHY5clVyUlVORHZrdDZuK0ZBNm5oY0hXZlVWVXJDTWh3ZDQvTlBM?=
 =?utf-8?B?OHEvaDg0eWg4RzBBc0lmTkhYdzI3QUFQdUQ0T0Q1Q3pQWmUrTzl2a2ZWc1N5?=
 =?utf-8?B?MG1CRVRqMHJUdnI0QUVOZ3l0K2tRcDlmbGVOOUFsLzNWemZzbUZ3eGFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckVCN0hySGc1M0JRMG5pZ1NQM3V6TzlhT0RXRDNPeVNibzBzeUJZZXZ6ZHF2?=
 =?utf-8?B?SWk3MFZ6UWVJU3ZScm5YclV2RC9OTUxoTkhjVkxZbFJRNzJSSTFQWmhXOFRj?=
 =?utf-8?B?OW5MOE1nSGE1bWRvV043TkJGMWY4eXlmSUlPSmJDWDVsTVcvN3pLK21lUXJ2?=
 =?utf-8?B?T3gvQXczNDRiUmtnbGpwa1lrM01NdzZQT1dXSXR1V0tCbUREU013R3U2d3p4?=
 =?utf-8?B?WHpOeWRHdG13cFhZc29DUnpTMWRVcVlyTzFSbWJtSm53MGpTUzlqbURQMmpY?=
 =?utf-8?B?ellscU8rRlhkcTJyTDNqdy82LzBjTGtObkd6Z0l2L2tpRUJGTUx0VHVyM2tI?=
 =?utf-8?B?czVUM3Q2UWZnaHpJelluNFE4NGlIOGhLTFU5L1p5Uk5SbUtwZkg4WVV4ZHRm?=
 =?utf-8?B?aENzTmNyRmVOR0hlSnR4NHF6dTZZcmtBenNCS2U3TWZjUGJBZjVrSmVWWWpy?=
 =?utf-8?B?Ylc3QjRST1pJOThVS2FvRHg5Y25xVlNtQWw0bUdmdUt1NW9PZUQ2c3J1MmNN?=
 =?utf-8?B?MWVmelFFcHdIakJ2c3NDUElzTzhxMkdrYmQ5MHh1UEJncGxTZXN0NWpYYUVz?=
 =?utf-8?B?WkZ6ekt4aUhveFdyTzNBV1FLMnQ0NWVlam5qUmlMK3pvTWYxak5ud2M0WXJv?=
 =?utf-8?B?bXdDMXduSFRLNnRUb2ZxamloaGtybGpkVDYzZTEvbXpQQjFYd2Jtb0lwa1Ny?=
 =?utf-8?B?amZrOHhiVnhKOEI3OWZBd0RnLzV0UEZTMnRDWlNNVmt5ODQ2K1l1ck82ZVVp?=
 =?utf-8?B?dTMxaEdFb25VbWtKbmFDSTVGODNGWXo0bVRSbG5wdkFnRFZtNkRJYWhrVHZt?=
 =?utf-8?B?a2p1am5sNHNWbTY1KzZ0VlBnTTliZ3hRWnNLR3ZEYlR2aUdRSDlqL3FKa0hF?=
 =?utf-8?B?N3BaVDZndmJEeG5DeFFTOTRJMUFyODRkUEF6L0Q2YkR6MklxS1dWNGY1bGFi?=
 =?utf-8?B?ejNIUXU0dDdjaHZDdkc2SDh1Q3Myc3R4di9yc2Z6VnpUSVZzVFNhRnJUZCt1?=
 =?utf-8?B?Z1lxNFdyUm9CNUE5MG9kMkFmRFBXWWpibEVxRzIxSWJZaDg5dHpndThBYnZZ?=
 =?utf-8?B?a2k1SzNiekIzYUIvb3lVQkkzcXp1Y213eHJ0Y3oybHJIcHBhQnhFaXZZalJ0?=
 =?utf-8?B?Q2Vqa3hXVXQwbk0wQ1JRRjVtR1V6enUrQmxyQklURmdhbFNlamNSUGt1Y0xh?=
 =?utf-8?B?K1RyUE40QlQzdWl1RXM3b2pNaHdjTllBNXA2NWFEWEcvU0FDMUduWnRDME1D?=
 =?utf-8?B?Mml0RGlKb2hHMmFZRllxTHo0Y09ZbUIyd3MxVyt4dkttOUFQWWRMdjVYLy9X?=
 =?utf-8?B?NkdseDdIUVBXNnVIdFk5L1pVL0RYQmlNRTNGS1FPcWxQRkFXOWo4RGF4ZGFP?=
 =?utf-8?B?UGtXdC9JWnYxY29UbHB0OEt1bUtVaGdhUkxXUmtQT1Z2WDE0K0ZIbWVNTlBT?=
 =?utf-8?B?Q0N5Yml2ZDloS3Vjb3hudHdza09MYVlpelhRYmVWWm80WVQyaks1VXYrRi9t?=
 =?utf-8?B?WjBEWjkzc3pJSjhKZXhPNWJ3UWNhZ1FXUGswbU5hZFoyVmVRVG02MW1IR2FC?=
 =?utf-8?B?U1pPWUdwdnMxWkZrcVJuQ0k1bnpJSk4rbU1naHN5Z0t0c0taemJrWDhBY2Fk?=
 =?utf-8?B?cXdXdGZseHFBSnk4M2kzemplK254ZTkzSFYyT0J1a1o3dEVwUVFJNmtTc2FF?=
 =?utf-8?B?SXBnajhiME5iODkvbmtIMlZjeXByYnI5WXFaSS92dzR3NFo4amNGbnU2WEVF?=
 =?utf-8?B?QjFyQlc4U3JTL0c5OFpxL3dpdUE5TzBjNDJaQWdmajUxckpyd0Q3WGNNWUZx?=
 =?utf-8?B?RlZuRzAxUzZhSjJyY1d2YzJ3K3BORWJKUHI3b04zQ24rVWJSRkRwcWpVUWxN?=
 =?utf-8?B?ZTZyVE5rL1lFK0ZEWUMrTFhodWFRaGtBaEVVTHpzemtmS25tK2hUVE0yOGRJ?=
 =?utf-8?B?YzJDeU4zM3FPVytZVlJUUGxxbjUzZ3NtZDlIUkdUVWRvRHBFd0VrTW03UEE0?=
 =?utf-8?B?dTllU1pzWjFCU0VORFgwcDNhSjJ3anNzVjdnNFhwOVV6dGdsZ3BnL1UxazFz?=
 =?utf-8?B?MkV4cmRyZHhTRWpKTlhsbmU4VW5QcU5JMk56a1A1TnVVekdhYmVWL2Y2UFgx?=
 =?utf-8?Q?eMLmp/vY3f9XXIAy9qAL96NCD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d8e7c2-da2d-451e-f120-08dc6058d9a3
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 10:09:50.6071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46AWQosw+BnY1RJewxZRBvKIkJx1J+LnbLW+RxfOEoWGsV3JG0nn1S/kWqkm1WHmvAQGDxwrom4wn+E1CNc4dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
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


On 4/19/2024 3:23 PM, Modem, Bhanuprakash wrote:
>
> On 19-04-2024 12:09 pm, Kunal Joshi wrote:
>> add missing commit after reset
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/intel/kms_big_joiner.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>> index 88923be6b..f325a9839 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_big_joiner.c
>> @@ -267,6 +267,7 @@ static void test_joiner_on_last_pipe(data_t 
>> *data, bool force_joiner)
>>         for (i = 0; i < len; i++) {
>>           igt_display_reset(&data->display);
>> +        igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
> Do we really need this commit?

Hello Bhanu,

Yes we need this commit as below reason
if output is already assigned to pipe D, then forcing big joiner is not 
having any affect.


Thanks and Regards
Kunal Joshi

>
>>           output = outputs[i];
>>           igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 
>> 1]);
>>           mode = igt_output_get_mode(output);

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8BAC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 05:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5761910E0BE;
	Fri, 28 Mar 2025 05:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiEv5rGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F66010E0BE;
 Fri, 28 Mar 2025 05:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743139820; x=1774675820;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QY1NOuO9OQNgJ071GogCLUMlvbyOCYVyU3e8/6G4m24=;
 b=GiEv5rGdbV03n0VOJsqmCjIV+krFZ0Un9bvRdtXR2ocJYMiLwK/ZwSs0
 EI0aVxkwNrhBETXWulivpmA0pdSKoE4SbEvr811oTXuEadD3hSXl4RaMw
 53Kbv2crPinHsaoPDicncIHQSp9khV3N7PBcmoRhKrz1UBgEN6iekM1yN
 jAoGAJwZY4qF+fbyEvDA7QlpYm+K4iSSvEIkE4jxRi7kKBZu/G1W3j/nI
 yGIEglYRW/lLT85z3NAknk5nfDU5vVgMYbBmJMYZQzd6OyCTLZKApKQgK
 QowiT4u7oi9uFpyMP09c4/tMiMWV8igzlTNUc+kjNFC7hvXVXt/P15m1F w==;
X-CSE-ConnectionGUID: Ztxln1R1TZS8poDBw0ACbA==
X-CSE-MsgGUID: hAMWsyouQdqkHfueYcDphA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43737675"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="43737675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 22:30:19 -0700
X-CSE-ConnectionGUID: tFaWJA7PSN+s0qOzIriYcw==
X-CSE-MsgGUID: vEwzwkD3QRChs0n3awmSZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125574830"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 22:30:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 22:30:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 22:30:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 22:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLbEEAd6kG+ftdfzzIbvvHnuGffeZGWjdPui4wKbFvuHEMobV2Iznt0GN6M3MvGcOth3VeVWZt1j58GM15OS2eOkg22xQTb/iyRl4a1erVVZeoTNJOxysa5nQ3i1JX8bNt+BzuDyp8HjgHoT8m6sGgmCURyHaVHAamx7tnFn88n9YXtCqgfCTrN3YT2P5LXTjH9jj78uDTAgwW2JtYueoAw4z66AB4LMtbvfIwkM6CyhWR2Qnix7gvk6OaR1E/I4n7vojT0ulmxVGrliHEgiX7OmiaYyMILDf9sr9Emqqo2Iqhu9att0ij8ROn2t8DnhYA3jH7yRJ7Q3HHSb9FZAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY1NOuO9OQNgJ071GogCLUMlvbyOCYVyU3e8/6G4m24=;
 b=KBdxX4j1BmcDoPJxW3X9mscVeY/1pqjdfJ9FNG7CYo7vfv1Z0l32wI4mOFLNubz7L4Ova4XXtUcg3MKDBMo/4plHw1jj2+0SyA09vS1VOoy7Z1Y+HeNRzr/OEYlR3CjRSFM4DNSH/mdSyKegBAcaU/rvtb9DRkIG2TKTslJiafrsMjVoKzsJ5wTbiisgkgnaD/U4pJ9O8SZZr/zYXd5WGaNo/rAIvAWYIzIK11DGcBS1TtP0O/eYcWs8a9gtc27QocQZ34sDurgtpq7j2Adyz8ywaj9g2TfitvrL9QuWiSyd4H/Fugd6IplsxFvCO1GvFQqgp5vA84xy66QYloJ3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 05:30:14 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 05:30:14 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIG1hbi9sc2dwdTog?=
 =?utf-8?Q?Add_man_page_for_lsgpu?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgbWFuL2xzZ3B1OiBBZGQg?=
 =?utf-8?Q?man_page_for_lsgpu?=
Thread-Index: AQHbn1NRdxfaC5kUDUmFwVkP8Ip89bOH/OBA
Date: Fri, 28 Mar 2025 05:30:14 +0000
Message-ID: <CH0PR11MB549133149ACB5E6F5C04D55CEFA02@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250327110616.59257-1-peter.senna@linux.intel.com>
 <174309460093.11772.18289412343678412859@e6b6f09ec485>
 <e3e6a7ba-e49b-41b9-ba38-d27e253a09f4@linux.intel.com>
In-Reply-To: <e3e6a7ba-e49b-41b9-ba38-d27e253a09f4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CO1PR11MB5042:EE_
x-ms-office365-filtering-correlation-id: 72ebd039-1ac1-4a83-603e-08dd6db99dec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?dURtQjl1TlZqQU1ORURuYi9hQUhOZHpCTTZscmJ1bmdXNEFnRXczTG5UVTM0?=
 =?utf-8?B?UlFkUG9MejBpS2p5d2pjVGVvYnliSytWQXRDMUZQa1ozZXdiYU14SkgzUU8w?=
 =?utf-8?B?RWFJcEhzZE4wSFUvVy9MTlZkR2dvRklSRm45QkpSeml0eXNLcGtQczBiMjhU?=
 =?utf-8?B?VVkrSVlPc0d3bElMTXdzSG50MENzY2Z0QkRVaENNalMvUkd5SlVqRXNQOVR5?=
 =?utf-8?B?enlGYVhjbkZEVnBZYk1sZ3E0Yk16UkY1OTFRT1N4aGJxOVpNNlRaMDdyV1Ji?=
 =?utf-8?B?eUJlV0xXOWR3YW5JKzVuK3JaMndrSk85MnFLajFBTmpMWWw1UHZkRlJNN1Jv?=
 =?utf-8?B?bTh0Y2N5NmFMMDhKM3RrRUhkcVJTWDNyYXFGdjFjcGhmT2MvYWd6UTkvemMv?=
 =?utf-8?B?NGhseWpRSFZESFFxRnl5OTl6L3NaVUpRalEzd3NnK25WSVI5QmZBTGtmelNs?=
 =?utf-8?B?TlRCSGt4TVZQL2NtTTR3cFg2VjN6eVQva2t0dTV6WXozUDhGSGdGY2JZN1oz?=
 =?utf-8?B?d3BISmhKcDR2L1lLRnhQQkVCZUxhRE9qUXFzajJrc1hXUmpLSU9CNldNWHZ0?=
 =?utf-8?B?WTdpWGtOOTAzaFhVd0FRcGJEMzlXZktNL1B2MG96RjBoSC96c0ZHR2l6SFZK?=
 =?utf-8?B?bXlZQ0trRnlON28wVHVUaDRkNUxmQ3RLcnBVY0FPNjhMY1pudnYzMFJZRlFn?=
 =?utf-8?B?SFNvSXFXTzlCQ1RsWUxsZFpiYkQ4aWxMazY0aUI3RkJwWTRGOUdYKy9PbzNT?=
 =?utf-8?B?a1ZaLytUSklpWUhJNDQ3RDA1MGxZdlVlaTB6dDlNWlhidGJWZ3ZxMlo1eXE2?=
 =?utf-8?B?VzVPamJtUHJKMG85YlNxWlFYR08zQWFEV3psUDk1dkFDUFhsU1MzeTZLQlhs?=
 =?utf-8?B?VVZidmJYMmdqcmVLQUVSR0hSZCtnM3FXVDRXSitZcHkyQlRjcUx3aFI2Zmc5?=
 =?utf-8?B?RlZVM2FwR1V1eFRqdFFiWDI0Zmo1R0JBL0Z0VjJOcldjelp2TWVCMmFmclM5?=
 =?utf-8?B?WWhZdHo1M0N6Q1V0OVVqZCtRa3RWdFJiaXdBcS9OWTM1Rk9lcktOSlBmSnZH?=
 =?utf-8?B?VVcvZ1gyVW1iWEdCa2g3dnNRcEw4UGVhK0tFbnRaSzlXVEJ0dXJXT3dyL1Fo?=
 =?utf-8?B?MHBWMml5amtnYk1KN3g2Wm5aWkE1WDFpRXJldmF4VWdyVjh4ZVQrTDlycXZ1?=
 =?utf-8?B?NUtnTTJSS1pHa29xdEZMYVZUQmtCQTNaanRMcEdIZUNqTnRSVzVsNzJkQmZ4?=
 =?utf-8?B?VE1RUEFCajlEMWFmOXJMekNvbUpCOWRISnpnNlZaR1krYThCVUZ1aDc2dXVo?=
 =?utf-8?B?dzRmVkNKd0k1ZzEyc3JaVkh2bDQ2NHdiSjV5SENKaWQ4N2NSZDBsb0JJcmUx?=
 =?utf-8?B?dGlERlA3OWxFZTlPNnhrRHY3R2dlZTVCWVNkdVkzNXJ4eW5tSThwVTI3OERU?=
 =?utf-8?B?UVpMdC9FcU9tVnNoL0IrVWdUR011ZlY3cnpHeGRVaWxZTi9yVkNFVVZqZ0Ix?=
 =?utf-8?B?S2x4VlVMYzNURE1FNTZVVjNxUG9kVEs1OGw2NmhCYThFSVRrbzVDNjI0T3Mw?=
 =?utf-8?B?ME52aXc3Rm56aTcybnJYbEJveFZrQ1hHLzBUZFZhQTQ4S1NXeEx6OUwraWJp?=
 =?utf-8?B?V0kwU0s3bnBGeXRJSGVTd1JLL3pwVmlrU2l2cWhGbC9IamRVUjhqOWpqZmlX?=
 =?utf-8?B?cis3SFlXeWYwV3JqeE92dExQNXVkZEZwTHlCa2laanlrQU95YVlKeW02OFBy?=
 =?utf-8?B?cWI5MDUwUk5zNXQ0U3FmSzBEUzRBNVhOb1hSMC9DUHg4NjRlclB6bUdzUTF5?=
 =?utf-8?B?c05KWmJpL0R0dWZlR2xGcFczQWxMK1RzdS9OeGtpNE9Zek1NdmNHdUlIaDdk?=
 =?utf-8?B?WGRWdlFsa2FjaEZXdjhPYTJOSlBpbnc5ZXlmT2RYajg2d0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVBPZFhiTVY1WUtWNG9POVlhWkFqRG9jNi9kYVAva0xEbkNVZFdqQ0g2K24z?=
 =?utf-8?B?emU5ZzFsV2J0bVBEdTliTjdMZkplaGpxNDZPREFnbXZ3SjQzU0ZCbnZXSEJX?=
 =?utf-8?B?TFhldDV2QnlYTFEzZFMxT29mOE84RnZ4RSt3L3I0eURYbVJZa3dlcjVoV0FX?=
 =?utf-8?B?RzFHYm9yT2poRFR4d3NFVks4SG81SzdVUyt5QU9LeXhMNzNOMDNQaUZiUVFE?=
 =?utf-8?B?QjlxNGdZaklLY3dvUXJZNEtyalhKQmJId2poMExHM2FTNHF6NXB3V3E4UGcv?=
 =?utf-8?B?dlNOQklwWWc0RElqdCtaWG53ckNvSGdNU0RjZWdhcWVONkJOSG9pb2JGd2Rr?=
 =?utf-8?B?UVRjTXBYTGpZV0J5VzUwdlJFN01BTWQ5NXZSVmt2RnQ1YkFkMGRNS0NHV0w4?=
 =?utf-8?B?WHZidFF3NnduejJ4NkhsVjZXMUNYZUJxWk5aSGt3cGNnMW5IS1plVHBrM24x?=
 =?utf-8?B?M1IxMi9Pd2pVQ1pjeWNQbHVzT2V0aE53eEhBdzVickVMemRnWDhIZWpOcmt3?=
 =?utf-8?B?Nm1QaWIzNnFUeWVYZ0g1RFJzWXhJdFd2UUM3NDF6MUU5M2c4cjRuUzVpODli?=
 =?utf-8?B?SG5VSEZHS1p0V2IvcUVDOU1KL0lNQlA4Zm9sbU45VkhEVEl0Zk41dEduZG1D?=
 =?utf-8?B?OXoybHhNU0IxQ0NGSjR1WXF3T2EveUREaTN0VEJtMGJUR3VVcFNIQ1lNaWR5?=
 =?utf-8?B?bVFtQ0YydExsay9QR0RseUFWYmVqMFVic3BrRkRpSEdUOVVrS25hVXcvVEtV?=
 =?utf-8?B?RDlmckhzcUQvV0JXc1VVeTVJOXZxYVZXTDhrT25uMkJFV09pV3N2YmZMRSs3?=
 =?utf-8?B?ZE9NMGdqZGpzQyswbFBOZEdPYklTUnh4TnF0VXZaRjJCRWsxZGpsQmd2Y3lk?=
 =?utf-8?B?WjQzUFZEWW1QWis2MzRmbVRJdm4zaHhqTU5HcW5rcnY1eHVzNCszZ3hIZEdX?=
 =?utf-8?B?TG51Vk5QK20vU0l3OENNUUZPTkc3UGdGVXFaMnhZOVB6aGM5OC84d0I0U1U4?=
 =?utf-8?B?RnAwK2VXRGVjR0VRZ05RSzVoTHJrZXQxa0lDSnJxMzZkV2sxekFVb0JYTmpY?=
 =?utf-8?B?TFhUV2hkMGY1YXNuaTB5SkJkd1BDVnFYTkcrOEZlM0pUYmkzVk1lZ1pWV04y?=
 =?utf-8?B?TERuOXBqTGJ1TG8xZ0YvcU5RQUJDYXVmd0s0MUM2eWlueWZZZjlHakZmMUZ3?=
 =?utf-8?B?cEpjTHBqTUx2VjdaYkFoQ0RUdkI0MktsS3BjdFBLblRXd28wS2NESTVQZEs4?=
 =?utf-8?B?UDUycllPeHVVOGZna24wWGJmZXZkU1hxeXY4Z1gxeHlTMGpZVGR1WXpMYXhl?=
 =?utf-8?B?OXpVVjc1a0llZE5WdzdVNDJsNVMvZ3YyaS9IeTFVaFB4eGcxVWFyMkx1Y1VS?=
 =?utf-8?B?UkRtNnJjaFhjVXEvVlRqOWZZTnhUV3hOMlU3czA1MkZNaVllNmQrUTZRcmJG?=
 =?utf-8?B?dWVYVnRiNnQyM2E2bXpLT0VpVE4zc2Jwd2pzMHp0cDUzTU54RWltdTZpQmd1?=
 =?utf-8?B?OSt6UTc2QnJRcWQwME05N1dJL0ZiS2hsMFdmWUNqditZaE1Ia01mSkd4dkxR?=
 =?utf-8?B?Vk02MktZTmlCVE9SUmNVUVNMVVYvNXVzRmFHZWROb0cxYk12Y3l6UUxQeDF1?=
 =?utf-8?B?b1krMGJkelBMTmppM0VUSk12ZGd5ZDk1TTNkdTRpMHdoU0Y2c3pWV0ZMOGl4?=
 =?utf-8?B?eUpoTVgxM090OGlQMXQ0YmRpK2F1ZW0zSXBGZUQyL0VraFlqMjl6cHdiMmFC?=
 =?utf-8?B?QlpVOW9zeFJ2WkErMW5sYWNzSzJCSkU5OG8xenEvQmJQeHNBU0ZwTHN6TTND?=
 =?utf-8?B?WUJOZU5MN243MFRsOVhjK3pUYm9JUkRMWlh4ZXZ2TTVuNWJXbjU1Z0lQaitt?=
 =?utf-8?B?bTZINFJlbzVaU1lUQy81ZEo0dm94MDhNNS9DZzZ6YXJIWk1KdzAzSGdsNU9C?=
 =?utf-8?B?MWxlVGZIa1RIRmk0R1p6THBVMVc5QmNOa0FBQXZPRGZqR3I4R1o0QVdmeC9R?=
 =?utf-8?B?SEpDQzk5VzArbG5SRWVId3RiUHo5TkkrTjNZOVlUUVpidE8rdVZ0T3RMY2JZ?=
 =?utf-8?B?NVdhQVIzWk10OGJPaGdTZnhESk1RWkpmTCt3aExDUXJDMXFKS2lLSHpQcWcv?=
 =?utf-8?B?d2trc3VnNWRKaDJoOU5ZT1QvSmJ2TTR2em1GbStOdDdoNEQycHVSMUdGLytp?=
 =?utf-8?Q?M/mkae+ObjfhgC1fjzbvPtMWejfm/ZqLtKLRCYYCEWfR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ebd039-1ac1-4a83-603e-08dd6db99dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 05:30:14.1905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNGwicZHNWERUUpVE8k6FJVKxirchII/5z/hHrrQc9zTly2e7XvjGRitcEP3LlMCoIOGlAwot+8c3Qu+qaHAI+cxZ5tvC3HM6g8seskhlVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ2ODYwLyAt
IFJlLXJlcG9ydGVkLg0KDQppOTE1LkNJLkZVTEwgLSBSZS1yZXBvcnRlZC4NClhlLkNJLkJBVCAt
IEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90IGJlIHJlLXJlcG9ydGVkLg0KDQpUaGFua3Ms
DQpSYXZhbGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWlu
ZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDI4IE1hcmNoIDIwMjUgMDE6MzMNClRv
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZvciBt
YW4vbHNncHU6IEFkZCBtYW4gcGFnZSBmb3IgbHNncHUNCg0KRGVhciBJOTE1LA0KDQpPbiAzLzI3
LzIwMjUgNTo1NiBQTSwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0K
PiANCj4gU2VyaWVzOiBtYW4vbHNncHU6IEFkZCBtYW4gcGFnZSBmb3IgbHNncHUNCj4gVVJMICAg
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0Njg2MC8NCj4gU3Rh
dGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hh
bmdlcyBmcm9tIENJX0RSTV8xNjMyNl9mdWxsIC0+IElHVFBXXzEyODU3X2Z1bGwgDQo+ID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1
bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVu
a25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xMjg1N19mdWxsIGFic29sdXRlbHkgbmVl
ZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0
aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0K
PiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTI4NTdfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1
ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhl
bQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1
Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyODU3L2luZGV4Lmh0
bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDEwIC0+IDEwKQ0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhv
c3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
DQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50
cm9kdWNlZCBpbiBJR1RQV18xMjg1N19mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0K
PiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGttc19j
dXJzb3JfbGVnYWN5QGZsaXAtdnMtY3Vyc29yLWF0b21pYy10cmFuc2l0aW9uczoNCj4gICAgIC0g
c2hhcmQtcmtsOiAgICAgICAgICBbUEFTU11bMV0gLT4gW0ZBSUxdWzJdDQo+ICAgIFsxXTogaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTYzMjYvc2hhcmQt
cmtsLTUvaWd0QGttc19jdXJzb3JfbGVnYWN5QGZsaXAtdnMtY3Vyc29yLWF0b21pYy10cmFuc2l0
aW9ucy5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTI4NTcvc2hhcmQtcmtsLTUvaWd0QGsNCj4gbXNfY3Vyc29yX2xlZ2Fj
eUBmbGlwLXZzLWN1cnNvci1hdG9taWMtdHJhbnNpdGlvbnMuaHRtbA0KPiANCj4gICAqIGlndEBr
bXNfcGxhbmVfbXVsdGlwbGVAMngtdGlsaW5nLTQ6DQo+ICAgICAtIHNoYXJkLWRnMjogICAgICAg
ICAgTk9UUlVOIC0+IFtTS0lQXVszXSArMiBvdGhlciB0ZXN0cyBza2lwDQo+ICAgIFszXTogaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg1Ny9zaGFyZC1k
ZzItNi9pZ3RAa21zX3BsYW5lX211bHRpcGxlQDJ4LXRpbGluZy00Lmh0bWwNCj4gICAgIC0gc2hh
cmQtZGcxOiAgICAgICAgICBOT1RSVU4gLT4gW1NLSVBdWzRdDQo+ICAgIFs0XTogDQo+IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI4NTcvc2hhcmQtZGcx
LTE1L2lndEANCj4ga21zX3BsYW5lX211bHRpcGxlQDJ4LXRpbGluZy00Lmh0bWwNCj4gDQo+ICAg
KiBpZ3RAa21zX3BsYW5lX211bHRpcGxlQDJ4LXRpbGluZy1ub25lOg0KPiAgICAgLSBzaGFyZC1t
dGxwOiAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bNV0gKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAg
IFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg1
Ny9zaGFyZC1tdGxwLTYvaWd0QGttc19wbGFuZV9tdWx0aXBsZUAyeC10aWxpbmctbm9uZS5odG1s
DQo+ICAgICAtIHNoYXJkLWRnMi05OiAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVs2XQ0KPiAgICBb
Nl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEy
ODU3L3NoYXJkLWRnMi05L2lndEBrDQo+IG1zX3BsYW5lX211bHRpcGxlQDJ4LXRpbGluZy1ub25l
Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX3BsYW5lX211bHRpcGxlQDJ4LXRpbGluZy14Og0KPiAg
ICAgLSBzaGFyZC10Z2x1LTE6ICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bN10NCj4gICAgWzddOiAN
Cj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg1Ny9z
aGFyZC10Z2x1LTEvaWd0QA0KPiBrbXNfcGxhbmVfbXVsdGlwbGVAMngtdGlsaW5nLXguaHRtbA0K
PiANCj4gICAqIGlndEBrbXNfcGxhbmVfbXVsdGlwbGVAMngtdGlsaW5nLXk6DQo+ICAgICAtIHNo
YXJkLXJrbDogICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVs4XQ0KPiAgICBbOF06IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI4NTcvc2hhcmQtcmtsLTUv
aWd0QGttc19wbGFuZV9tdWx0aXBsZUAyeC10aWxpbmcteS5odG1sDQo+ICAgICAtIHNoYXJkLXRn
bHU6ICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVs5XQ0KPiAgICBbOV06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyODU3L3NoYXJkLXRnbHUtNS9p
Z3RADQo+IGttc19wbGFuZV9tdWx0aXBsZUAyeC10aWxpbmcteS5odG1sDQo+IA0KPiAgICogaWd0
QGttc192YmxhbmtAdHMtY29udGludWF0aW9uLWRwbXMtc3VzcGVuZDoNCj4gICAgIC0gc2hhcmQt
cmtsOiAgICAgICAgICBbUEFTU11bMTBdIC0+IFtJTkNPTVBMRVRFXVsxMV0gKzEgb3RoZXIgdGVz
dCBpbmNvbXBsZXRlDQo+ICAgIFsxMF06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvQ0lfRFJNXzE2MzI2L3NoYXJkLXJrbC01L2lndEBrbXNfdmJsYW5rQHRzLWNvbnRp
bnVhdGlvbi1kcG1zLXN1c3BlbmQuaHRtbA0KPiAgICBbMTFdOiANCj4gaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg1Ny9zaGFyZC1ya2wtMy9pZ3RAaw0K
PiBtc192YmxhbmtAdHMtY29udGludWF0aW9uLWRwbXMtc3VzcGVuZC5odG1sDQo+IA0KPiAgICog
aWd0QHBlcmZfcG11QHJjNkBydW50aW1lLXBtLWd0MDoNCj4gICAgIC0gc2hhcmQtcmtsOiAgICAg
ICAgICBbUEFTU11bMTJdIC0+IFtTS0lQXVsxM10NCj4gICAgWzEyXTogaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTYzMjYvc2hhcmQtcmtsLTEvaWd0QHBl
cmZfcG11QHJjNkBydW50aW1lLXBtLWd0MC5odG1sDQo+ICAgIFsxM106IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyODU3L3NoYXJkLXJrbC02L2ln
dEBwDQo+IGVyZl9wbXVAcmM2QHJ1bnRpbWUtcG0tZ3QwLmh0bWwNCj4gDQoNClRoZXNlIGFyZSB1
bnJlbGF0ZWQgdG8gbXkgY2hhbmdlLiBQbGVhc2UgZml4IGFuZCByZXN1Ym1pdC4NCg0KVGhhbmsg
eW91LA0KDQpQZXRlcg0K

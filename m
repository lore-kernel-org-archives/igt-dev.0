Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C75EC021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 09:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91F010E171;
	Mon, 17 Feb 2025 09:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igG+YS4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE7710E171
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739785756; x=1771321756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b4up6wByB3DBL46eMm4WDAxcTmqGYv6PkzOwvd7FK1M=;
 b=igG+YS4gZCybj8LW0+wv3eYfu6fqA/Egg5+/kNsTB3X44poXHT2tXM7Z
 0hQnzkj/M2CHKIQtBFB3g8Utm5Cr/HrdmWXUX9hkxb1L8lpZZpha29Kx7
 If9Jblv3OXuC2wUb+PQnk6GdpEFBQ1jOcCYy+WeVNUtJzVzCc6vORyAGM
 B23L102PAExmddtiXxKbnQ6q89bx8em9iM5TMkXD/CwNRB/PeFwKwZOVp
 0ZEstvZ78dzNhA1QiuiQRhushFhl3Ivr/4eIvo2yS5Ss7nERWz7N1AWKH
 v6bX/TFFT82pWmncvo7023xHROGMOS/UU9T6PXBCa0QcESYk+qd0VMCw3 g==;
X-CSE-ConnectionGUID: wyMJTwKhTryjpRgyvmPvpQ==
X-CSE-MsgGUID: zQRiVZBXQ6OPo7/rD3iaAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40583599"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40583599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 01:49:16 -0800
X-CSE-ConnectionGUID: TyxsjRBPRM62RtRP/1B4xg==
X-CSE-MsgGUID: xXeELUenTkal5SZ1r6kl8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="119085010"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Feb 2025 01:49:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 01:49:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 01:49:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 01:49:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2uIHY1zhiuL+Xc+ZWnF8HgLJkLNRDg5IaTLt2+fgKPaBbAFtcxg4YlDP5B7+zPB/HcjHj0IRN4TtFrepJjfYSQAxpBLC9CooNk/OwUwxzdlTm2rgeGDJGSegc2AXGsoH6GLstgU7bxe8HUiKX3rex5VsHfkejSngB+SOglql/nFeaS7wyyiTJWwbh0WyHaopxFCYUXf4rwLfv5QsFY8dHcZg8SCai2SJ99ForOo3MKrYdbUEYYuRgpfkv1/n5LO6yGgWxmWHcoN6eSfAcHtbJ4qnXTHNpjzB1J6ZfGBn5Xs9FOXiBxsAoOdUvLdQgk9YDc3ra5MDvKpgMhAUnME/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2Naz+xr/HRqFeh1SUSGVN/cWsYop/DfWbBLeFVk2XY=;
 b=MObVLBs3tfQngJhPsBL2GGQ7utaPZHAWH3Dt5/3RYDoloZS1LzjgUdmitG1IHUw4V09yAFPJx4XncNfcZtAVMZ2fH6cRrS3Pw+fzYP15Sp5RzMZKw8q3gMe5gu9Wikj5hSjGDnYXivgEh8i0jQQ9wpzeqrikCmlQi0iH7Uq1CalxkEfDUd1V96EEI2L8feeg1zb0Yy+XZMN4msSJJILIoqGtzMvpotb7D+05r6DFbXFN50QfE7GBRt9jgHKiLLKrXKawPLzogBKPstVji0fa7eVTITsrJiUM6+eoTuE1yCbaXKxqc/fR6uCoFDctydg0z2/UwQtvM04ujrkmdg8acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 09:48:32 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 09:48:32 +0000
Date: Mon, 17 Feb 2025 09:48:20 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Pranay Samala <pranay.samala@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <karthik.b.s@intel.com>,
 <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_draw_crc: Add more logs to
 skips/failure
Message-ID: <twbfilcwh7zbgzqnhutdmxktgpbkpvbodizp2mmcm6irypgm6n@wediwetnmqrc>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250217083432.771635-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250217083432.771635-1-pranay.samala@intel.com>
X-ClientProxiedBy: ZRAP278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::22) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc7d10a-3a10-4924-71a9-08dd4f383d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFpPMUx0S0Q3SjFpUXhheWlhUjNQZER2ckJ0TG1JWTZNVHNjRENqTmtGN2hz?=
 =?utf-8?B?eGpONW9GZHlKbVAyc2U0Z3RVR1lUa1pFNWFveDRuYngrYWRiSFZHY05nUmtL?=
 =?utf-8?B?R1RxQVlYeHNxaU53U1V3V2FIVEV6Wk9nVktoYkF0THNQNU1Xd2dmNlJieW5t?=
 =?utf-8?B?QXBRQTgyUUMrRlJNNjVUYnFWdTlMUDc2QVFmamp1TGVFeklOSVIxaDdGMXJw?=
 =?utf-8?B?RUYwWkVGTlozNGs0K1lySlhnK01mYXNLZTZDS2liUkZyQStDSjM1ekg4Nmpk?=
 =?utf-8?B?Ylh0NndPcElVc2kyQ0lFdkR4TWFRU3I0S1R4ZGxIMmJLOGZlUGM2KzBQZnBu?=
 =?utf-8?B?UW1xMm5PbXJ0U2hMaThRam1rQkNvRWo4ckF3cVJCMmF5NFljOHgwZE9BWEdB?=
 =?utf-8?B?dVNSbk95NGdiMG5FTGQ4WlBGMUp0OU5Yd3pMN2g3Uk5hd21HV3NJS1pIOTV5?=
 =?utf-8?B?RWwvS2p5U1FsWlNMQUprQlBaWlJlMVZncHRGWDRHNzN5Smo0TndGRHh5Wktn?=
 =?utf-8?B?NjNkcDVoNWpkVkRhQzdVUm9MMyswU2JMRjNjdXNJQWR4TTJGWmdkTlJLZjFk?=
 =?utf-8?B?YVc1Q1pjUE1ubTA2R2J4OEJFNVdZL2dKN3c2SzZJMkVnODk3UnpUQ05YSFI4?=
 =?utf-8?B?ZngwZmduK21RUUZaVU5sN3FZaCtUWDVlLytKSk1vQ21DVVlvOENiNy9HOWc0?=
 =?utf-8?B?WDZGczdJbGpSaHRTdXZEbXRaUnZ4V3RyUjlMd29TdFMvUnNad3lOWDJWaGFu?=
 =?utf-8?B?K2JiRTlIS1V6SFlsenJ5aGk5RWdEam9DOXZzZXVUazhpOEhTbnlFOHExNGl0?=
 =?utf-8?B?OW9QNldncTFTQUI4KzlMQXlOcEZXL01jaHpmZGl2bWtTSEo4Tk1iUmhaWjNS?=
 =?utf-8?B?emw0RUFJVU5DQmgyMUw4TFZ6a1l4anJxU0daZDNiTDZYVGdJMHg0SzNZWkVB?=
 =?utf-8?B?YlZXOS93ZXlUVWwrcUJrSVVkbTNDcVgwUVc2Vk5oakxYdEY0WitPSE9MY2xk?=
 =?utf-8?B?Mk9XVTNCWGtrc3FrY3BTM1padERweVhEVWdwWU04cjNiMWJUUHV5ZE5YWmRl?=
 =?utf-8?B?dFBnMXF1M2JPZ2x6K3FEaXRDVHhrazNtRkwvSDMxRm4vdHZMNWxBV0NrdWw4?=
 =?utf-8?B?Y0VHUHljaS85R2pLTzcvUEErYUs4QW1Iei9VUDFrdkxWTWRVTlh2OG5HbVYr?=
 =?utf-8?B?TlBhbGtEUkhDUGNSb05UcUp4dk82eG84bXo2SXlNaUpBNkVHRXZLeVljOVJh?=
 =?utf-8?B?cG8zVnBuNzdDOHZqeGJJQUcrc2dEWU9XYzFOVEE4d29XcGF4b0dNWjFpaUZV?=
 =?utf-8?B?TU5jYjlNQ2p1SzB4T2VoSEJyelpsMUdncjRTMGZQK3o5Q1MxSE5aRkdXNE9p?=
 =?utf-8?B?MTZNUEFuZ25tT1A5S2l5TkhDSU1OM1NhNmh0SkRVdGNVelduQ2p6Q2xwQ3lV?=
 =?utf-8?B?b29MZTU1WnloQld3RG5qL3VmeUd5YXVmellQT0JheUl4WTZNSmlUMmQ2S0pY?=
 =?utf-8?B?dU82RDZzUnZEd3NGcktVL3ZEV1lIVUppblBSak4rVFBoWnFPLzRLQUpVYm5P?=
 =?utf-8?B?QitGZnZLRlpPaE9kOXl6Qkc0S1drNEJkNksxZjVDMGVzSUtwQjI2ZWMwdGFF?=
 =?utf-8?B?dlVhSlRHK3hGa1JKR01veTZnVzVmbkUycDR5bFo3S1NjclF3NnQxMGlneTNO?=
 =?utf-8?B?NkJPekxXemZWbHpmY3RNQnRacjRkbUlEd3ZXRFNhcUp1OUp6L1ZNODc0UTEx?=
 =?utf-8?B?eFBoZTdWWjRmaHRnRS9mV2J5M214SnNnTTBMYWFhY0o3bGxMOURMTklUWTRF?=
 =?utf-8?B?ZWJOamlhU3ZvMkJkZlRuTmwvRUxsZ2x2RVFFUkJXcHZhSEt6M2hYZDlIMS9q?=
 =?utf-8?B?VWVwZkVVeDJUNE9BazRTYzZlS2tZekdMK0RyRmdacTRrajZiaWtCR3E4QzBa?=
 =?utf-8?Q?R4Xh2WXRYt3+35YaxW9CCv0G9UTEOaXO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlZEblVLMzRlbmlEdkx1bkhibzBib2pQUTVKNTIrODVUbU9ENWl2ZHBQWitw?=
 =?utf-8?B?bmNCZmJsa3d4UUVaQmRJUlB1aFZ6bXJqcTlXd09ML21iZlc1TTdvdzBZZ2pI?=
 =?utf-8?B?WVY2dmp4a3BDaE8ycFplWjJBVFVHd2JuR3NYSHRRRVkzQ3F0bHRub0pnMzFC?=
 =?utf-8?B?emNKTHZlTWxnSWFPZ1lTQlYzY04xQklid2F4L3pScDlhdTltL2FDNGxIbzkv?=
 =?utf-8?B?UkViZmlIU1pNUVZ3cGpHdWsrdE5vcEcyaitKVldqY21UMW1HaDJoWTR6RDdu?=
 =?utf-8?B?Y29tUUlmQVRmQjlsWnplVnF5cmFmOHR1Zkt0VGpHWkJ6bzBSZW5GOFVCM1VG?=
 =?utf-8?B?Vys5OUFHcy9Wa1NrcFQwVVhWZmRrK0NrVzZ3ait6NHFHY1Q5ZnZyUEpHY2xm?=
 =?utf-8?B?UWxqdTc2c0NmTytScEdEbE04STRFdjVhZ2JvWU1RUjhVVWhoTW91WXBHRzVC?=
 =?utf-8?B?UEZ3eGxyelZXeFk0U0JORzlpMzIrSGJXOVJnQXhGNER6YjR0dFZXa3EvYW5C?=
 =?utf-8?B?NTdoT1lRdy9LTndQWjY3ekM3bThVSUprbk90RU9veHpVSForWkdyVVVXZTFD?=
 =?utf-8?B?LzFpaE1hVTNEWkRRMW8zR0JYV1VBRVRmUHNWZUZtRVlRY0FzREpPeFRvcjA1?=
 =?utf-8?B?NElmZU4wWGthNjBkVk8vYW9uK0FaZnhhV3NXSndYWFNTNmJyclREQlNLQkFt?=
 =?utf-8?B?TlhSNEZLK3BYdER1TE1qNWtmcmVPY0dWWm42b1c4VGoxTCtvOXcwU0VoeW5C?=
 =?utf-8?B?K3FGWENIRlppVEl4MDBvUzNVd3ZqVzFhaldQSzZSSGFGMk9WOEZVUDh3dmtr?=
 =?utf-8?B?dUxrVmU5MXZyaHZLMkI1M0FaL2pKS3ZKeWczUGZsRlJFdit5ZW5VOEFUMGhv?=
 =?utf-8?B?SHByNzN0VktQbkV5NCt5RmhKWjFuT3AzTHloVGRqSWkzUWYyT3lXMGlzbUg5?=
 =?utf-8?B?bU1pazM1aXl5SzdpcGxCZUp1eTkrZEpraTFnN015SUZ0bmp1R25sTnhXNjFZ?=
 =?utf-8?B?UXJKL00xOXNsSFh0aVdTT0NLNnJBaE53WEU4bTdocUxiRFMzZ3J2OWZqb2VZ?=
 =?utf-8?B?V2J4aUQwMnhsaEwyOEU2NitkQUh1N1VyOVROV3ZGcXhiRHNzM0cxT1BnTWpn?=
 =?utf-8?B?dTNobTJtMnRJVm5DVk9Rai9vNktlN1RQYkV3bUlXbFU0RUxpZjdlcjRuNGZK?=
 =?utf-8?B?QmNEbWt6Qis2Y3IxMUNtekg1bkFkS1hUU2NaWHFidE1EMDdGRW5OdjlobEZW?=
 =?utf-8?B?NWI1NGlZZVJwaHNxZ0VUNDN6eDJ2NlZQeXkxOThhd2JwQmloK2VLdk12b2tV?=
 =?utf-8?B?OUdmSnV1bXV2N21LTEJKVHlmU0FieDl2NTVHZCtOK3Q5VmNlcEUydUllcFQ3?=
 =?utf-8?B?eW5KYVdGMTlrWndDNE1zQnc2TXlFS2VEN2ZOVjVVN0VBTlo2Sk1rZWpuK0dj?=
 =?utf-8?B?L0dLQWpsbVM4S0RDRFdwdk04SkhkMHBnQU90SGc2RDFvSytFTUF2MEFVa0pr?=
 =?utf-8?B?eWdiWC9tZU9ZREFibCtDSUtSVkVjVnJBeGRlRUtRc2hJYjVDYkdHbFZLNzZu?=
 =?utf-8?B?VS84VmxuNm9qc2VjK0hLTmdZVUdZWE1FMlpMM3haam1DR0xIYXBENU1TZnlq?=
 =?utf-8?B?cUdxN0tHWmNSQUQ2cDkveVRsUU1Jemt2WXVMcjR6QVBLQUxpd1h0VTd4QXhG?=
 =?utf-8?B?NlI4V0U5WmViU1h1a29IQ29TRW5IdmRzVDlkbTVENFhjdjd3Yzcza0FaQ1ZT?=
 =?utf-8?B?ZFlobGN0bFFoa0ZWdEtEeDdUZkNMNnZpamR2VWR0VzFKK0JmeXdKZ2p1aHlV?=
 =?utf-8?B?M2VBRkpzMTJ6ckszd1hOZ0EwZE1VTkFhLzM0NVJjb25PeDlZanJhc0lnZFBq?=
 =?utf-8?B?SUNJeHNMcDNIUU9NWWtCK2ZGSmNYS2dBRmY1UGhxZnNJS2hkeEQ5d0tjUklN?=
 =?utf-8?B?a1NYaEtRSVJnNzM3bkpNNlR0SjRtRnBzL2FPeUQxMDdYbWExQmdFY1FKcjNl?=
 =?utf-8?B?YjFxeTE0N0NjRllmVXplekxESVI3eWtKdFN6b1ZySkRVUTV1d0d4U2hlS1FD?=
 =?utf-8?B?ZTVMazA2TXFvVm9SS1VLRDBpTVNhNWw1dFVxeThlZ09aMEJkWlI4VjdidzRW?=
 =?utf-8?B?TGJob1hpdjhBSzJ6SUp3R1cyYnhUOUY4SXJxOHRZN2Z5S3ZGU3FaaEhmNDVR?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc7d10a-3a10-4924-71a9-08dd4f383d5b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 09:48:32.4551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgoPB4aKPPGTOF6XU9hrw+krHFXqOW4QSW7m5i5WtaZSV/WiKDQ5hpBeXaIBFz3/ozEbJrRG6xWcIp8MKpI9JtpOqUPvz840aK3Ge59tMCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
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

Hi Pranay,

> Add a flag to check if display supports any format and
> modifier.
> 
> v2: Rename the flag variable to meaningful name. (Karas)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_draw_crc.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof

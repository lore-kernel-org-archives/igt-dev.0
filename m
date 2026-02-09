Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A376AE81BBE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 13:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559DC10E2B8;
	Mon,  9 Feb 2026 13:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsJAFdwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F6810E2B8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770642280; x=1802178280;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=jI025d+dEKq7TRdvU+ubhpgoCzJeNMCLHSoVydy0uCg=;
 b=UsJAFdwyAEyqTtGYiSiBA7FDHkGOttvAG7iR0hunmLB5mOEMr9Ii+tGc
 QwmLlcgNVI1fToJ3SVOTJtDOCKDIHTQABGoK+JJ6G4RQpr0TTvKPYD6kW
 bOPwgLzoD0YUXLnWCe49hgSb2ny3o5hFiJoxwj6OxzOOqpPT/F+Rwt83C
 7NlVq3qYI/p6wW6aoZOJrJr7grwwFpbaDEp57iD1+Yj3JXTfif21P++MW
 TvlyRBR0nvsp+zRjJO8D7RQNbS9Xq4yK9izIePaTwIjsqFStRYtrh7Pgf
 cDICiDmvSdzGmzFoSIE7+kUbuyV0xfzjZfuQqeMki/hmFcoA5pq0cgI8f A==;
X-CSE-ConnectionGUID: kJcowdM+T9O7ZxYVAUA9OA==
X-CSE-MsgGUID: 52MKlA1RSx2y8eYYG3zPmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89335589"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="89335589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 05:04:39 -0800
X-CSE-ConnectionGUID: b+MUSN8SSBGe57HU9dYRDA==
X-CSE-MsgGUID: vzEY6H4LT7OFV0HQi8vgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="210752749"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 05:04:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 05:04:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 05:04:38 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 05:04:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uM+fYPW83MrMgXwusQu+6ygXxslQSinpiPr1Fe4lZWJ0qu/Czabq07rc4SlFvbDs6zNK9uN4cCjo63QMExvwoLB5Jv515Sg9hNitZgqhV+FaYNSjBQdjiq2Lh6HBlnKBxnCEu0bPManP6UKu8tS9v5I/UK7VLlQbzeRcllvnl0ii7giLLKNvjrQRvnQMpRMEOSoh7jkKpi+3XoyVUPKK4StiavnAXejuASQwUW6lwu1LBmKpA2sJGydT5Nt2bu9FzOIeeldAphSixbpMxRnezlvdvLbUG+yPdC12yCKqCj22FZhhbQKXOQQT8PvDlNI9u+NyjGvO/SV8i4pg8LbVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI025d+dEKq7TRdvU+ubhpgoCzJeNMCLHSoVydy0uCg=;
 b=QMxQpMcFS+052DBH45ROrb1kzPKbEEmBjQhHsVViP4mpt/h5HySE7cLhudDnijtJlZAAcXDhqBqxkbikP/Eel2mg5l4Rkp3oocPkZnjY2nk+0InK/WQjv9FKTqrfKUPSoIRIfRXDbACDqOnni+IQzYnkkIbS/1rZAqOvRsg/aD2HUpNLzjgVfpk6YA2jTUL340yCxgiIhav2EbhNWu3Ug1JC3+pBOWWcK2EFTNYscgiG712xi8tAR51efAmQYTwP2CfFhzCS2wnHY5gp4p5aJzULXIIR+9xNWbwtRfCsZ12qyWP4IyOi6tsR0tNnej/S0AinoAHGWbgh6y4XpH9nKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 13:04:36 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 13:04:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 14:04:46 +0100
Message-ID: <DGAGB0XO4GTK.1YCT6235A91O5@intel.com>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t v7 1/3] tests/chamelium/kms_chamelium: Add
 connector_test() macro
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260203034546.1516152-1-mohammed.bilal@intel.com>
 <20260203034546.1516152-2-mohammed.bilal@intel.com>
In-Reply-To: <20260203034546.1516152-2-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 62069fd2-138b-48b9-62ad-08de67dbc6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2FIMHZkRHd0SVBtczRWNVQxYlF2WTBqcWJGeW1JUWFEWXlKQ09iQ3phVElD?=
 =?utf-8?B?by9kM01Xb2MydU1MbXQ4K2hmc3dUMnVYYW9xV05IZzNISUFVeVFlMWNkeDdi?=
 =?utf-8?B?RTFMYVN1dnN1b1MrMkQvUjRkSElYM3lXWWRYV0hBSEQxM0hUbjBHK3BzeC83?=
 =?utf-8?B?R2txRkxPWGEyT1Z6M1U4OFVFcUpiOVhndUlaUThjRUJ4bzZpK04rZXkwVGlw?=
 =?utf-8?B?SjkyVHhxdDBpNkZSUHR5Q1hneWRjRHhJVnBKSjVHM2svYzVWeEQvVnB0QW5t?=
 =?utf-8?B?aElraXhMb1p3UkJRYTJwMlBlNDhsNlNvYU1ORFhXajZsbnNqdng3TWJDdlp5?=
 =?utf-8?B?ek0wNVpTV0piWGNQRzk2eWh1S0kvQkVGdmllZmZuT3JFUmtURCt2d0RzQ1NX?=
 =?utf-8?B?NEo3TXBZTldYZUxMbEFUcTRHOGU5NDlMLzgweHFkWTZTR0F3cUVha1h5Q0Vt?=
 =?utf-8?B?VnRMelV4RE45RTB5akFHSUwwcEpFSTEyd2VhK1dlNFdnUzA4VnYzbEFwa2xk?=
 =?utf-8?B?OWwwS0dhZG1uZW5kbmdRNW8reEFZQ0lDdTRuOXQ3alNLOG54WGkvQ01Wc2RL?=
 =?utf-8?B?clZBM2kxVlFEUkR0MjRXZkNLSi9BcEZTbTZ1VnhtcnY5VFc3ZFRwOEFQNVhS?=
 =?utf-8?B?WDNuQUYvZVFvcVVteXhybERGWEZWZEJLSWRyc0pQSVBkWG5yS3lGQWdSaHNU?=
 =?utf-8?B?Sk5zd2NHSWp2QUVYai9pSk9CMnVuQnRBRlg0OFNXbWswWENDcHE5em4wWGFs?=
 =?utf-8?B?WmgzYit3dVJQeHBIcjBQemN6ZjJyRVZ6ZkZnM1BtZTAvU2ZBODR0NHRVckhn?=
 =?utf-8?B?TDZNMVc2Y0FTUjNzZGk2S2p5ck55NjRzeWtuaWxkaWZ3ME9zeGFPSEwxU3kx?=
 =?utf-8?B?TVlUOExpTDdKMXE5bzg2SUZkUkZUb25RWmw5VDJMYy9PREtMUnAvSVkzSDI4?=
 =?utf-8?B?SS9hSTBZaitOTlZTTTZBZ3I4WXg5MVltSnRXNEUweHBJZkhQYk1zVzVtUVRr?=
 =?utf-8?B?ZHd6SkJVTUZ2bU81OFlYTDZUeDVXUkRJbnhPV3E4MHkwVlFFc0poaUdzdGJi?=
 =?utf-8?B?YlVvQ1FQWXliWjkyVE5DUVJGMDZWTDRXK0JCVTdQK0llUTllZ1d2VWtaQ0l3?=
 =?utf-8?B?OUJ3R2xlYVlBQjd2bEFRalV1c21RVWdqNWVWRjN3REFUNGFuMUxjQS9QR01W?=
 =?utf-8?B?b0c5bTNxYXh1L1dEbnhLUUh6UXgrT01mOWRkUTRZUzZrUlBuYWNSMXJ3VitX?=
 =?utf-8?B?bDFRUGltRDc2SENBNFpmakRKcFBQb1NxYWtJRllETnFtNUtWcmF6UU96MytE?=
 =?utf-8?B?aFpoZHQzWWcvMmR6aHVvbnF0bDI4U09pd0kyKzN6ckdLWTZ6NndqOTV6Z292?=
 =?utf-8?B?VTFXZzgvdWRQTldnM0VzVlpSLzltRTBlS1Z5WGgrNWFDUlo2RDRPbnBjY0RM?=
 =?utf-8?B?U3c0K1V4UzZVVjFRSHk4aEJ4YlRTbXlZeWdYRngxYzlyOHRzUGZnS1FUcGRI?=
 =?utf-8?B?NjVsdHZtNHBqYkdJdHU1cTVHdENFVzZIK2IzMmVZZG5MZXFySjFlRkVqMmsv?=
 =?utf-8?B?K1k1V3BXeHQ3TEJ0aGNRTTdWRVVwV1JnYjZLZXRyM1ROenJxR3pncnhtTHJl?=
 =?utf-8?B?L3hvQ0pVNzYybnFSQjdYRm5qbGcrem5EZk5YZ1FLanRwTTMwQmVEY3lRRjJn?=
 =?utf-8?B?S3ZmWXdIeXgvM3E2ZzBZdmJkUXdCbEJ4K3I4d2xRY1FxMm4rbVpCVEUvcDRl?=
 =?utf-8?B?NGhGRnRndnc0OUEzYVgydlBtTUxIZHBtdE5udFQ4aHlsb0lVdTVvUmRHQWtX?=
 =?utf-8?B?RHBrOTlWWHZ6cmhuemFwVkh1R0QyUTRPOGF4OUEzRlgza1VEeHMzYldqM3ho?=
 =?utf-8?B?akxnb3E0WTJtQVV6Y28yV3V3a0VJWlczZFQxNGpzOVNkZlpPUk9CZ3lLemg0?=
 =?utf-8?B?MXZ4MmVMRFpXZlZDU1UySExldGJzSkphK3FTOGl3eElWSk9oelJWaFN1dUhG?=
 =?utf-8?B?eVZLM0NhMWs2VmlqeTZnVXFzbmwrR0RzN2Z6cXBGeUNjZm1WbWdsUjdRZ1Fr?=
 =?utf-8?B?NHRlajVUY3hENXo3Um1jZWkyZm5xOWF2SGVVNzAyM3llQjBzcm9ubUhtVWZh?=
 =?utf-8?Q?4kNg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRWTHFWZXF3c0hvNk1sTFBkb1hZMnUrRUhVdk1xK0hjWHAzQW16ai9pdTA0?=
 =?utf-8?B?MlJjKy9nbmFIQUxBTFNUc3VwOFgxT3VEaE5nbFRYVzl4UVgrUlhXeit2VktF?=
 =?utf-8?B?NVB0MnE4QTI2RXhsa1l2Mi9IcEhtRW1wZXE5ZjNqVWhmSU4yTXlrOTJlMkdt?=
 =?utf-8?B?U3NtOFV5R09tY2ZwRW02WmJUbUlyemZ6ZGFaZk9vTXRHM1crRW5SLzFBQ3VZ?=
 =?utf-8?B?dTlTMmZBZ2o4NlM2ektwUWErQXhKVHZRb01sSW1PMENNZVVHRlVBdndoMU5a?=
 =?utf-8?B?NXArZlhRWGZoSmhvUjU1NlJQS1RObWdsOHhNcXJxZDg3ZXdFQ2JyQ2RWTDVM?=
 =?utf-8?B?Vld0WkUrMVZ1TFdXWG5aN2dOVWx5cVZsQndjWE5CNGl3SmxYTmx2TklyQnNm?=
 =?utf-8?B?Q1RxRklyMVJCamw5bCtkbHZVMCs0YU8xa0RaOFRFSXhPZXljbWRybHJHeDd2?=
 =?utf-8?B?NWVRUlZCQkZNOU53dlJkT1FLVURPeXVwdVgvb3pnMElIdndOY3pCZzVZZzJq?=
 =?utf-8?B?aktWbXRoQkpEeWI2UzlmK0FsTFkvQjFUYUpVbXhwbDdyakV2WnBKeW5FV0dE?=
 =?utf-8?B?anpQOStJb3NUcWc4dDJQMHFBM3Z0VjRsYVJTN0ExVjVxQzhNUndhY3lyU0Vl?=
 =?utf-8?B?R1BtS3pRRndzT0lnWU10RlNJdVltdUFWMFNzcUJOaG9uSTNkZkxHaWFpbUdS?=
 =?utf-8?B?RXRxVlZHSlpmMXhoc0NMc1RhblRJaTFQMFBYd29HYzZ1SlRkRkExdTM4ZlJp?=
 =?utf-8?B?cDE5LzBldTNzVzE1eERVZ2pwL1RYNUUwb1NtTzhXU2w5Q2dla1RhTFJ3R3NY?=
 =?utf-8?B?bDdnbXlWSVlEQXZ6T1hNSVBJNDFUUzA2bzJWbjVTTlNuSlMzMnQ3RmQ1ZFVF?=
 =?utf-8?B?R2tkNWRLOWRPSXlXaXB2bFJBY2dsUVM3dTdEQjF1RjJ2cFVFNFZLSlpDNmdS?=
 =?utf-8?B?UFpPMWxrbWtrNEIrRVhCRFhxM3N3eVExb2dNcDhSdEhMM1BmT3RPTkVFUjNW?=
 =?utf-8?B?UkxDeExyZHVsK3EwYWJxanFVaFFCQ2kvYlBCTnJqSkJBSGFFWDFjMHpCdFJX?=
 =?utf-8?B?K0o2MDBvTFQzYzYrdFhxT1pFRC9QbUlUUCtiYmQ3NUlJSWNlMlQrQVpRR1JT?=
 =?utf-8?B?R21iRUdaYW80dHBxS0xJa0ZGdFpqeTNWWFl4Vy8zdlNPRGRaS1hsa1U5T3pG?=
 =?utf-8?B?Z1lYeStKa0pGdkZ3Y1NCaWpZQVN0WThSNFVoRktka045dlloaEI4SHRoUGZx?=
 =?utf-8?B?eFRMS1VMRmRjQk1yTGViWHN6c0tlWVg4ckZoOEs0aS90SGtuaWkvdkZ3RFBm?=
 =?utf-8?B?QWhEWXhUbE9SaWRnVmN5QVREdGtCTy9aM0tJY3RPeXBQTVlEeTNQcmdBTHBL?=
 =?utf-8?B?MHVzQXh5NW44cGhMOHhwZkxXeVc3bjJadHppWHQxT0h1N2FPRUc3ajFkeDBx?=
 =?utf-8?B?SnR6VDJDTmhRcFRLUVgxanVhWm42QTNPUHZyOW1RanlDNXN4ZTJucVZ1TGF0?=
 =?utf-8?B?dk11VVJlWlJ5L3hOVFlpQTdoOWk5Ymd4QWZEbHQ0OWJpT0pRZ1owMmRvbUtl?=
 =?utf-8?B?end5SDZEdXBVdjBURTU2dE9HTkZYRkIzU2pPN3dsc2l4aGZWNkpVOUlUU2ti?=
 =?utf-8?B?QnpsUEN1VEk0Sk9yUDgyTUdCMWZyLzg0TXdjYzJheVZYay9YeG5Jc2JkYkJU?=
 =?utf-8?B?bGlyTVljSnp2U2owV2JnY1dKRXo2ejJMMGdVYjZpME9CQzc0UnRmcFpSMjEx?=
 =?utf-8?B?TTVCS1dFYm1GVmMyQ3dNeUNub3lwdVRuM2FLdEh1Z0s0WmMwTFhWKzJaRlkv?=
 =?utf-8?B?dFZqb3k0MVBjRTQzNXdOSTduZXptb3VSZVFQR2paSU1DTzNvbnB3R2VUYXFo?=
 =?utf-8?B?L09sR0xtWDRGY3hTYmNJOFdxT1lxTC9sVlZkUGprSmZxcEZEOWwrZUJHT1pE?=
 =?utf-8?B?VVBrTnBVV1BiS21GRzBVTnF0SW8wRTh6VWsxWkgrZWY1c2pPdVV5R08zQWZa?=
 =?utf-8?B?dFJxcFcvUVZtREpHYnVyTTdPb0Z4eTlvcHQxL2htZXhXbmpyMkx5VkpLckNY?=
 =?utf-8?B?Mkp3QnMxR1pQVTFKcEdKU0NyMjVXQkhUbnl1dk14THFRY0g1RDJBeEx5dXE1?=
 =?utf-8?B?dWYvRUczL2M5Qm1IN0djY2VOT3B2NmVBb21GU2VFeGZVNmtCKzVieForT0tQ?=
 =?utf-8?B?eTc0anJtbW5CakNmVXB5cTVzMGlKK1NjdDZ1bVFtbFdzUDAycVpadzAvSVls?=
 =?utf-8?B?NkFCeEUyV1QzSGFJNS9aZnR3MS9oUkdRaFVlbmovYjFtV0dwcnFpd0FKTUtT?=
 =?utf-8?B?SC82eXRhRzBJRmcxQ1o0ekFZL2Z0L0l3a3BvWmcyVUhjeElrZTFaTjA4UDA0?=
 =?utf-8?Q?PbWnWtHCghrruqSk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62069fd2-138b-48b9-62ad-08de67dbc6aa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:04:36.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCq5b4tRlSYeIh4K8PzpqfTKByCD4UKEbSe5/JI5EBpTY4Za4ElxWjyr0clmkJA9IsSRayANFWBBUxglKR05yxveLIRfAHEiI2nsP5QGUkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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

Hi Mohammed,

On Tue Feb 3, 2026 at 4:45 AM CET, Mohammed Bilal wrote:
> Introduce a unified connector_test() helper macro that iterates over all
> matching connected ports and executes tests accordingly, ensuring clean
> skipping when no matching connector is present and avoiding unintended
> fixture execution.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>


--=20
Best regards,
Sebastian


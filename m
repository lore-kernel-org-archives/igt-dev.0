Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DCDD64062
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 06:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715CC10E197;
	Wed, 17 Dec 2025 06:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjCTxyUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3F10E16B;
 Wed, 17 Dec 2025 06:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765953215; x=1797489215;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:references:in-reply-to:mime-version;
 bh=MLJhd3qyV5+4orXhNGZctEuzf2q8jisEVyMNZFSHMN8=;
 b=UjCTxyUYelqx4IiAvFQ2Ij5BD79zHqM3Ma4X2G96UVqA/lvgQxKZJZIA
 Rv8EKBJQs1QQZBfX6ac/M3uHwHttTU0ypblbDt2pBxxEc7QwipR/u3xMw
 oJl+QNHKHXo+zEv8wOfmCk2FKrCIeQ2nutr4oWlW1NHjtrfzKH2SEQgY2
 /HlWNDSs5niECs6UKwl10g80W2H8jClrTfMOANXn9lfFmQiuzwZDDew2/
 AFJKQWidCGI6zCzgIhO41B1j06zYJrzneAtW0bVOrZqgprEYcOwnxKsAO
 Px5JDL6/eibUdiWG+YOj3J8NwgYjMfoTjloadlNOKcrIXSJQT6Pwxamvy Q==;
X-CSE-ConnectionGUID: nt0lbayGSDaULB8R3O7jPA==
X-CSE-MsgGUID: 0jkFI8kyTCaGD91HX2RTAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67635278"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="67635278"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:33:30 -0800
X-CSE-ConnectionGUID: f7nm/DQ+QM+q9wJBp6kcpg==
X-CSE-MsgGUID: NwfHaj4KQb+kJ26PSAWxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198721544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:33:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:33:29 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 22:33:29 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:33:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3WoUM6hdAQBVqS8yntNpSarCexq2aKwY+mfvLWmqndRVwnMp1D86b/gJHzFkKO4WVwF6huyNlyoDODxAnJjdFqwTeoqjpwg8ksxQkPI8tgR2cKLPwWXia2DVYX8OO38diFZ+EWsQjvvTnwjxC6AKv9OgPtpungyHdB7NohhBIC+pjtRXgXrlyqnPhr8YOTy038zuPI/DTsR5JMiRO/8rB/jLsomonCMzwMoURf9C+rTsCWP0Bvi1oLH5AB8GB2UCWa5ck9W/sJRFLmrnBm3l+bAattu9105aDx5tLfe3zQ5kFddfeK+IYMmgtqZedjsM7QbCwI87hnDTqdmGumvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAGkrH8EOt84c7yrwGORFU66vwFOUIomPpmUe8sTBDY=;
 b=K/VsRFCHkblO8Vv0rtjgLYp3PDLmIrdV4Z6mZSiVuOVNlZeMNqZUqe9QZOkHeRPLtn8KIFruOYluLZZKNiEAYrzpnaaMs8aW/BSfc/vP91bmfkXX2V6GCwS78up16N0qzL9iqL/Bfk+kN7WQoF79wADcss5wSLDrC7PUlVtHa5njaRXgnAE0uzIbObdgwFpqe2FUGjcvDZzzaXYp94nghdvLI/mDEq7j2fU3myvSDie44WqD1BGRbxRDsY9FaZ9yvDstWih+lUZ8f16W/LJLpfePxkPuyl+zCWpoyhaDyZfpmXnDSmlw/tTJ6Mr7wSgqc3MCQ3j09GMSZf4K4QtL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SN7PR11MB7115.namprd11.prod.outlook.com (2603:10b6:806:29a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 06:33:26 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9412.005; Wed, 17 Dec 2025
 06:33:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Dec 2025 07:33:32 +0100
Message-ID: <DF0A625OYMPE.R96VEDAV0KCI@intel.com>
Subject: =?utf-8?q?Re:_=E2=9C=97_i915.CI.BAT:_failure_for_tools/intel=5Fgpu=5Ftop:?=
 =?utf-8?q?_prevent_losing_original_pointer_on_realloc_failure?=
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <I915-ci-infra@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
 <176583629876.91286.13557144638544501813@a3b018990fe9>
In-Reply-To: <176583629876.91286.13557144638544501813@a3b018990fe9>
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SN7PR11MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 900b5005-c468-4807-2496-08de3d362f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUlWRVQwTnFNcmRUQmZVUXhkUUkxREhNTTdPOU15bFFsc21aRytLbHkwdUJa?=
 =?utf-8?B?bnc2WTNTWkJVR1h3UWxZNGFFS205WnNIUWFUQ0VJUE9uM1JsNmFDcCsvZjlR?=
 =?utf-8?B?dXAzRktueXVMWFBRZy80ZHE3ZWY5di9xZHU3dnZEVVZVSmRFUHRvTG1aK1lW?=
 =?utf-8?B?MkhzUzhCWkV5RC9vcEVUTDRFOTRuS242cVdTaytoRDN5eWFFSnZUTTY2MDRr?=
 =?utf-8?B?eUVHaVdkM080ZTNHak9Gdm44MkwyYXJmWndETmJUTDNhc3dYTzVWRk9VNWZ2?=
 =?utf-8?B?ZDI2d0QvR2xWMklrNjFJZjlkMEZrV05yR0wvZGVNOFhSdFNPa0hWR3dqaWVu?=
 =?utf-8?B?NGYzMGdVMnpMOXB0UnFoODZYUnFJckFUbnpsMkhhMmU0dnp6Wnh4b2Zqa0N6?=
 =?utf-8?B?cW5VMEJFeGlhWEJWNXFGYll1UFVSYW55MWxPai83SVlSRVJJZ2NKd0RqNlVw?=
 =?utf-8?B?QzdvMlczb0VUVFpOSGRpQ0NKWTFyNmw5ODEyaUQ5SUcyeEhlUjQrY1JEU2Vo?=
 =?utf-8?B?Z0V6SDYvT0tFUVNwWStDMitlcXNIOU5pQ2czTkhDUUtpKzhWZkh2Uk4xSnlh?=
 =?utf-8?B?blZvQzk3Vkc2Q0h3MEFObHZGVkFJYUVZZXFCQUsxWnpkRVNmMS9YdmR1V056?=
 =?utf-8?B?QTg1VWk3d2xEZ0JOL0xhUW8rUmQzbzlhYXlpN1huUWFGcWFLS0JKMU5LTHZZ?=
 =?utf-8?B?TXRSY3hhbzNJdzdoSEZIM0NQWThlME9mZ2FIb2wwQ1l2QVhNVHdTb09mdW1I?=
 =?utf-8?B?ZDlhaEd3VGc1ZHN1Zm00WnhxTWNQblc4K05tb3N3NmovQ0pjM0ppWmdBb1Rs?=
 =?utf-8?B?My9VRW9YUzBXQWh3ekpMT3oyaWYvaWtya1pIOXFLRUo5bStheW1URngrM0Fq?=
 =?utf-8?B?RE9QNWoxY0kxS28rNlB1YjRETnNKZ0dRc1c3R0dVU3lwUG1KSGtqVjZIdW1S?=
 =?utf-8?B?WFdOcjNtUG4vNmJJaXVnMzZQYlMzQUxHYk5ENVY0cThJaFV0bzQxYWd5QmNF?=
 =?utf-8?B?T0VnV2dHa1dTb1RTQVpiSnZha3VSWjU2ZDl6em0reE5aOWhTdG1zQWN0cTYw?=
 =?utf-8?B?V0IxbnRpR3JPQVJtMUpPMmZoM2U3cS9IMEhXT0J3YUpZR0FiZkhUWXJaY1Zx?=
 =?utf-8?B?RXpvZ281bTlPMVRiYVdhTXYycTZCaGlnR3A1UUgrM1JXMGw1KzhzS2lyV2lG?=
 =?utf-8?B?TjkwSFFNdEsvTm16dG5KRFNYWFhxYVZ5MEsvbmU1WldkQUszUE9JSnd6UzRJ?=
 =?utf-8?B?YXU1aGZsRHVEeDg1bDVhN3JzOEF4cmxTZHNkbEhxeDFnZmN5NmQ1YmlGbzF5?=
 =?utf-8?B?TWhUS2k4aEIwbGVFeEhiRnNrYjArQjlLU2FOUzFwaVNIbHJINFVWTHU1ZjhG?=
 =?utf-8?B?SGJRVmp6aWVrQ0ZUZEFFejNXcWpvd0lNMTBFYWVyMzVYT0E3U3lYbnVPVjhE?=
 =?utf-8?B?aERMZVZlc0JtTTVpOERyaFJwRWZIeWE1QUdxU3NDckFodHpma0RLRHptdHJz?=
 =?utf-8?B?SXUwTWRreWZXSTNReEVlL3JldXFPdU9NOGx5OEsza04vakhLWXNFRzN3a3Uz?=
 =?utf-8?B?dExsUkVjcnJtOURQR21mWTZMMlNRVWt3VmFFTnRFTmQzcHlHaU1WOFhBVTBX?=
 =?utf-8?B?Vnl1Z1gzWjduTFFsR3pwWlppbHRuMnNpZXVxQURkWHROQkdzRnpTU09lemx3?=
 =?utf-8?B?QmVrMnNrT24xSmk2Rm92dXFNU3ZkVGRxQit6M0RxNlBlKzZrUFlSS1lmaENt?=
 =?utf-8?B?TFZsTE01UXlMTkRDTUZza0NXeDNPeXNVYXc4NnRIbjVOUmhHeWs2ZXVJdjlk?=
 =?utf-8?B?TFFraHBUS25VZjJ6cysxZ25xdysxSW8rcnB3ZjAyMGVOWFlHYmZaeDZkWUhH?=
 =?utf-8?B?ZmpSRk40ZGFUTTVNeERwWlh1bWF6OGNWWnRoRmkxSm9mRWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGp5STIycVFONUdBMnh2RmRGWm9FMFZFdEYzV2xkWWhMc3hGZnBXNTRUS0Vt?=
 =?utf-8?B?QlNtRi9QcHp2UmJNSklCUzlSd2w0bFJ4U1JabDh0QUhBaWJSZW1US2kycXZ1?=
 =?utf-8?B?ZXhIdjlLeXkzTVdJRjhDTmdkTkE1cGQ1aEIxakY0bGZyS2Q3S3dUc3dPcTU3?=
 =?utf-8?B?TmNlMitFR2RlK1M1Zzh6NlZ6WUlGZVIrZStUV1JTNWhBZnRPcExuM3hMZVlv?=
 =?utf-8?B?dm0vYkpEd2dLck11UFF4UlR4Sk1EM2VzeVllcThXY3hLeXNPMExLUktKSVFu?=
 =?utf-8?B?YTkwRWtHMTJkcFNVRHE1cGZpZExSMjNBOHhEbHFjTVlEMk1VUVplODlTWWc3?=
 =?utf-8?B?V1FnVUFTTzlvRGR3c1BNMkFHVEtSV01mdG9BOGZqa2R4QXV5RjJmRE0zUEZx?=
 =?utf-8?B?dUIrdnJNY2V5SXRnZVJMclYxcnZSTzQ0bkc3MkxvNmJ3WTIxa0RHbXhFUXNl?=
 =?utf-8?B?UWJUL3lCelJtaFlhRUN0YmlaaHhSaWNxUW0zZGVlQVRseUFSNmZ4bDhKaVQ4?=
 =?utf-8?B?dEVxak5zV0c4cksza2dXeWtUVHZkT1ZBb3hhemRXQzlaVWw2QS9vMUc2RnRu?=
 =?utf-8?B?STJVaExvMGlmejAvK054V3pSQWVTdGRsc1JWaFhpVW0rUUlCRDkxV253b3hx?=
 =?utf-8?B?QnI0b3JuRVZxNVpjZklWeGlKemJLWVlleG5ldVViclBicGlzbTREa2lCWXdR?=
 =?utf-8?B?V0pVbUN3SU9vcVB2eWVIVi9uNjRWU3ZqVFhPNEptTmlqMENoQS9HMGxOV3pW?=
 =?utf-8?B?MmwyQ296d05KTnYxWk1zeTNvYWVUQUsrK2dxRUw0Y2lIazUyUC8zL2RheHBI?=
 =?utf-8?B?MUlnQ1dMdk1ndEVjcGdNLzhlYTExY0FTdDlkd2N5R0NWaFVBRWZjdFlQeDF6?=
 =?utf-8?B?Y05raVErdGV5WjBKNlAxaXlML1Yvam43MlV2eFYvU0pvRzhDNkt0L0NuTTV0?=
 =?utf-8?B?UFFaOUxYb0k0SU1KYTRYdXBzMGN6Qkxwd2ZHak5wdmIrVzgydnZUL2RyRFFR?=
 =?utf-8?B?OFdiOFJJaFRHM2xVTkdCK2hNOGl1NlRTNTZLWHJPMVBaZXNKa0paTWtueUpw?=
 =?utf-8?B?c25HWVFFOHZoSjI4WmpKRW1ZaDRsZ1oxaEt0b1B0M293MGVMempCeW9OUmRT?=
 =?utf-8?B?bEQ1NkJEa0FEYzFwL1lCSmZuUVFONGlsWVdRUTJlb1U5bGNxNGFEUTBIVDFS?=
 =?utf-8?B?ZkQ5UUpsdGhtaEdhRnNZR0p1ZHZXTG1XUm55UVAvTDNNa0lrc1FMTTAyU3Qx?=
 =?utf-8?B?VERpN05sK3g2MEFBSmszZDgwamJDN05Sa2VSem5uYlExWFF4UnAyUDE5eFdG?=
 =?utf-8?B?Q01NSy9QamFRM0RQOG85WVlGZUdmbk5mMDJoUjM0cFYxalRBOWZudllHanZY?=
 =?utf-8?B?bXlpVlpJRXFNYUdCU1VvaHhYVHc1dFJ6aGtZM3M0VG9FNVlLTWNrM01tMWVk?=
 =?utf-8?B?a2UvRCt0azdHeDVyTzFUVXpjb0pCVWZUYkdkcnBFVkVqWWkySFI5KzEzYUh3?=
 =?utf-8?B?VE1VblJmcWJSV253aWlQZmphYzZpaWl1REJVbHoraVR5cHl4N0hLYWZyMG1i?=
 =?utf-8?B?TjR6YXJHQ05aR1NwUndQb1A4aE9pMXU5bHVZYlBXRlA0V2JOdkJRVXZBYUU3?=
 =?utf-8?B?ak1Oalp3T0JaQUFlTW9VT2dEVDNNTlNPdjlpOU5pMWhKSXJ0M3Vxa0hLZ0JP?=
 =?utf-8?B?a015bEpxK2NEOXRIRzhKOTZFZnZyNHI0WVdJQXV2N2hYTjdUb2haSUxnYWJ2?=
 =?utf-8?B?TEJTT0V3aWVnNEc4NXFxUURJOXVTTjdUV29VVGlSZm1YZm9pcWtuQW1EaUsv?=
 =?utf-8?B?bC8rcnVLZFBmUFYvQ0Q1UHF1eTRtbWFhdkdaM0ZWWkM2UkJFWTlmcHlFSXJ1?=
 =?utf-8?B?cDhhU296dzh0TVovcmd6WllwMjFqQXpBeDJSSXk0Rk9yVmN4S3JBakcxelNn?=
 =?utf-8?B?b3NxTFhxU21DZU1aYmVTMklNaVROeGpISmhQZDJpZGxZMkJIQlJqVWVoYUJD?=
 =?utf-8?B?Y1ZSeXZMWlFhenJydjV5SXBNSFNSbDNaNzEwRVhCOXFtTWhkVGtqNkhtR3A5?=
 =?utf-8?B?aXN3cHhOak1zRURHOGU1V1FUZTlKNzZQRlNYMGx0ZXB5bm52SFEyRXQ4TzdP?=
 =?utf-8?B?Ty9XZEw5dXUwYllrU2J1TFVSUHdUNHRPa2dYeUJMSzZOQVkyTGFlQVBIUjVL?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 900b5005-c468-4807-2496-08de3d362f70
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:33:26.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gglwowVNhBCvfmv40cqheNCtD1mwfd3BkZpuvztsTpCC6ghi1GDT295E9U40qTjFFuko/1TJqtqjCAzPu4PjIsv61JdJOmOYDM2IPoFWw0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
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

Hi CI team,

On Mon Dec 15, 2025 at 11:04 PM CET, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>
> Series: tools/intel_gpu_top: prevent losing original pointer on realloc f=
ailure
> URL   : https://patchwork.freedesktop.org/series/159023/
> State : failure
>
> =3D=3D Summary =3D=3D
>
> CI Bug Log - changes from IGT_8666 -> IGTPW_14211
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_14211 absolutely need to be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14211, please notify your bug team (I915-ci-infra@l=
ists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14211/inde=
x.html
>
> Participating hosts (43 -> 41)
> ------------------------------
>
>   Missing    (2): bat-dg2-13 fi-snb-2520m=20
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_142=
11:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@i915_selftest@live@objects:
>     - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8666/bat-arlh-3/igt@=
i915_selftest@live@objects.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14211/bat-arlh-3/i=
gt@i915_selftest@live@objects.html
>
These failures are unrelated to the patch changes.

Best regards,
Sebastian


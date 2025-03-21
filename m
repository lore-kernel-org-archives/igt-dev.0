Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6B7C36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 13:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5058610E7C3;
	Fri, 21 Mar 2025 13:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9NNQsqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9E810E7C3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742562139; x=1774098139;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XoRFvkvapgohjdjv6IngfQNypgJ+n50Hmzd5zk3M78M=;
 b=f9NNQsqHG2z9k+KIF5miex2q1lKMYAqpJMUhg2dC83NlpdGaLArpZY5O
 sYvbHQjJeIAeY4RR8bcRznQVODeg0AlI3K8xfmcFXdq9Q7SB6mLPOtV57
 Of5HDDV4qXmhjuR3MDaQwOYHI2WGNSvyK3G5BdlXsXaaR6M6dQFgp4JFk
 uzG9h1OZPAvmLmQby48LKKrka0GqX6xLShrx4h8dB/zUvwqE9Cafxf5w/
 4jN5C711IjdygGaY2ZBLyGKsPyDyVKUTkthmT1GW8ZV00pvkWm5czH/sf
 iizDwH869eapevs/EbVssn6MoyGtu7oxWt3wOZg5MjsS98X3PJPYbeMH/ w==;
X-CSE-ConnectionGUID: 6vVHsI0+TOi6Df73QNx7Ww==
X-CSE-MsgGUID: D6+00q2YTv6bqdSuhkVCPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66292716"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="66292716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 06:00:48 -0700
X-CSE-ConnectionGUID: xsN/JpkqREOPq+CR87lwng==
X-CSE-MsgGUID: CWxwvWc4QC6xgHAl99aauw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="154286200"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 06:00:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Mar 2025 06:00:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 06:00:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 06:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCMFJ0vkiTVVK6cjhCOAMwaRhKte1JaM53QRd34RUaHKDfXWUw5B/DlFfEtbkCFG8hjrEhoeOJclmqk/vsP1/W1DSZWd++wCFBmyL57Ulh3/EahqvBwh7Z1iOj1LNBfxm8OSftSgKrqU1Uq1odALKhQ0/QFe9TnV1Uf+QUWY5L87vepQnltGW55kbYDwgeOjs5WqrMQglYmYA4+BLRyMCYE2rd11t/CmY74JCqJD0exorX2jnLskeuz8RX3+LjhxYW0mAmHyHUHJW8breckBPTUkI/J7i712Iq1FxWJpHiaANRCvJyTAMZvxgAznKgAssT9H/sW/8roekfUwziYzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoRFvkvapgohjdjv6IngfQNypgJ+n50Hmzd5zk3M78M=;
 b=sJFULm6PbwMoOG61GVdTFiKq3lPAAvlN4HstfftvqiJjO6H7BVbsGX5Q4hVXnLBaVGwE7DueKiE7mivpWQ63YPJTWDZHTKiB5UbwDuB9jEUd1bBGQ0/v9pf6s8FTxR8ZZSe0WY86BBIurc/CZId0vQruHLUEkR05oGjr05+FC5p6nE2p7ywtgiMF28IHQC7URkPbP6J7z0r2eqveaF+FxmHE0JYDmvUOWh2H42w4ovzUIUIglUuTBZzPcsU26/pkNLtGPjvEUCJDnf762wePPhAQidbvzq0Ku1SK2LNgBLheZLQbrq+c0f7Q+6+5fa3mx7DpWB8BmDPYTrd8NEUPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB7150.namprd11.prod.outlook.com (2603:10b6:303:213::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Fri, 21 Mar 2025 13:00:15 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%7]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 13:00:15 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
CC: "Manna, Animesh" <animesh.manna@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v1] lib/igt_psr: Fix PSR active check for
 DisplayPort connectors
Thread-Topic: [PATCH i-g-t v1] lib/igt_psr: Fix PSR active check for
 DisplayPort connectors
Thread-Index: AQHbmeMFp4jkgFBnnEufJznZx0pMZ7N9jpiA
Date: Fri, 21 Mar 2025 13:00:14 +0000
Message-ID: <7a7f35b2c8f545bf4f89bc4f1c240e14e029a971.camel@intel.com>
References: <20250320215642.3175042-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250320215642.3175042-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB7150:EE_
x-ms-office365-filtering-correlation-id: f7f6ece2-0bf8-4311-be0c-08dd687852c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UVFxMzM4bUxnQjdubnNvMzBJRXhrbUhzMUlzN2RJK1VPWlJ0QW9pN1dyUEo4?=
 =?utf-8?B?UUYzZGxjN1ZnaGRqUTFsdkt3MjhzWEltVGp0UnMxMFR1TDBKcmttRzA0NjY5?=
 =?utf-8?B?QUtibWpwT2pYSHM2clBZY1FpaDg5MTZzV0duMjhOOUdkR1Y5V0VXWTE4TFhR?=
 =?utf-8?B?S1plY3c5Q2dVTjlMK1IzeWk2bURsRjdrKzFJc2pZVzhQL0RhazR5Sm1VOHRD?=
 =?utf-8?B?NmM0d0JOVE43MS9mWWlEODlXMGpTV3MvR01kMGRhT1FQNi9aM2g1anEzRTFX?=
 =?utf-8?B?Z2tJYTRaME5CbVFzZW9scWVkMEJjcUpmOGtrbDN6endvWHIwWVQ2K21lcjYx?=
 =?utf-8?B?Nlc1anlxUE9NdWI2d0ZsMUF2SnRudzMwTXNiYThod0lHRFR2SS8ra2RpVThY?=
 =?utf-8?B?QjFLT1Z6SUFUNkdVbTlDRTk5TThoODFzS1lySGtoRmhaMUY5TTBkYzdnSW02?=
 =?utf-8?B?ZG5GK1NNc0tKKzE3UTExbzNRbkJYbzNPRi91RTU4YTc3K2Fra2RUaEdYTWZl?=
 =?utf-8?B?Wm02RFJvYkFsSlU2emRsay95bzRXaHVoclJBM3RkZlRZVUE3ZFg3U1dCYUhr?=
 =?utf-8?B?RUZoUXUrUStFeEptRmdFUC9uMy9wOElISmFiNWlzZmJQTWlUV1Q1ZDBOTEhF?=
 =?utf-8?B?dHd5M2FKNjJiSzkxQTlGWC8waVN3NjRwOFR4SjFzdVk5bVg5blVPdDV1VEIz?=
 =?utf-8?B?QTI2KzBvU2p5K1V3Q0ZYQnI4ajZEbS9iNTZPcG5kV05MMklYOW1URkZtMExY?=
 =?utf-8?B?S1VBL2ZmVHNrR1dBRlJ5RFphaEpIdGpCcGtFYW5MSlRSVlBpdEFZVjdUU2sw?=
 =?utf-8?B?cm9hVlJWS0NtZDNuUHR5U1M5Sm4wQ0xaZ21QT2NYcnR2a3NSenhOcVN2Ukpo?=
 =?utf-8?B?ekJES1paU3FHK25iL3lVaFFwaUloWHpVTytjbWhjYXpkOEZNNEFoL3ZiRCtr?=
 =?utf-8?B?c3k1ZXVnNnhUU3hzaWFJa2FEM1Ntc3RhdDRLQlRKSHBSODgzTDlsUjZtTk1P?=
 =?utf-8?B?bXV0RGRaYnI0ZDFQUGRyK2ozNVZjVEFzSE5JUVBFSGpqSVRCakQveGJZZFNl?=
 =?utf-8?B?NWZRbG9NU3ZZdk9qYVNxWTdHbjJDc3VBR1dNYkJ5S044U0p6c1BiWkVqNTB2?=
 =?utf-8?B?WUVMdFZ3OTBiTzJiZm5BUFFHdVkwTUxGUnRFOFYwK3c1RW5aMXUyR2VNeHVP?=
 =?utf-8?B?c3BZcEFFV2J0U0pSeWVaZU1qVjBDVTVKUWgrS0hIL0FqbDJlbGZqNGszRGRi?=
 =?utf-8?B?QkNYK2hyQXIybEFhcHZjbEx1dlg0QTNOTzhERk85ckluMHRMMFlLT0E1WktX?=
 =?utf-8?B?Q1I4VGQ0UlFkZ2hMU1l5d1ZvMVhVamx6R215Tm5ad296YlJIU2JqdFdzQjhl?=
 =?utf-8?B?TC9YWUtpRzFsUDdVZ0hmZzJpZVNFZDVqV09leWwzcE1hT3RFTGNFL1pKaGdw?=
 =?utf-8?B?Snc5VjNXVDI5OUV1U0VLUkZrbzQ0M3NITWgwaURSOTJRWEhUWG1NajNKL0V0?=
 =?utf-8?B?SGRqNHlpLzZFeU51R09NaDVhZGVQb3U1WG03RnZkSGNPeENWd1FlT3VnZS9S?=
 =?utf-8?B?d1hReEp5L3l0c2R0L0ovVExZM3h4SjBvajNBL3FWSFlQSGhrbkJpb2FsV2RE?=
 =?utf-8?B?a1krbVVaSW9jbXNTVWEvbm9ZWko0NmdSTUo2Uk1PSUs4YS9ZQVNlZFBjVkpi?=
 =?utf-8?B?RHYzZkE0TEV3ZnNZQ0VCWDY1eEN0UnI0blMrYmNpWE5BYkc0OGxwWVhyOEUv?=
 =?utf-8?B?ZUFvZkhuWFY3ZFNnMzdxMTBxc0VRTXZrWmJOOUMrWnh3WE1XQXVWSnF5ZkRj?=
 =?utf-8?B?aDV4dlJtcHVHbUJ2dGo4N25KVkdQT0pSTms5dDcrblhNbitFRFVkWEJqYkVy?=
 =?utf-8?B?SFg1UkFBUVN1RFUrMFo0eUZ4UUdoQnZYTjNkRzFQaFBUT1pRMmhTRmlnRzQ0?=
 =?utf-8?Q?a630JzbJyBjxNmvzRFni0Sl3m0TcqRVp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVhXcFUyNFl2WTE5YlQya0lmUitmRFA4OFUzY1VYbU5VVWRDRzlVaEllbXRm?=
 =?utf-8?B?VTFGamJaUzdla05EcjFNSkh1bTFKSVozODhSM0tSMXA3MG55VnJZZHo5aGsv?=
 =?utf-8?B?d081U2dMRW1hYTkwWGJpY0Fiendxa2NFREFWa1dMc1QwY1QyWjhRTmd4QVI3?=
 =?utf-8?B?bVJtdnRWWllZU1hST0tYTFNiMXFEL0xCRFJSZFJsa0pGTy9GSlJNYjlVUG9y?=
 =?utf-8?B?U0Y3S0prUFZtbm10WHJXNFpxckFtL3JZT29CYURBY0RrNllXTEdpbEpadkxi?=
 =?utf-8?B?TmZOUnY2TmE3WDdmeU5WdC9TdFZpZmtOaFhtdHlBRFVvMkFkRG1RcDdRV0J2?=
 =?utf-8?B?dEE4Wm1KU1dCdmNJblg3MUZYMjNrYU1rN2lJUkJ0WW1FSktQamhSdE4yTE1S?=
 =?utf-8?B?ZUxSeDN0K1QyakpsSFVUK3BWdGxKS2dveWFaOE5nVEJ5N2Y5am1HcjBpR05R?=
 =?utf-8?B?Znk0WUNOa3FRUjBJQ0FQb3hValVXMW52anpoSDhkOGo5ejJvRzJkWnIzRVZP?=
 =?utf-8?B?ZllZK0tsNW9MQlB1Q3pyTDUzU0ZTN0lXWWVPUzRtRTVoOTNuRC9WbzN6dFBv?=
 =?utf-8?B?SmxLcFBrc3JKMTV3dkYremJHa1QzYUF0cXpOdVBPMytsZGJqTHpXRUdJTWpa?=
 =?utf-8?B?azloTlg2OVlkdE5CTGFURDNvWEVMeGhGWm1nQzhMYjlZTFNmV0IyVEJQZGw1?=
 =?utf-8?B?MlRhSTFFNytIMnVJdndVaVFlR28rbDBWczRlN2d2T0V2QkVsTXlZREQ2cGcy?=
 =?utf-8?B?MHQwNUZaNStDV2g4cVo3R0FTUEhXM1ErSWdYTGZZUDRqU21Cc1Z0Q3R3YS93?=
 =?utf-8?B?V05iQ3ZwbzhDTTVkY0Q2VDRVSVJqdTlPTlNQKytRQUhGQUxWbEhFeVh4SG5Y?=
 =?utf-8?B?RUFpNlRJTlRqb3FaL3lrTkdaM3FwQmM0RFMralUzTFFySXloNjBOVkRuNytO?=
 =?utf-8?B?Z2lvVFpMR2kzd0JFNUo3M1RMYzVYZjAyL0RKL3l4UFErNEZDdUJ6YkZoTEND?=
 =?utf-8?B?elA3TitaeFNkMDRaclhaYXJrbVNkRmtCYVNoMTVFMkR4Ym9TVXQzU0lBU0VO?=
 =?utf-8?B?dm90YitNS3hRVmhSckIvWmxLYzF0TzF6NFo4eko3SURQLzlFdms5VkJxVzRV?=
 =?utf-8?B?YjE2RjZuWkFmVGJod05FSFcyOEVEeHFKM3FMcVRRb2poMW5qNVlmWnZKLzdV?=
 =?utf-8?B?UFF4R29rSG9yZy9Sd2NNd1QvdVFpWWNFQm1HVHFxZ1FvMk82V1RwY2xwTW9u?=
 =?utf-8?B?V1NCYW5ZVHFQZWkvY252dkRHMEZ4UXpGdTFRWkJFbmZSTGhIQTRWc0NmSXly?=
 =?utf-8?B?eC9NNmM5L0xrd3pRTVBPYTFaQXE4TTQrd2dXeFhTRWJVTTdLeHRJQ0F4RDlN?=
 =?utf-8?B?c2J5ZGltem80cFJoOW9rc0NhQndBZ1FhcWRDWlZRd2libVV2OHV2QTJSRVkx?=
 =?utf-8?B?RmI5cmNzbGhpNVpyclJDVUgvWjF4WTQ4QStkV0dPTFpFcHd1NDFHZmtKN2Mw?=
 =?utf-8?B?eDFkdGtLOUI1WUwxMlRiUTVvNHRIVkYzZXdYUFFGYkdOdmUzaENDR1luNVF3?=
 =?utf-8?B?dFNCQVVDbTY2MmlHOVlLVm5yWUtQZ3E0OThPOG04Y0lWbUxVVVRPOVJJZUxM?=
 =?utf-8?B?K1kwckhyTVhoNzQxaE9qUm03UVh5aGFTaEtGeE8rdjNKblRzcVlldGRuQ1dJ?=
 =?utf-8?B?Y0toK3p2ZndOb2FZV2hCd21IY094UTllM3QyUXErZFAyNnU0S09jVzlyc0E0?=
 =?utf-8?B?S2FvZmk3dmErQVNwRGdveXVVbjA3aWdPUG5KeGdLbmRrMWdTckwrRk8reWtQ?=
 =?utf-8?B?K2Q3bWFxZFhlNDJ3RlRhR1ZJQzM3dFV0WWlwcGMyWldma1RRTXVKVTE1Tlg5?=
 =?utf-8?B?Y0hlODM5MUwwMnRnY1YwZCtxOHBUNEN4eEIydmJqUFU5WDZrSmp3UGJ1aHBQ?=
 =?utf-8?B?eU42THg4aTRnRFBTUkpxTzB4YzZmcUNVbGFBeVdhMDJ0L3ZJRkk0WlkzOFRq?=
 =?utf-8?B?aDFUajJnRzV3UEJYbWxEVHZrNXpHdVUrVUF3WEt6eENxSmhHSVBDR0lJYzVS?=
 =?utf-8?B?QTVOVWROQUhjZEpnYUdxQUpEK2V2V3U0Tm5qbWc0ZGNMS3Q1aWFhb24rL3JO?=
 =?utf-8?B?bjVQY1Jmc3pmeitJV25DSE53QnpmYm5ZT3AxNGwwNlFKbzF6RXp0U2E1NWla?=
 =?utf-8?B?OE9nbjE1ZWxjUFJRT2FPZHh2Z0loSmlVWmRUb0V6MWdXYkxJd2VCMWhDdlBF?=
 =?utf-8?B?WlY1MjhJQWxXRkdsNXBOSm5FM3VBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F7DD6DE60C6C048BE58B541D9D67610@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f6ece2-0bf8-4311-be0c-08dd687852c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 13:00:14.9953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYrii2ubcspeew4OjcDUwa3rlnS3768xafn99c+DxJNmo5Rj6vKa+XRw5hBaxC+XNYIoHVYdKLXZ+3Kd9zqEpkuWHTmr3rUK6O3Z41ncvts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7150
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

T24gRnJpLCAyMDI1LTAzLTIxIGF0IDAzOjI2ICswNTMwLCBOYWxhZGFsYSBSYW1hbmFpZHUgd3Jv
dGU6DQo+IFVwZGF0ZSBQU1IgYWN0aXZlIGNoZWNrIGxvZ2ljIHRvIGNvcnJlY3RseSBpZGVudGlm
eSBhY3RpdmUNCj4gc3RhdGUgZm9yIFBhbmVsIFJlcGxheSBvbiBEaXNwbGF5UG9ydCBjb25uZWN0
b3JzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxyYW1hbmFpZHUu
bmFsYWRhbGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGxpYi9pZ3RfcHNyLmMgfCA0ICsrKy0N
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMNCj4gaW5kZXggODNj
MjFlNmJhLi5lN2I2MzAwOTYgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4gKysrIGIv
bGliL2lndF9wc3IuYw0KPiBAQCAtMTIyLDcgKzEyMiw5IEBAIHN0YXRpYyBib29sIHBzcl9hY3Rp
dmVfY2hlY2soaW50IGRlYnVnZnNfZmQsIGVudW0NCj4gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1
dF90ICpvDQo+IMKgDQo+IMKgCWlndF9za2lwX29uKHN0cnN0cihidWYsICJQU1Igc2luayBub3Qg
cmVsaWFibGU6IHllcyIpKTsNCj4gwqANCj4gLQlhY3RpdmUgPSBzdHJzdHIoYnVmLCBzdGF0ZSk7
DQo+ICsJYWN0aXZlID0gc3Ryc3RyKGJ1Ziwgc3RhdGUpIHx8DQo+ICsJCSAoKGMtPmNvbm5lY3Rv
cl90eXBlID09DQo+IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCkgJiYNCj4gKwkJwqAg
c3Ryc3RyKGJ1ZiwgIlNVX1NUQU5EQlkiKSk7DQo+IMKgDQo+IMKgCWlmIChhY3RpdmUgJiYgb3V0
cHV0ICYmIHNpbmtfc3RhdHVzX2NoZWNrcygpKSB7DQo+IMKgCQlhY3RpdmUgPSBwc3JfYWN0aXZl
X3NpbmtfY2hlY2soZGVidWdmc19mZCwgb3V0cHV0KTsNCg0K

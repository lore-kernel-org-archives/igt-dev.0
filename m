Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BECCFD65A
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 15:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E9510E1A9;
	Wed,  7 Jan 2026 15:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKNikdQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C54410E626
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767801342; x=1799337342;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=SoZ7shRYjefOFbkce5V43PtLPudLiQk2W1pR0BHitjs=;
 b=mKNikdQF9mS9grfC8M/WhEHmzv6CeFNTdmcMrJiM2I+4bNJTF0aUkZTk
 s9MXc35s+gwSTGSy3SUpJURtla+eesa1tJHQKCIVgInsSRKZGdQz7Cj0A
 zW/dRUetox2ELAsntVmBngaXH7yRRI9Ie0HcFaMz8dTtHv3nd1YlgZjbI
 0cCxqkfbaoknGU1AVg9F/HmjII9/b0NPIWzI9JGQ2rQD4Szu0v33wJ1+o
 frkmJsLIz09vt4uTaa9TCkMh+YIED9/6BBptu/DkVrD0Tciws4zrlEWTi
 MZ2elaqEcr8NFdHCNpjTBjQWLzjZ+P8r6wubN+xtY2m6cb6U/kSEN4bRW g==;
X-CSE-ConnectionGUID: hkgt1iz9TpGxAsh8uJ1R7g==
X-CSE-MsgGUID: 0p77bMNmS6aVE/x9+Q4n1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="91832369"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="91832369"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:55:41 -0800
X-CSE-ConnectionGUID: ppmukgMXSxiCzUEc78L1bQ==
X-CSE-MsgGUID: u8k1o4X1RD+KVBU8Y9HybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="208023422"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:55:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 07:55:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 07:55:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 07:55:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roFqntAKgFM9Raw75kBxPnuWXhi2V+LGDBmtHR7NZBBGiPG3EMxy4rQMylHXfNh7giDJztBV/Xf4iuzZw1e2sTl0VgAnvBG1+iC9bo8ze0Rw9KQOmin3n5LQUjsx3gSnNlPloUME9YqU/VsFrYXJZrKkMnA87LGv6FkrnJfDYN4mDyy4fg2sEUWXDEb9dp/K65vCjRhnHJp6jPW4bpx3Sbwj+jwhDz8BpFpJiQQvwBQuhiVPH8DIFITveoC90K3EFOE6sZvteib5nmYjR7rh7TwAND33uiU576RwWch9ar6CncfT3VT0n6coDnZ1wtpgMLriTyj6NInTdphiHdlyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7R5BwA6QqhdX7cikvqCCa4tNpbZpgVL0vnYlEUZVgc=;
 b=ezkAJ+QC3ZHRGlnlmA+ktCVLb+TIDBfhMQbYXGPKI38lUBp+W3SJxUawhgXMF8uVsNeRRPgBXIeEkw/zfRi+gjuq1hMyvdbIoFYQ8A3eojcn8Y7nClb7z+SHk0w0zDi/dUMMMpknBjzntID5/z2Ti0kA2Ui1SaRwxXWj72T5WZrZS418qL+sAfgsksvnIOtozTdsmx4n/SzqILz3Cbmv5JIOcm0uxWZ60+MBXpAU1jShna3C1Juc0T3BPYDmovrV9WiYB6FKRtfdvXeZOjrFP4Yvaw4kFsuLyEfSnqZ0hk1zrXALJetvc173Vl8Cm/xhvsqN2QVsI7I/acQAcSZqUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB8475.namprd11.prod.outlook.com (2603:10b6:806:3a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 15:55:36 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%3]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 15:55:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
Date: Wed, 7 Jan 2026 12:55:32 -0300
Message-ID: <176780133253.14086.11727954615085076706@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 18769195-1523-49a1-3f21-08de4e0532aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUQ2d2tHQXo2WWN4ekZDbFdIMk9mQTVoK3Rtd1dKMzF1aFdBbzNaNXpNTE1H?=
 =?utf-8?B?RjREMG13QnlUMG9jcHpGVEVSZzFJR01ZbzFjYlJQY3FuS0tyK05GS0V0ZytQ?=
 =?utf-8?B?QktpaUxCM0VicnpZZCtKZHpzWWg4NFNKYmdZQ01qb3hFMU5jMnR6L3JVM2FU?=
 =?utf-8?B?cm5tNzE1R29xbnNyNTdYcUhKYU42UElmbElFcU14QzA2RisrL3AyUTk2TSt6?=
 =?utf-8?B?d0RnS0lnMXhybG51QU1iMENmTElWWFdjbmNhaFB4T3M3KzAwVmJpSXFSTHYv?=
 =?utf-8?B?VWd0NXFXZ01UQ0Rjc1MrTUJDT1hmQjV1RnVDL0Zqcmg1WnU5QjNpWml1Q0JV?=
 =?utf-8?B?U1o0eThRckQzYXhHankweEJXam9sT1hhUWhXOEhhRzlMMmxEUUVkcGhYYkEy?=
 =?utf-8?B?MDlpYnZPQ1lET3V3a3RPOW5ZUzdnTEs0UzdURHBTMU1pT1RBWVhsUWtXS1po?=
 =?utf-8?B?MHgvTDVaOTdRN0IxVzlsc1FQUVJjYnYrdVk5VGpBdktXK09TdWRGc2pPTzFC?=
 =?utf-8?B?UTRMSEFaaXQ4N1lMZEw3RnRVOXNYL2FSM3NCYWc0ODVuZ1k5QWlrMmQ3M1l4?=
 =?utf-8?B?L01uZnMxK21YRjBFRURpYlF1dmpPSHN3S3pYeTc4THdmTmVrVDRjOHNBZjYz?=
 =?utf-8?B?d3VrNEcybTlXeURPVFVETkd6K2Y1YzIxZ29LRXZ1cWNjU0d3MjBrank1dk5n?=
 =?utf-8?B?TEFZd2VpdEozOW4xdi92UEgvZTZGREp3cXhCbk5OTzlNMUwxdUFsU3FqajBG?=
 =?utf-8?B?WFFLbHhxQjNQOEFaV0R3dzA5U2dpQUlpSkxFeXFCOUdpcEtEcmZQOW1aRU5o?=
 =?utf-8?B?R0Qzc3hhaGNZNVFCdFFGQmMvY040SHFDQUpPSjNRNkkzQk81OWRSazNZYmpQ?=
 =?utf-8?B?Nmt4bFoyNG9WSVJUbm1MVjRBaUJGNFdYU2dvYXpRU0VNbkZFN2lzN2Z5R0NI?=
 =?utf-8?B?eFRNeWh4T3h1U29nUm5QcjVhU0g1MXZSYW1TNzVzZUVxQXdPanAvWlNqS3BP?=
 =?utf-8?B?UUlKWUhpMVozVlVKdzh0cjJES0FvNGhRRGdDWHpORHBSUFp3TThyeWVtTUFB?=
 =?utf-8?B?V3VwOEs4YXNWanoxWjdxMFR5UDlnWFc3c1l6NUpNb0hPMEhYRmMvMjIrV3Mw?=
 =?utf-8?B?MFltMVQ5QkdlRi9FSWZuKzNoWXNzZU1SdThjUWxEYVpJc3htUS9yMk9GOHhO?=
 =?utf-8?B?c3NDZlhUTTdXb0tjMEhMeHVTYkpOclJsSW9tUFR0YmZlRUh0NGdGejJIUlNx?=
 =?utf-8?B?cWZJczlnOU9uNjM5bHZDeDB4ckFJWWJ5citOSmVjSVdvNkdVSGlsOHprYWpR?=
 =?utf-8?B?RUxEVlhJazVtMVluVHlYWFR5akRnNzRoeDNwdUFFVjAyMzlnbkZ6RzhFVTBD?=
 =?utf-8?B?enFid0JBSGx0Nnk1dUQ1WHVaRWdIbGhIRUFIejdEM045RjhWUkF1OWFVU1lq?=
 =?utf-8?B?bzl3Z1A5S0VtcFR1c2RDUUdNdDJpcm40TERMdjF1VU1JQXpDN0hFYUQrcVk5?=
 =?utf-8?B?NlRLVjBvdU1xWTdJcXZ5cytITm5pWUxZWlNNYWY1UXFEQlI4RERRcG1RK21z?=
 =?utf-8?B?a0RLM2U4a1VmOVhFMHE2eUdyWDBZR1I2TURNaHRVcW81MGhFT2dtRHJoYjFI?=
 =?utf-8?B?RElDRUJQNERGaDhQMDB0NFYrUldOQXd4dWxheVQzbUdocGVScFFaQWtleVk1?=
 =?utf-8?B?MFUyZGRka2ZIWmlERHJjN21pYVJYdUFyQmdCdjhLd0Z1K25zNHNPdkJmRXJR?=
 =?utf-8?B?UVVFWUxRdDBXWDFERjdiRCs0RkxiT0w4SnZRRFF6VDR2RzFSdkM5TmNiN1NC?=
 =?utf-8?B?Y0lUQ3FYOWg5WnJvbjhkNHdlSXpqYStJMFJyTUxIWnNXY2UyeWtNdWI0aHg3?=
 =?utf-8?B?TXJWUFFkRXM0M0IxblRKTFl5ZkRBNWdnMDFqRnZIaWpPM3E5bXBsZXFQZ3Np?=
 =?utf-8?Q?u8SeINkdeUR+XeCZlMDGFmIKFyi7MdEq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STM5dXd6V2IwQXgvUng5UzlNeU53aWlYai9INVdiR2FwK0dxaGU0b1lZNU9R?=
 =?utf-8?B?RC9qRzZSems2THJDdVBlL24zY3NKcFB3NkcwbU9aVk84Z2ZxWEkzUFRWZlRm?=
 =?utf-8?B?YjBOeVZHbXJLTmd1UE5wbTVBamNBZVhnWWhZMDNxS2FYcFZObWZBSFlhYzFR?=
 =?utf-8?B?YnRwaFJobUIyUEsyMmd5SDZBRkQyRDF4M2hIem5uZ0czbGlSNmJjODJMQ3Rs?=
 =?utf-8?B?VHZqN1huVHJMSHlvNjlYYU05aGE2Q1o2SzUxSkcwdkdFNFNWRUxnazZ3U2NM?=
 =?utf-8?B?Tk9WTGJxWTlTY3VuUDV3clF3b245aDY1R2dRYTVFYm5hM2RWbUlKYmRSVmxy?=
 =?utf-8?B?bEsyU2NhS2o1bmY0dGMzQWs1bkxxYXExODFqZzN0VGlWSDNpUUpWK1ovejBq?=
 =?utf-8?B?WDJKL1pxRlJnZUlnN0x5S3pjaWJFQmdMaDhydFdwdEZVNnlNM3lJaTNYbEFW?=
 =?utf-8?B?c0RtYnNwa3ZEdFpzWlQwQjY2aWRKbzNnWk1kNVNvQkVOWGsyR1RCZEg1WmpR?=
 =?utf-8?B?SEVXak1tSVUwZllYKzFRcWJaVWs3dkFmNEE2YzB1cEhJRC93N2U1dThWOFZX?=
 =?utf-8?B?MUJpZW56emIzNDFYWTg5VStFOENkRmdXZXJMeVQzcTRBOXpQR3dybXYwZklK?=
 =?utf-8?B?SWdyWmNjZ2g2VGNkQUk2ZDU0aERtMUoyUUVPYnBEQVdncVgrYjdxZmJzanRC?=
 =?utf-8?B?KzdiWU1YNnVGUTZKazRyWk5XNFBwYXdBRFBCTjV2VDdNWlBLMUdaRDN0VVN2?=
 =?utf-8?B?V3UvR0JHS0ZsWWVFdWxWeC9zT3JyWG9seUt5d0tBbHFKbm9OdWtQeFI5UEpx?=
 =?utf-8?B?eDlRc2VoUjJmV1dUenR5TGtFMVZFMEtqUjFWbllvRkkrOHM4V09vcGpvdXcz?=
 =?utf-8?B?MitleUlMdDlGd1NhdTJVdWdyYzJ4eEpkTjBBcFozQzlVcEUzbWtwRkNsWVpN?=
 =?utf-8?B?WWYyRExsVFUwZDNzM000a01EQjFuVUhuaXRwOEdUS0hpYXhZclNPOHhhb1Bn?=
 =?utf-8?B?THB1V1g3K2owamgyeHhBN0RpckZtbVF4blpWZEYrWnU2SHJ5KzZZaUI2Q2xs?=
 =?utf-8?B?SnJiS2lUQmdUVzQ4eitLRTJMcGZ5TU1nR3N0WFlDR3IxTGE3bFdjL2tzNHUz?=
 =?utf-8?B?MFE5UVdvNkwrSUlLaDA5alMzMm92cTF6Vm9HZjRsVy9ua0NZNCs2WjUvSU12?=
 =?utf-8?B?dzIzRTFocEVSR01kOG9HOGlYd1Q1T2p3MVRRc1lQN1hqTTA2MExnbjZ5MUpZ?=
 =?utf-8?B?OVdkZE9RTzRycEMvWDJYT2pWL0I1Uk1TVEdzZ2NVcXdBbUFpWEIxUThuVWZW?=
 =?utf-8?B?cENVcktSR2RpbVJXWVBpVE1HQzJmSU1UQm40dVJIVzN2UEFXMXphZHRmOWJX?=
 =?utf-8?B?clA4Z3kwYjQ2bFRaZDZ4ODA1SmEvQklvVzBhS1JrWks2bXJkN1NkbkJRYVMy?=
 =?utf-8?B?MXRCUTBYdFdrbG03VnowMDBUWTFHdDBJcTYwZkYxOGw2R1o5dHRmb1IrcEh4?=
 =?utf-8?B?TFR4aU0xM2lZQnJrREN1cjR3QWNtaU0zMWo4TTZnY2tuWnB5Zk1PYzRqVHBS?=
 =?utf-8?B?VEdhR2xhT0tRdTRWR0tsRkFXQjkyd2M3eGpGN0N3MENJU0hDVTdPY3Q0Zk9P?=
 =?utf-8?B?WngxYW1ZbzJLTVdRZkZJMWgyMWdNVHFPem0wZTFpN2tndURiSkhTSjNPZWl6?=
 =?utf-8?B?Q3ltYUt4dnZPNWdjVWEzSHp0U2huMDlueDYxaUttSjFtRXRhMlFNQ2E0OCtP?=
 =?utf-8?B?T3VQVnpoWHZnUElUUTBramhad01pUjlmS1RZdHN1aHl6VGdpclQzOVNJU2lv?=
 =?utf-8?B?a1VVR2dsdFJPOVlEdHR0ZHc5QVNHNWVjdUkyUzdjek9jOXdNMHlrVTA5UFlK?=
 =?utf-8?B?eHlFL1ZYY2ZIQndPd0lGWFFHNVVWSHhidFJXZGUvSW52Tk82UGZXMGIvN1Ix?=
 =?utf-8?B?YlFOZkFtODhDRUFVcVdwK3I0Zm9rbkR6dVZ1T09SeDRNTksrbzdQcUxsZVZa?=
 =?utf-8?B?RHphSnRXc3d4R0krMWRBQ2NCS0tKb05SdSsyT0llQWNsbStyL2tUbTlQeU92?=
 =?utf-8?B?Um1IdjhUb1l4eERJMERWMitFOHRYOTB1dWRweTJlOGhUMVJaQlUvcTBSOGVY?=
 =?utf-8?B?Q05teHZNa25TM3BYM1BxUGZGVjNPYWNXUkxyQXExTm1FS0tIaVI4a2lUUzU4?=
 =?utf-8?B?WXV5SStIYWFRUlZyQzMvZjRDNHdCbzdQUnhnbC9yaUR4YXU5dGd0UktNWDZH?=
 =?utf-8?B?WjlKSFBhR2U1RndoYU90ZzR0UHZHZHF1TTE2QTFHMWJtWUJHVVR2UXpiTW1r?=
 =?utf-8?B?Z1Z2dFRtWGRsUnVmR1pqdEFPSlJaRU5lanZDVmpJalFYZUV3dWZ6Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18769195-1523-49a1-3f21-08de4e0532aa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 15:55:36.6030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISStu4Gn0K1qkGFCZvB4o4uANoH0+Cd069kFAtYINzl4NQcp+stIcGFnh6awsfSM2lw+YGtH4puufm7OoHlVRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8475
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

Quoting Juha-Pekka Heikkila (2026-01-07 12:10:04-03:00)
>Here added compress-js parameter for runner. What it does is at per test l=
evel

Maybe rename it to --compress-json-dmesg to be more precise?

>for results.json in dmesg key is written text "compressed" to maintain
>compatibility and on the side of it is written new key dmesg-compressed wh=
ich
>contain dmesg ran through zlib and base64 encoded.

Should this be only about compressing dmesg for results.json? Or should
we take a step back and make it compress the dmesg files in the results
directory and then that would also be reflected in results.json?

By the way, do you know if we have good compression rate on existing
data?

>
>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>---
> runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++------
> runner/runner_tests.c |   2 +
> runner/settings.c     |   7 +++
> runner/settings.h     |   1 +
> 4 files changed, 112 insertions(+), 15 deletions(-)
>
>diff --git a/runner/resultgen.c b/runner/resultgen.c
>index 1f7e79f24..ef6385598 100644
>--- a/runner/resultgen.c
>+++ b/runner/resultgen.c
>@@ -8,6 +8,7 @@
> #include <sys/stat.h>
> #include <sys/types.h>
> #include <unistd.h>
>+#include <zlib.h>
>=20
> #include <json.h>
>=20
>@@ -961,12 +962,61 @@ static void generate_formatted_dmesg_line(char *mess=
age,
>         *f =3D '\0';
> }
>=20
>+static struct json_object *encode_compressed_base64(const char *data, siz=
e_t len)
>+{
>+        uLongf destLen;
>+        unsigned char *dest;
>+        gchar *b64_text;
>+        struct json_object *obj;
>+
>+        if (len =3D=3D 0)
>+                return NULL;
>+
>+        destLen =3D compressBound(len);
>+        dest =3D malloc(destLen);
>+
>+        if (!dest)
>+                return NULL;
>+
>+        if (compress(dest, &destLen, (const unsigned char*)data, len) !=
=3D Z_OK) {
>+                free(dest);
>+                return NULL;
>+        }
>+
>+        b64_text =3D g_base64_encode((const guchar *)dest, (gsize)destLen=
);
>+        obj =3D json_object_new_string(b64_text);
>+
>+        g_free(b64_text);
>+        free(dest);
>+        return obj;
>+}
>+
> static void add_dmesg(struct json_object *obj,
>-                      const char *dmesg, size_t dmesglen,
>-                      const char *warnings, size_t warningslen)
>+                      struct settings *settings, const char *dmesg,
>+                      size_t dmesglen, const char *warnings, size_t warni=
ngslen)
> {
>-        json_object_object_add(obj, "dmesg",
>-                               new_escaped_json_string(dmesg, dmesglen));
>+        bool used_compression =3D false;
>+        struct json_object *compressed_obj;
>+
>+        if (settings && settings->compress_dmesg && dmesglen > 0) {
>+        compressed_obj =3D encode_compressed_base64(dmesg, dmesglen);
>+
>+                if (compressed_obj) {
>+                        json_object_object_add(obj, "dmesg",
>+                                               json_object_new_string("co=
mpressed"));

Yep, this is not very useful, but can help avoid potential crashes of
existing tools that consume results.json today.  Nitpick: I would go
with "<compressed>" or "(compressed)".

>+                        json_object_object_add(obj, "dmesg-compressed",
>+                                               compressed_obj);

Maybe "dmesg-gz" or "dmesg.gz" to express the compression format?

Another option is to have some key dedicated for that, e.g.:

    "dmesg-compression": "gz",
    "dmesg-compressed": "...",

This would allow other formats in the future.

--
Gustavo Sousa

>+                        used_compression =3D true;
>+                } else {
>+                        fprintf(stderr, "igt_resultgen: Compression faile=
d, falling back to raw dmesg.\n");
>+                }
>+        }
>+
>+        /* If compression wasn't requested, or if it failed, write raw dm=
esg */
>+        if (!used_compression) {
>+                json_object_object_add(obj, "dmesg",
>+                                       new_escaped_json_string(dmesg, dme=
sglen));
>+        }
>=20
>         if (warnings) {
>                 json_object_object_add(obj, "dmesg-warnings",
>@@ -974,7 +1024,8 @@ static void add_dmesg(struct json_object *obj,
>         }
> }
>=20
>-static void add_empty_dmesgs_where_missing(struct json_object *tests,
>+static void add_empty_dmesgs_where_missing(struct settings *settings,
>+                                           struct json_object *tests,
>                                            char *binary,
>                                            struct subtest_list *subtests)
> {
>@@ -987,7 +1038,7 @@ static void add_empty_dmesgs_where_missing(struct jso=
n_object *tests,
>                 generate_piglit_name(binary, subtests->subs[i].name, pigl=
it_name, sizeof(piglit_name));
>                 current_test =3D get_or_create_json_object(tests, piglit_=
name);
>                 if (!json_object_object_get_ex(current_test, "dmesg", NUL=
L)) {
>-                        add_dmesg(current_test, "", 0, NULL, 0);
>+                        add_dmesg(current_test, settings, "", 0, NULL, 0)=
;
>                 }
>=20
>                 for (k =3D 0; k < subtests->subs[i].dynamic_size; k++) {
>@@ -995,7 +1046,7 @@ static void add_empty_dmesgs_where_missing(struct jso=
n_object *tests,
>                                                          dynamic_piglit_n=
ame, sizeof(dynamic_piglit_name));
>                         current_test =3D get_or_create_json_object(tests,=
 dynamic_piglit_name);
>                         if (!json_object_object_get_ex(current_test, "dme=
sg", NULL)) {
>-                                add_dmesg(current_test, "", 0, NULL, 0);
>+                                add_dmesg(current_test, settings, "", 0, =
NULL, 0);
>                         }
>                 }
>         }
>@@ -1048,7 +1099,12 @@ static bool fill_from_dmesg(int fd,
>                 if ((subtest =3D strstr(message, STARTING_SUBTEST_DMESG))=
 !=3D NULL) {
>                         if (current_test !=3D NULL) {
>                                 /* Done with the previous subtest, file u=
p */
>-                                add_dmesg(current_test, dmesg, dmesglen, =
warnings, warningslen);
>+                                add_dmesg(current_test,
>+                                          settings,
>+                                          dmesg,
>+                                          dmesglen,
>+                                          warnings,
>+                                          warningslen);
>=20
>                                 free(dmesg);
>                                 free(warnings);
>@@ -1056,7 +1112,12 @@ static bool fill_from_dmesg(int fd,
>                                 dmesglen =3D warningslen =3D 0;
>=20
>                                 if (current_dynamic_test !=3D NULL)
>-                                        add_dmesg(current_dynamic_test, d=
ynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
>+                                        add_dmesg(current_dynamic_test,
>+                                                  settings,
>+                                                  dynamic_dmesg,
>+                                                  dynamic_dmesg_len,
>+                                                  dynamic_warnings,
>+                                                  dynamic_warnings_len);
>=20
>                                 free(dynamic_dmesg);
>                                 free(dynamic_warnings);
>@@ -1075,7 +1136,12 @@ static bool fill_from_dmesg(int fd,
>                     (dynamic_subtest =3D strstr(message, STARTING_DYNAMIC=
_SUBTEST_DMESG)) !=3D NULL) {
>                         if (current_dynamic_test !=3D NULL) {
>                                 /* Done with the previous dynamic subtest=
, file up */
>-                                add_dmesg(current_dynamic_test, dynamic_d=
mesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
>+                                add_dmesg(current_dynamic_test,
>+                                          settings,
>+                                          dynamic_dmesg,
>+                                          dynamic_dmesg_len,
>+                                          dynamic_warnings,
>+                                          dynamic_warnings_len);
>=20
>                                 free(dynamic_dmesg);
>                                 free(dynamic_warnings);
>@@ -1116,9 +1182,20 @@ static bool fill_from_dmesg(int fd,
>         free(line);
>=20
>         if (current_test !=3D NULL) {
>-                add_dmesg(current_test, dmesg, dmesglen, warnings, warnin=
gslen);
>+                add_dmesg(current_test,
>+                          settings,
>+                          dmesg,
>+                          dmesglen,
>+                          warnings,
>+                          warningslen);
>+
>                 if (current_dynamic_test !=3D NULL) {
>-                        add_dmesg(current_dynamic_test, dynamic_dmesg, dy=
namic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
>+                        add_dmesg(current_dynamic_test,
>+                                  settings,
>+                                  dynamic_dmesg,
>+                                  dynamic_dmesg_len,
>+                                  dynamic_warnings,
>+                                  dynamic_warnings_len);
>                 }
>         } else {
>                 /*
>@@ -1134,17 +1211,27 @@ static bool fill_from_dmesg(int fd,
>                          * there are would have skip as their result
>                          * anyway.
>                          */
>-                        add_dmesg(current_test, dmesg, dmesglen, NULL, 0)=
;
>+                        add_dmesg(current_test,
>+                                  settings,
>+                                  dmesg,
>+                                  dmesglen,
>+                                  NULL,
>+                                  0);
>                 }
>=20
>                 if (subtests->size =3D=3D 0) {
>                         generate_piglit_name(binary, NULL, piglit_name, s=
izeof(piglit_name));
>                         current_test =3D get_or_create_json_object(tests,=
 piglit_name);
>-                        add_dmesg(current_test, dmesg, dmesglen, warnings=
, warningslen);
>+                        add_dmesg(current_test,
>+                                  settings,
>+                                  dmesg,
>+                                  dmesglen,
>+                                  warnings,
>+                                  warningslen);
>                 }
>         }
>=20
>-        add_empty_dmesgs_where_missing(tests, binary, subtests);
>+        add_empty_dmesgs_where_missing(settings, tests, binary, subtests)=
;
>=20
>         free(dmesg);
>         free(dynamic_dmesg);
>diff --git a/runner/runner_tests.c b/runner/runner_tests.c
>index 908979982..3ea221ffa 100644
>--- a/runner/runner_tests.c
>+++ b/runner/runner_tests.c
>@@ -484,6 +484,7 @@ int igt_main()
>                                        "--collect-script", "/usr/bin/true=
",
>                                        "--hook", "echo hello",
>                                        "--hook", "echo world",
>+                                       "--compress-js",
>                                        "--prune-mode=3Dkeep-subtests",
>                                        "test-root-dir",
>                                        "path-to-results",
>@@ -1000,6 +1001,7 @@ int igt_main()
>                                                "--hook", "echo hello",
>                                                "--hook", "echo hello\nech=
o newline",
>                                                "--hook", "echo hello\nech=
o newline\\still the second line",
>+                                               "--compress-js",
>                                                testdatadir,
>                                                dirname,
>                         };
>diff --git a/runner/settings.c b/runner/settings.c
>index 3ccf71870..7d7320d62 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -33,6 +33,7 @@ enum {
>         OPT_COV_RESULTS_PER_TEST,
>         OPT_HOOK,
>         OPT_HELP_HOOK,
>+        OPT_COMPRESS_JSON_DMESG,
>         OPT_VERSION,
>         OPT_PRUNE_MODE,
>         OPT_HELP =3D 'h',
>@@ -704,6 +705,7 @@ bool parse_options(int argc, char **argv,
>                 {"collect-script", required_argument, NULL, OPT_CODE_COV_=
SCRIPT},
>                 {"hook", required_argument, NULL, OPT_HOOK},
>                 {"help-hook", no_argument, NULL, OPT_HELP_HOOK},
>+                {"compress-js", no_argument, NULL, OPT_COMPRESS_JSON_DMES=
G},
>                 {"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
>                 {"inactivity-timeout", required_argument, NULL, OPT_TIMEO=
UT},
>                 {"per-test-timeout", required_argument, NULL, OPT_PER_TES=
T_TIMEOUT},
>@@ -815,6 +817,9 @@ bool parse_options(int argc, char **argv,
>                 case OPT_HELP_HOOK:
>                         igt_hook_print_help(stdout, "--hook");
>                         goto error;
>+                case OPT_COMPRESS_JSON_DMESG:
>+                        settings->compress_dmesg =3D true;
>+                        break;
>                 case OPT_MULTIPLE:
>                         settings->multiple_mode =3D true;
>                         break;
>@@ -1253,6 +1258,7 @@ bool serialize_settings(struct settings *settings)
>         SERIALIZE_INT(f, settings, enable_code_coverage);
>         SERIALIZE_INT(f, settings, cov_results_per_test);
>         SERIALIZE_STR(f, settings, code_coverage_script);
>+        SERIALIZE_INT(f, settings, compress_dmesg);
>         SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
>=20
>         if (settings->sync) {
>@@ -1371,6 +1377,7 @@ bool read_settings_from_file(struct settings *settin=
gs, FILE *f)
>                 PARSE_INT(settings, name, val, enable_code_coverage);
>                 PARSE_INT(settings, name, val, cov_results_per_test);
>                 PARSE_STR(settings, name, val, code_coverage_script);
>+                PARSE_STR(settings, name, val, compress_dmesg);
>                 PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdlin=
e.argc);
>=20
>                 printf("Warning: Unknown field in settings file: %s =3D %=
s\n",
>diff --git a/runner/settings.h b/runner/settings.h
>index 6c58c3282..09711c052 100644
>--- a/runner/settings.h
>+++ b/runner/settings.h
>@@ -81,6 +81,7 @@ struct settings {
>         char *code_coverage_script;
>         bool enable_code_coverage;
>         bool cov_results_per_test;
>+        bool compress_dmesg;
>         struct {
>                 int argc;
>                 char **argv;
>--=20
>2.43.0
>

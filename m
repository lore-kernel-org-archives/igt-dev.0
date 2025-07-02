Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5621C83F04
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 16:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD6010E18F;
	Wed,  2 Jul 2025 16:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+ddREZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9747910E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751474634; x=1783010634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JhiAz/d5I6213WymCOE60TNHflheBTVVNlmcy+K9Iks=;
 b=m+ddREZTmN7Losqtrk+Z8LoHZRdtOkzyKwb8NIcUXnk5sLPjUrvFHg2V
 XQVOB5KzIpbGooNgCE4ntcGgblh37PDL2846zd+jC/PX6FMVu2m7+tZXp
 AZiZJkgvrrCN/J0jen7U/gq+hGsVnFMX7l/OLJY5EeWcsoAP7/1bUyBOH
 TZwelsFh8QMo62llKcRwv7duYCc+v1QcsU2PWOlQeVK2V/xcxAA0mNWzc
 Tz+XBQPmtcbZmXtRMm+ER0TthVIztbfboaELu3oI1uf3bjSqPcpgITtcy
 Q1p2z1QvdCatWsuBgCU6+F4u/LwH8hD3tbwXsc0gmPf/miH9smK228TBG g==;
X-CSE-ConnectionGUID: WcYcjymlTFCSqkaBfGARhA==
X-CSE-MsgGUID: J7xT6/DhRZSBpnV4ZvVIEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71354708"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71354708"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:43:53 -0700
X-CSE-ConnectionGUID: FrRq2JOeT0qoJ+Hu8zBqDA==
X-CSE-MsgGUID: XojE5oQdQFyP3KrsFXvAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153764629"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:43:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 09:43:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 09:43:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 09:43:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXdn0I055Zp5cAvSflQE29jE4G8kJbtgAzc2DfRNawX1D/0AjoIwQEJGqNc+XMs3H3PWymIx6ceP6URxZsns6t9EwfzuI6R4HGuO0rnGFOyD63YH1e/n8bAkkaA66nwD9YluKohgudg5CTWR+HnokgOWCRo2tR2csiCyXhUrPHxCPHlZPMTHOKqv1WoOvoDhMmBhGwhmQY4qJD5AqH+5idMnxdDSzivWvwJW1c+pvgnBD8g43ACN2CmxlNdLdjVWzkvcFjP9xHohyfoXAu9NGBxAHjwDR91HvzD04K9g5LdwGWRQa5zOSDee//qJ/YX8TX4+LOvIyJD0zpoEK0hfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhiAz/d5I6213WymCOE60TNHflheBTVVNlmcy+K9Iks=;
 b=CALLueLyp6RefU82rr8dyvE8kb6B/U8mVInX9X9nwBPd5cTVulVuuFAh4IZr982DLyXzmeZ9g4awUe1/iPN4vexeUBcV0fhDtN9M+ytSMghW3A3nAIBV3rdArVNhE2a7efPxvajMXHW8dFYpPnf/JeCupRuaWk6z/AHzJomhQJ21wfY3xzLSvL7BWAJc6gTCp6vHYlb7K19Wa9HnQ/jOYN/2RlA248BTPlicdVa9Mw/up0uSBeClfT3HzYUYqQEntoq+/mpX2+N1hTFb7hTkyeeU3GmTVQxMpdErUkwe68ux4nv5PqKxW1eswot3Jaj4djTwym2dHm9s3J84+9KPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 16:43:09 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.8901.021; Wed, 2 Jul 2025
 16:43:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>, "Golani, Mitulkumar Ajitkumar"
 <mitulkumar.ajitkumar.golani@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_flip: Skip timestamp checks in Intel
 simulation environments
Thread-Topic: [PATCH i-g-t v1] tests/kms_flip: Skip timestamp checks in Intel
 simulation environments
Thread-Index: AQHb5OVYL+YPADNuLkKACKTbt3cG2bQe2maAgAA7ZsA=
Date: Wed, 2 Jul 2025 16:43:09 +0000
Message-ID: <BL1PR11MB5445ACF0EFC5E1DB709100F3E540A@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250624085217.139873-1-ramanaidu.naladala@intel.com>
 <20250702130617.hm7eep3vtxcotnue@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250702130617.hm7eep3vtxcotnue@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|IA0PR11MB7816:EE_
x-ms-office365-filtering-correlation-id: ac4c7888-2ac0-45b8-6310-08ddb987872f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QURyM3hvQ3dUV0lwT3RsNE9XYzU3VndqSFRmUWFnNXFFQnE2SlJONGlBODl1?=
 =?utf-8?B?enJJWE5DMmZxditUNmFHb2JxZllzVDdUSkdtRGRZaEx2eTJDNjNWNjFMZlNP?=
 =?utf-8?B?QndyL1pZZXhNSC9MN2RlU0FleW40RWRBVEFQQ1Z1T1BpVGRuYmNuM0p3MHFm?=
 =?utf-8?B?WWlpR1RRNldubDFTNzBsV0NPU0VaZndFVDh4ME9zSFhFUHhERzEyMCt0Yk1s?=
 =?utf-8?B?MEZuNVNuem1aMzZtdlFrR2FHTEZ0c1lNSGpXb3RYWVZHR3prY1B1QXNYcTVl?=
 =?utf-8?B?L1pLa0lkTWIxWEpSQ1lvU2pVTkxKZzZqdkNqdEZBOUM1T2hTTEl2V3k3NW1n?=
 =?utf-8?B?WTZGeUVTelUveHZEMUxDSmswRXM0UHkxZzhTakRUQWhvbENITkpQdHNaRkR1?=
 =?utf-8?B?TVhBSm5zdUxIMkc0bXlGcGsycktiNVVpSmR1bWIrVGNML0Fya1hiamRnbE9j?=
 =?utf-8?B?Y0FuQlpVVkhjbzNLWndwTVJNTzRYOXdZOUVhaWVaZyt4dWxaMGVSVWZmRUpn?=
 =?utf-8?B?WGducEdVTzBXOUd4OXVtREZSREE1T0Z0OXFMOWVvSnFXTFZDaThaT1BiUkM1?=
 =?utf-8?B?aGtBcWk3dDN5TDNZZS8ycE8wRWJDcWs3WkI3UHd5RXZ1eHhhYzlCbEhEVXVU?=
 =?utf-8?B?MmVvUmhsUU81UVVNMkFIUnVTZEVjTG5VdXpmWjV3UlJ6NkFMTWh5VVVkMFg4?=
 =?utf-8?B?SXJSMXZ3TFg2UGR3czdUWDBmTzZmVDBheEV5Z0QyZi9CV1ZMNUI0S2tMN1gx?=
 =?utf-8?B?dWt4d1NUckl3eVF5QWgrVjltYjdlMjZYWGxyZ2FCeHp5eHdvaExoSFdLWjZi?=
 =?utf-8?B?RXJhNkdLNzg2SFZ0VlpLLzJ3YTBielRGMFhoZndtZko5bjJUVmJTZ1dicENi?=
 =?utf-8?B?UnBDdzIzTmovaGJheE5QV3pRQXM0Ri8vWldrZW5rQ1p2a2RCOFBjVUV5OUti?=
 =?utf-8?B?akNJcUpDS1MyVkFTMkJYT1EzWTZ2YWtVVXRvSnUvUzNHVS9OcnhnMjJYUkR3?=
 =?utf-8?B?WVVOaktWU3lGZHpUalhhcEIzQ0E1T09sYjNEQlU4L0QxMCtJRXNyU1lrYThh?=
 =?utf-8?B?d3FFcDF0ZGdqa3QwL2g2U2JGSExoRExRSmhodU11K0txdXB2Y1FBSklHWllF?=
 =?utf-8?B?Q0tBcXAyVmdsR09reDZQMkY2VDIyeTIyS3U2VFJOakhDOEdQZkxXV0swUFFa?=
 =?utf-8?B?RzB5Q3lqTDliVy8zcTFPeTRobm9rVXVVc1JjcEJsVU11SlFJRDkrRGZFWEcr?=
 =?utf-8?B?Y3Uwd1NEbWx0bnJjZnlrdjNPVkZjb2pyZVdlcjJBNjF3S0xHYmJxRGswWmR5?=
 =?utf-8?B?MDlMbVppdmFYalluZFErUzhwUndmZ3cvcXVzaDhaZnh4MUY4aXVRNjFyU1ZF?=
 =?utf-8?B?aXBVOWJ3SEJ2akdXMHpvbmsreGxTdzk2M3IzYTlsanp3eG9vdW5QZldCVmY3?=
 =?utf-8?B?a2c1clYrNzFEaUZvbm42NG40ZEhXcVVGWjBRMGVyRGpoNnY5NEhScHZyNlBB?=
 =?utf-8?B?dmd3U2VKcmtqcnkyMmxzc3J0YjEwdGRvRWFYSDQzTnNQYTNadS83TkVlUHkw?=
 =?utf-8?B?LzJqa1RaaWxXT28zdlJWOGFVeDQydHlsNHhMcTNuVzFRcXFwdS8vN2J0MTE2?=
 =?utf-8?B?OUYrOEV6dmlraHJLMnh3KzVDN0dvZzgvYzVMckR0Mk1md1I5bGZQSHFtWWxT?=
 =?utf-8?B?UStwUWpESGx1YVp2Y2Q3RUl3R1VCSFc5M2kyNHNQU2d4YWNNbUxQaS9TRml1?=
 =?utf-8?B?dk9lMDJncHBqKzN6S0FuOEFlZ3NBNzJXVEpDS0hkUTZWZkt0bC9jMHNrcGhW?=
 =?utf-8?B?Z293YVJCWDdTSjVKNTBmL1J6KzF6L3JhcGNzbDhmRDFoTXc0OWtiSGo2eVFr?=
 =?utf-8?B?TFM2dEt5b0hRR1dhOWZ2YmV4N0ZjdTFZV1REMi9pazluVm5ELytLbHlQSHhJ?=
 =?utf-8?B?aitHZFNxempmSUxHUG1NL2Uwd0pOc3Z0VDY4eDhxcHZiOXBQS0VNWFJvdGZV?=
 =?utf-8?Q?XYE4HnrxZjDm04R4O3Jk183XEAtxaQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVFvWjEwMGtJZE9XK0p6bDBLaXhNcjJVOE56SUp4QkpuUzJNWHB1U0I2b3Np?=
 =?utf-8?B?aFlGaHRqTVRObGhscDgzTkRWcmxuU2VXTWN2bGRvekN2Q1ZXbCtzMDRWbG9Q?=
 =?utf-8?B?YU8vR28xSU9ySXJUNTBNcGl3b0Z1WnY5TmRZT3FRLzFmSk9UWmYwSnlqTU9U?=
 =?utf-8?B?MUp6MXVEMFUxNjFyMEFhTFhuL3k4SE1HNWxta3FsWnpCYXBvdmZrYmJTOTJQ?=
 =?utf-8?B?Yk00eU9HRlIxb2hFbzVBRkFGaXEyVE1qREFlSkNZMFB6bzJybCtaNHA3OWhB?=
 =?utf-8?B?QWdjUytMT1ZGOUxDdE5HQzMreDgzV2NiemY5TlRpaW5TQlpnZk1tQ29OWUl4?=
 =?utf-8?B?cDV3ZkZoLzZJd2ZDUDlrUWFFalNOWS9UTitTN2JKNDJBMnFhWkw3QzdWaEMw?=
 =?utf-8?B?c3lmUzREUEprQjdKc0xHdHUrRzJUc281a1U5N3pUSTVFQStyRm5tSTR0Sk53?=
 =?utf-8?B?YUVwV3dBV2c1WTMyR1ZNYzYwd0NPWmdsVCtPdTdxVGxxcmNRVU9lTG1qMnFo?=
 =?utf-8?B?dm1nTXkyZE9LVHF2RjdKdE1Ba3dVdTJQRk9ZZEJaV083Z1ZYa0RVR0NBUEhk?=
 =?utf-8?B?Wnc1VGgxZFhJU0RpdEIrcXA0UUZJZElnRFVvUDI5a3lUQXFKbGdzeW9yNXJW?=
 =?utf-8?B?MG5aVjN3eU0zd3ovOFdNTEppVENhR3IzeVd2ZDNmdGVoeDAxTU5rTTBYTXVH?=
 =?utf-8?B?TnRJOCtlemhBZlZpQlRiRnhNU3p5am9EU1FhZ1llR2owaXVxZkp0ampuUW4y?=
 =?utf-8?B?MEJ0UWZPZkh6ajcxVW9SVjYxcEdZbFR3MEpGbVZCOWN2Z0U2N0JueWV0Z2xp?=
 =?utf-8?B?MnJxcXpmcWtBZ2oxaGowMHA4TjlGcWxSQlZsclpicmVad0tIRG80c2hDVHB0?=
 =?utf-8?B?OENxR2NvbDFrelR6TXRZRE1KN2NESWxPd0c4ekoxSnBISi9MREFzR3l2Mmtl?=
 =?utf-8?B?SSs2WjY5Y2l4cG1qaU1Za0N2dE04NlZJMTlIZFFwWkJraU9CQkFhenZqN1pY?=
 =?utf-8?B?L3hvSGJ2ZzhzakdOSkQ2TWFTdW5hTG0zZmJOUG9iWjltZG0yTHBBcVpRNnhV?=
 =?utf-8?B?ZWZpdGVFeHJTVFZFWDZ0WlgrcE5xRXpDQUVTZVFBZXpiRWFrbXFDN2Vjc2JF?=
 =?utf-8?B?RG80RGJCSzdhUHBWYW5qUWQxRGlwUEFYSkJOTlpBdlJhWGRHRE0xdy9oYml5?=
 =?utf-8?B?WWNKYWhBZFB5enRybXdoQ0N2Q01jcGRERGRNTSsyS1ovanRtRFR5MWp2NFpO?=
 =?utf-8?B?b0pGdXZZcjVKUUZkZEJyNUUzZUpVdGJUYlJjek84VVRJNTdUWitjbDdtelpD?=
 =?utf-8?B?QW1TQzFFN0pNVHBhUTR0TVNEcnMrS1RpdmdKZnRBSGw3Qk0xTi8ybzZWTWhF?=
 =?utf-8?B?NEI3c1RReEtDeGdtdTZ6Ri9yYmg5Tm5uaVFRMEZHcHRJM3lqR1h4STE4UHNt?=
 =?utf-8?B?TVE1T21qbTJJNnk5bzJOYVFYbWw3QzBiUmNVZ0dueTNYSTdDa2NrRk4xUzRJ?=
 =?utf-8?B?bjhRQkJVdVNkMkEyaVVjS0txWVZ3ZWtyWE5UNlB1ZVl1VEZWRHB6SndIc05K?=
 =?utf-8?B?TXR1Y1JZWXRkUGJ2ZVErWXdpQlFGKzY4ODZGQktlVmE4ZmRTNWV0bWg0MWdh?=
 =?utf-8?B?b01neXkzNCsvQXAxdHZBN3J1OWV3N3JzN1lJWU9GMERHUzd5aC9NTWhhUkNR?=
 =?utf-8?B?OFRGN2NFTk1aZjNld2IrZFFWK08xWVNSbHVzUlZoWGdQVE9zeGJzTDFDWmRB?=
 =?utf-8?B?WmtNSFErWEZiejRyOW9wZVlmWDc2VjJxVVJEK0IvTHNocCtrOEpEdnI3cXFO?=
 =?utf-8?B?SkFvT25zOUw0MGpaQndsaGRDYi9HRGlrZmV5NzJBSHZjRURDRkMzVDhCMjNz?=
 =?utf-8?B?dW5pZFByeE9QMW9aSlJTYUU4VFhmSXdMdHFaanR1ZmFmb3J6OE1SbEFMNEFy?=
 =?utf-8?B?WkRhYmtuSTZMbGZadUdVSHdEVEt1ZjJnOWFpQVpTUkovYTdtMHI4bDJIZG1X?=
 =?utf-8?B?QmlmTnFwZWVUZERyREhZdDVEWXYvR1BiVTNBMmVKdVJobER0WUEwWkl1Uk5M?=
 =?utf-8?B?eU1jMnFXbFBkb2F1T1ZydVRaK0FZYmdLZnc5NUYxUXI3cWVWVUJIbzlldnA2?=
 =?utf-8?B?azRxVklOYWFva2QxVi8vWlVZMlJHOTE4T0x4ODlTMUZYNmI2MXo5YVgwNXRH?=
 =?utf-8?Q?X7XWiYpDppv5TaOYUq4gNNItzphQsgoJ+3OnFgoxQjNK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4c7888-2ac0-45b8-6310-08ddb987872f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 16:43:09.5916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBWbkxpGcccrvbvU/MoaTu3M6z+9ENA6KUaps4eFnhB5WM/baJaWwxaUg6BCWA2ph0EFWxs77c3E5VA4jW7rngKopDsDa17AfVOHEu6AcgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLYW1pbCBLb25pZWN6bnkNClNl
bnQ6IFdlZG5lc2RheSwgSnVseSAyLCAyMDI1IDY6MDYgQU0NClRvOiBOYWxhZGFsYSwgUmFtYW5h
aWR1IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+OyBH
b2xhbmksIE1pdHVsa3VtYXIgQWppdGt1bWFyIDxtaXR1bGt1bWFyLmFqaXRrdW1hci5nb2xhbmlA
aW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2MV0gdGVzdHMva21zX2ZsaXA6
IFNraXAgdGltZXN0YW1wIGNoZWNrcyBpbiBJbnRlbCBzaW11bGF0aW9uIGVudmlyb25tZW50cw0K
PiANCj4gSGkgTmFsYWRhbGEsDQo+IE9uIDIwMjUtMDYtMjQgYXQgMTQ6MjI6MTcgKzA1MzAsIE5h
bGFkYWxhIFJhbWFuYWlkdSB3cm90ZToNCj4gPiBCeXBhc3MgdGltZXN0YW1wIGFuZCBzZXF1ZW5j
ZSB2YWxpZGF0aW9ucyB3aGVuIElOVEVMX1NJTVVMQVRJT04gaXMNCj4gPiBhY3RpdmUgdG8gYWNj
b21tb2RhdGUgbm9uLWRldGVybWluaXN0aWMgdGltaW5nIGluIHNpbXVsYXRlZCB0ZXN0DQo+ID4g
ZW52aXJvbm1lbnRzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbGFkYWxhIFJhbWFuYWlk
dSA8cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMva21z
X2ZsaXAuYyB8IDE0ICsrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2tt
c19mbGlwLmMgYi90ZXN0cy9rbXNfZmxpcC5jDQo+ID4gaW5kZXggNjUwMTZjNjZkLi5kYjdjZWQ4
YWEgMTAwNzU1DQo+ID4gLS0tIGEvdGVzdHMva21zX2ZsaXAuYw0KPiA+ICsrKyBiL3Rlc3RzL2tt
c19mbGlwLmMNCj4gPiBAQCAtMzE4LDcgKzMxOCwxOSBAQCBzdGF0aWMgYm9vbCBzaG91bGRfc2tp
cF90c19jaGVja3Modm9pZCkgew0KPiA+ICAJICogdGltZXN0YW1wIHRvIGRyaWZ0IHdpdGggYSBy
ZWxhdGl2ZWx5IGxhcmdlciBzdGFuZGFyZCBkZXZpYXRpb24gb3ZlciBhIGxhcmdlIHNhbXBsZS4N
Cj4gPiAgCSAqIEFzIGl0J3MgYSBrbm93biBpc3N1ZSwgc2tpcCBhbnkgVGltZXN0YW1wIG9yIFNl
cXVlbmNlIGNoZWNrcyBmb3IgTVRLIGRyaXZlcnMuDQo+ID4gIAkgKi8NCj4gPiAtCXJldHVybiBp
c19tdGtfZGV2aWNlKGRybV9mZCk7DQo+ID4gKwlpZiAoaXNfbXRrX2RldmljZShkcm1fZmQpKQ0K
PiA+ICsJCXJldHVybiB0cnVlOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBJbiBzaW11bGF0
aW9uIGVudmlyb25tZW50cywgaGFyZHdhcmUgYmVoYXZpb3IgbWF5IG5vdCBhY2N1cmF0ZWx5IHJl
ZmxlY3QgcmVhbC13b3JsZA0KPiA+ICsJICogdGltaW5nIGNoYXJhY3RlcmlzdGljcy4gVG8gYXZv
aWQgZmFsc2UgbmVnYXRpdmVzIGluIHRlc3RzIGR1ZSB0byBzaW11bGF0ZWQgdGltaW5nDQo+ID4g
KwkgKiBhcnRpZmFjdHMsIHNraXAgdGltZXN0YW1wIGFuZCBzZXF1ZW5jZSBjaGVja3Mgd2hlbiB0
aGUgSU5URUxfU0lNVUxBVElPTiBlbnZpcm9ubWVudA0KPiA+ICsJICogdmFyaWFibGUgaXMgc2V0
IHRvIGEgdHJ1dGh5IHZhbHVlLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoaWd0X2NoZWNrX2Jvb2xl
YW5fZW52X3ZhcigiSU5URUxfU0lNVUxBVElPTiIsIGZhbHNlKSkNCj4gDQo+IFBsZWFzZSB1c2Ug
ZnVuY3Rpb246IGlndF9ydW5faW5fc2ltdWxhdGlvbigpIHNvIGl0IHdpbGwgYmU6DQo+IA0KPiAJ
aWYgKGlndF9ydW5faW5fc2ltdWxhdGlvbigpKQ0KDQpJIHRoaW5rIHdlJ3JlIGxvb2tpbmcgZm9y
IHRoZSBvcHBvc2l0ZSwgYWN0dWFsbHk6DQoNCiIiIg0KCWlmICghaWd0X3J1bl9pbl9zaW11bGF0
aW9uKCkpDQoJCXJldHVybiB0cnVlOw0KDQoJcmV0dXJuIGZhbHNlOw0KIiIiDQoNCk9yLCBhbHRl
cm5hdGl2ZWx5Og0KDQoiIiINCglpZiAoaWd0X3J1bl9pbl9zaW11bGF0aW9uKCkpDQoJCXJldHVy
biBmYWxzZTsNCg0KCXJldHVybiB0cnVlOw0KIiIiDQoNClRob3VnaCwgYXQgdGhhdCBwb2ludCwg
SSB0aGluayB3ZSdkIG1heSBhcyB3ZWxsIGp1c3QgcmV0dXJuIHRoZSB2YWx1ZSBkaXJlY3RseToN
Cg0KIiIiDQoJcmV0dXJuICFpZ3RfcnVuX2luX3NpbXVsYXRpb24oKTsNCiIiIg0KDQotSm9uYXRo
YW4gQ2F2aXR0DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICsJCXJldHVybiB0
cnVlOw0KPiA+ICsNCj4gPiArCXJldHVybiBmYWxzZTsNCj4gPiAgfQ0KPiA+ICANCj4gPiAgc3Rh
dGljIGJvb2wgdmJsYW5rX2RlcGVuZGVuY2UoaW50IGZsYWdzKQ0KPiA+IC0tIA0KPiA+IDIuNDMu
MA0KPiA+IA0KPiANCg==

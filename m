Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64A9D25B5D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5009D10E119;
	Wed, 28 Jan 2026 13:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6coiOvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142F410E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769606716; x=1801142716;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rBzrxxJ486lBlwvEsqyxN07ZmsgrxKnDYtF+la9uBHc=;
 b=M6coiOvU+E4Fc2l34brMcro2p8u8MfrcF7bKSraI25JedVdJEd8B9jZC
 WKkc+81qVX5S5LCEg/zxWEwxVrqPcVnKS+5nhu5ACX3MgDiirJvFP2xVX
 vmC4pII8T21nhh/CiZ9BIrrCkxxpYUEWF7hFIwTqpgc0UysSB24gL6jw3
 /OHsPZFgR+exXDcrx7+zMnw3ih4GNPD3hKqPLlVoEzMgXkJYgsS4zwJhT
 7ko/VJwY+JTt2/5kTjQBFTohUD7a+TMMtS2SvPC8gfzo4gPKaQzLh4T3I
 ZM4F5OLNPWhtAu1FmJp5fRjMAKpjdvs11+HkCgTWekTLwrS8y8VQQrA0Y A==;
X-CSE-ConnectionGUID: wh3pmRqUShi/Tw6IMAmOvQ==
X-CSE-MsgGUID: s2VudOB6TYGG4JpxPqQwFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70533073"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70533073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 05:25:15 -0800
X-CSE-ConnectionGUID: FnBIKQbFQdyM/1e6wcWcTw==
X-CSE-MsgGUID: BZha86zmQOq7YhVLt+ENoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212365114"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 05:25:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 05:25:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 05:25:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 05:25:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFm8dTaWI/sspA5Tl0Xrhele2WAr740O4FEXDe2Rybpy+ObyXF+hMKso3RyAiAjYO0M1grfPcS9oYPxAPBt3CmqdfLAeHDF2azgragUkCq1053xspH0aox5jP9VWs+fznnbvGhzfHlPA/LrtRnFcvk7rBuaELgDgt6BUxkHi+K9hV4QhQkIRq8/rBivecItGgb3r3I0I+OCZcJapD+Qj1aCg8IXYbrMp9PQ0/CMmlioj9tuSjMCQ8Mjw3jJDolYBKUVCDYag4yA4gCBwEwnGy7EjrLhTs6wqpTG6iy2ZIFEzHXq6ufMLgdRKmEBTZWoRS6YaYBMQR26s+LqQYjsZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBzrxxJ486lBlwvEsqyxN07ZmsgrxKnDYtF+la9uBHc=;
 b=DTa9hJyfm620ZrcZaE6MOwn9z7/WwS1xCu7aNnYpEpfosa87QIwWXoHqdP1GjDaiVLwVLFXOmhSzQ6OZpsOjdS4vRPfQBC6DeA0/x2zzTwAcSUkeUc19QvpFOWETq61w8Kf8Sc56ZzCI7twA+MXbqmWNXtBOaJ2dr9UZd6aCW86bEeKaY+pUUntMaNQA++5N7i473ixkuG3wCbd2TqAvpNmg5yHkT6mFQBooAdWNvHOCiNIKElCkicJAIKzI6GV0C5/6sToMwCnkT2gg5Bb2gaxmKwarVsgepX7s8grZ2TQHXhoF87LzhlH+DE874lxUioHYBDuyP02hKkKk7q802w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 13:25:07 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:25:06 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 1/2] lib/xe: xe_eudebug - Add pipe validation and
 cleanup improvements
Thread-Topic: [PATCH i-g-t v2 1/2] lib/xe: xe_eudebug - Add pipe validation
 and cleanup improvements
Thread-Index: AQHckD6zLGGs84irUUihm0L543jlsbVnjxNw
Date: Wed, 28 Jan 2026 13:25:06 +0000
Message-ID: <DS0PR11MB726448F3249DF28CCD4BFA6ED991A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20260128101529.401653-4-piotr.rudnicki@intel.com>
 <20260128101529.401653-5-piotr.rudnicki@intel.com>
In-Reply-To: <20260128101529.401653-5-piotr.rudnicki@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA0PR11MB7209:EE_
x-ms-office365-filtering-correlation-id: 372ae82e-23bd-46db-592f-08de5e70a751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7142099003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?eHFUSHlxMncveDQ5K3pIQ3NRYitoVkhGNFVBWm1PcmNXQ3R4SXQxcHZtSkZK?=
 =?utf-8?B?c2RRODh3WEIxaGUvUXFPSUR1RzBUdFZGbDU4bHhoZ2pjNGh0YURiK2lzdnRh?=
 =?utf-8?B?T2thUVViV1pKVlYwbFBZOGI4M3N2YTVQUllwa25PV1g3ZDM3T2hPTnF3bVdv?=
 =?utf-8?B?Y2tZT3JaUTUxZDk3dCt6ZW00SzVIVlRaNWdoNjlZZCtuS2JBSWdUSEM2SEsx?=
 =?utf-8?B?NFpNNGZuNDB1bzV1SjkxOWJYYXkxMEM2d3UwS2FqSEZ1dy83MDJnOFhra3JW?=
 =?utf-8?B?cGlENUJ2emdGWnJpQWx6MEFadnlqYVh3VXpLcGdyTVlVWnFEQTJoM2cvRThx?=
 =?utf-8?B?K3dXaE81dmtaRW83bjhCN2pib2dZM29jbkptdmxiaWFHakpmdWdRNStIc0Za?=
 =?utf-8?B?TnVXNVBzQkFLekJVQjNrelE1bmU0cGw5M3llRXlhNUVYaExwSGkvWEg0NWVY?=
 =?utf-8?B?dVBxRElSelE5cTFzZXdTWDBBeW1CMDNMeGEwM25va1V6LysrQnRwQWdWM0lC?=
 =?utf-8?B?OHFtdFFtRzY1ZHpHem1OUURsVHVXOXdRek9RZzd5ak9pb3FGTnNTL3pBRnBD?=
 =?utf-8?B?UnRLLzhSSXZCMDRycTA0ajF0LzVhbXh4WGROZWlXNTNWa29VeGFEdHdITG5B?=
 =?utf-8?B?VGpudWhXYUk1eVZ2ZGN5U1ZnUDlvcFA2b202akVUK3dVWUZOWXBRVE9iRTA1?=
 =?utf-8?B?Q3RaakhRN05nMGlaRC9LSkZmUnErZ0o1OVhQS3RYUUJUNElKMTRRNGdjaE53?=
 =?utf-8?B?KzJzbkVoc2Yvc2Z1dWxEQ0lKejlqRFNnc3BqZ2NySUVjcVZJQ2oxRGpXY24w?=
 =?utf-8?B?Z2N3MkNQUzJnVjY2R0Y5QitKUG1qK3ZoTlhmZEhmVE9lNDAvenRlYlJ6ZUxI?=
 =?utf-8?B?QkpDN0xDemFMN3VWbkNsQ2JPcncwcjBwUUVEVzdVdUtrb3ZaYm5sbmF3b0Vx?=
 =?utf-8?B?S0t4ZmNtRUs4QmZSa2NQN0RCbEhXelZ2ckFvQkE2K2w5cVhUQkgxcXlUS3Jm?=
 =?utf-8?B?Z1BIRHJ0eWFBUFRkWVhIY3ZqUEdVUWxjYVZyV0d4TzZzWllrQlIxOGo1Z0Rz?=
 =?utf-8?B?WTBXUFlCS2ZMNzMySGo5Z0cwdzhhemk1bkE0VGlXaFFIdUppMkZTZVNtSklu?=
 =?utf-8?B?L2NZMmk5NGdiZFdLL0ozbmJiZW01ZUpmU0VzcG1TQUFBYW00ZzhyZW1OQnN6?=
 =?utf-8?B?WTcvNVcrNm1tNmdUZllvL3Q4VlNSRisrRkxKaXdCb1FPcHlhVUUwRnFGY3pY?=
 =?utf-8?B?aC9BTzNGSnNzNEZlR1lONU9NbVNxdENsYWgwYjM0alFOWEoxc05odk5lQ3Zw?=
 =?utf-8?B?VkFvbmFoRTNDZ3dOTUN2MmpJTTZqY1c3V09kV2wxaWdJNFpXZzhzWkpRS204?=
 =?utf-8?B?ZjZjT3Z2TEJJcDVEYWRwRENSV25YYi9Lejl4ZTV6S0hyYTY5dmNLQ3BLVytE?=
 =?utf-8?B?and4K0FzSDBwREI4RUo0dmFuNExrNE5EVkdSdllIa1BTRzlsRUg3Tkw2MS9G?=
 =?utf-8?B?NFdSUkk3RkxNS0hEVjk4TmNFZUpueThxUmYxU3A1eWdUOUZjOFJHQ0hCSm9E?=
 =?utf-8?B?V0xrUVZaa1drRjVBR1VabmdBVVdyc3hnN3lGMmNRTVd5VW4zMGZ6SS9SNWh4?=
 =?utf-8?B?N2VGMVV6NWNUNkUveUNKQi9MUnVqb0FqK2JCNHVmbnJVS0tRYmlDVmR0VWRz?=
 =?utf-8?B?a0JCZGVsZ21NbFFnMS9PNnZmWmdBTE14S09jWFBDSnVkL0RVVXJGczFtVnhN?=
 =?utf-8?B?NWZwMSt6L2wxbU4wcEs0UHZVZFJMa2REMDN0Q3NrbVgxYmd4V0VVUkNjVDNi?=
 =?utf-8?B?Ui9WQ1piUGs0K1BZVG8vRmEwUHFNeUFUVys5UGVVZUEzYUpSbTZiMldrbytm?=
 =?utf-8?B?Z1BaU1hIU1JaNnN0WGNYTWY2SllZbi96Yk92ZUZrSnVRWFRVUlJyYkpveS95?=
 =?utf-8?B?dURvbG8wcEwzVjBwTTlVdS8rR2dKZjNaTUxrRkpoT3oxemJraVFIaThIREJU?=
 =?utf-8?B?cEs2Zmt1S25ZZXo2SDU1QktKQVdJaTR0MkQvWlBDVFFjTk1jenZMMlpsMzRX?=
 =?utf-8?B?TS9OZ3pNRU51ODlVeTZ3NFUrMnFTYVREREQ0RDhhVk42UG1tVlp4dTBTaWdD?=
 =?utf-8?B?Uk9Pd2xLUk5ndGxjbkhIdlh6MkkxR0FrQTZMdE5jQ212LytzekJZQU9tekJV?=
 =?utf-8?Q?VfAhILJ36UmYDD54fttkFD4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlI0YTJYRUo3QTFlQXVkQm0weG5YdWtjMWJDZGNDeVdZM04vUndWbnZQZTdv?=
 =?utf-8?B?NTdYdWEzNFRuU3E3SlBrYnprYmtYdDNUZnp2Ylg2RjNMaXpHUWlnVUJtQUZ0?=
 =?utf-8?B?UnFwSTNvU2tpdm4xMVY3MlIyaG1tMlZUNU5lU0Z3Qit2cTl5TE1PclVJTUMw?=
 =?utf-8?B?bTVuS041YlJJQTY2QWcrSDFoVGNrWjhtbm5ZSER1YWVJaEorNG5lelhkbkF6?=
 =?utf-8?B?SGZNa21jV1EzY1pDTWZvUUF3L1phRmdVQnUvTmordUlHb0hZZW5tY241TWlu?=
 =?utf-8?B?OE9sUCsxQlBIdEpETmNLc0F6ZHh1TXdjMmgxZFhsdkR5aGpMSG9FU3hkeUhD?=
 =?utf-8?B?dGZMS0xOZW9QdWlHMk82ZDRmZStUZ1Q0OGEyVklpMWYwazY4S0VHQzVPeU9t?=
 =?utf-8?B?YXE0K2djVFBpMVFQdEFvajNZUjJEeE1tQmtXOFRWMXMwMzM4TVpUVUZjR2xX?=
 =?utf-8?B?MzR1NXVsNEcrUml1bFpES1VTZ0hidEU0b0xzT3JGbjdnWERZUlh6a0U4TG5K?=
 =?utf-8?B?R3B0dzJZcmk1elYvUURCQ2t5S3ZIK0FNL0FCZzd3LytXSXNGN0pnMUZubDZl?=
 =?utf-8?B?ZlByY0pqSGRwa2g5TUVlWXpoR2dQNzIrYzlTT0xEZnhhTUpMdVJCcS9rSlE3?=
 =?utf-8?B?K25OMjZ4QytoN0xJMTVubWtvdjNuVVVjbTk0RklwNUdSVWVKdGprQkk4aHpu?=
 =?utf-8?B?NmV4NHlETjJ0dGhvc2pHSVFRVzRnbStqRTJvd3dmZm9nMEFJRWwrN1NTbkVw?=
 =?utf-8?B?S0dzVWs0TThsdVcza0NqNDBVK0pvOCs3R3IwRVNrekxkeFlvWE9BZCtCTU1Q?=
 =?utf-8?B?WlRqR1BUMm9rZ3NFUHNqcWpnU3I5TjV3S2RVUmZlVHowVFFNL0NFRTkwRitB?=
 =?utf-8?B?OHFySkJhSnMwYW41eS9ONENsRjBhRXdyOEhrSllJTEJJc2JrT3llUDhLbEp1?=
 =?utf-8?B?UFpPeEY1bmhxcFlTQWhralFRZ2V3RmtNSXE0ekJYcktPaUlzbTJFaU5kcUIv?=
 =?utf-8?B?TDR2R1hmekpGU0U4ekplRTJFN3NIT0ZXVGFkRENpMTFIODBSOGlWWHZDT01w?=
 =?utf-8?B?a3MrV2FBZ3dUaFlwUVJYTFV1T0dqdzNqR1VVL0NaUHNQc29HaFpMcmlPU1dk?=
 =?utf-8?B?allpcC81WGQ1dTNNZE1ZblRvSzJxd3JacEJtdnRMM28wdFVwOVpyRVVnZzVZ?=
 =?utf-8?B?L1doWXhLeXBBQnhIMGNXVTR6ZXNwS0FyMlBQOGMrUVhBV1RRNUFmQ0tDUnl2?=
 =?utf-8?B?c1RFbk9jUzBPNkhPaU1MallaOWdNZm54U3YzZkhQSWpCRmhHYks4WTV1ajFp?=
 =?utf-8?B?MTV4ekdCb3RpekQrdlhJNi8wK0tuRDBmZEdncjN4K1FocFhmOHl5S2J4eVk3?=
 =?utf-8?B?T1FLbEpYbjB3VFIzejlaaDV0WkprYnM4dG9tNHRpWG1Qc3lVbUFKU3lJVkg0?=
 =?utf-8?B?QmJpbnpxRm51Q2YvSkpkM3hDOExOZkVKcTNFNTh6MS9LdTIxSGFuVXpwNEFm?=
 =?utf-8?B?aXFDcDZXQUQ0ZlF4K2tMZmVkSXNzRjFYNzg0clBTVWdZUUU2eE83azkwUGN3?=
 =?utf-8?B?T1AvalBZbmxGS3c5OE85bjdjeUl5SWx4V3dkZ3Y1dnQ3Y1FwMWNZazhjL0M1?=
 =?utf-8?B?elNteWFFZWk3aUk2QlRlSmxiMUpWcDhwUGY0RW5Bc291R2ZQQWF5ajA3T2VB?=
 =?utf-8?B?bHZhbFpvblhkUThUakJYemxQV2FHL1R0TmFmZFFwYVlZTC9FTVRPS0grK2hs?=
 =?utf-8?B?ZGpDUlFidEhHeExsMmJDNDA4NldSdDJlMERFdkhNc0N0REd0SFZsRG93S3Fq?=
 =?utf-8?B?ZFJydlZ5bFpNQ21NWDlSM1dLa05RalhEN2plVjVtdWNoYk5UdDcrU0NZSVN3?=
 =?utf-8?B?UHVpWXJyT0lVdEIzUzZCOWNSK1RtemFZemNWZGhVU0dXWlVISStSRjhTdkFT?=
 =?utf-8?B?eGZ0bklITTRwTkpzNkVvVmR1ZEtUT2k3aGo1cmttMWdWbHB4enlIaFU5bG9P?=
 =?utf-8?B?b2JjcDdUcWZlaGdOWVBoWENPUVhtSlNZT0pNcHNtS2FEVWgyV1ZHUnBJdE95?=
 =?utf-8?B?S1ZkaDRTU1Z3NW56RURoZ3FpZTVpbXVvTzZZWXk5TmRDaDMvbUJEWHJUTk8v?=
 =?utf-8?B?Uy9tK3ZOOWZlTE1tU0JYa2poaFF4a0dkSkVWa3J6bm0wQkJmemZaaEZaZWoy?=
 =?utf-8?B?NlpvdXgwNEVDV2JlOWpYSkg3cHVrUklFbnlZSmxHdTN2WG8xbWcxRDJ6VTN4?=
 =?utf-8?B?ZjNteDBIdS8vMit0ZWNSSWNVekNnMnNXU1JaSlVmZ0ltMWxuOVdGaVZVejhP?=
 =?utf-8?B?R2JoRmZtUlA4YjBXM05CT0F2eXltSGZzdWhWbkhCZlVDSTZMNGtlYUJla2FH?=
 =?utf-8?Q?dk2p6c5tNT2AAoJM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372ae82e-23bd-46db-592f-08de5e70a751
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 13:25:06.9439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3LpUPWXkrm0TtI6k1cUzZZXeYHu+suPTgi/s6QTgbqTXg3GevT+NuXhrenQ+O3QAhp9YRkIcdAKJO9ktQjxjFbj/RWmvNnE9vSUYSwv2rdLvkCrts853BcKupAe9ZtP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
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

SGkgUGlvdHIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUnVkbmlj
a2ksIFBpb3RyIDxwaW90ci5ydWRuaWNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
SmFudWFyeSAyOCwgMjAyNiAxMToxNSBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gQ2M6IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+Ow0KPiBSdWRuaWNraSwgUGlvdHIgPHBpb3RyLnJ1ZG5pY2tpQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYyIDEvMl0gbGliL3hlOiB4ZV9ldWRl
YnVnIC0gQWRkIHBpcGUgdmFsaWRhdGlvbiBhbmQNCj4gY2xlYW51cCBpbXByb3ZlbWVudHMNCg0K
Tml0OiBJJ2Qgc3RpY2sgd2l0aCBjb21taXQgdGl0bGUgaW4gdGhlIGZvbGxvd2luZyBmb3JtYXQ6
DQpsaWIveGVfZXVkZWJ1ZzogQWRkIHBpcGUgdmFsaWRhdGlvbiBhbmQgY2xlYW51cCBpbXByb3Zl
bWVudHMNCg0KT3RoZXJ3aXNlLCBMR1RNLA0KUmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnE
hXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQoNCj4gDQo+IEFk
ZCBwaXBlIHZhbGlkYXRpb24gaW4gcGlwZV9zaWduYWwoKSB0byBwcmV2ZW50IHdyaXRlcyB0byBj
bG9zZWQgcGlwZXMuDQo+IFVwZGF0ZSBwaXBlX2Nsb3NlKCkgdG8gc2V0IGRlc2NyaXB0b3JzIHRv
IC0xIGFmdGVyIGNsb3NpbmcgdG8gZW5zdXJlDQo+IHRoZSBndWFyZCBjb25kaXRpb24gd29ya3Mg
Y29ycmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGlvdHIgUnVkbmlja2kgPHBpb3RyLnJ1
ZG5pY2tpQGludGVsLmNvbT4NCj4gQ2M6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWlu
aWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiBWMSAtPiBWMjogU3BsaXQg
aW50byBzZXBhcmF0ZSBsaWJyYXJ5IGFuZCB0ZXN0IGNvbW1pdHMNCj4gDQo+ICBsaWIveGUveGVf
ZXVkZWJ1Zy5jIHwgMTYgKysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hl
X2V1ZGVidWcuYyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gaW5kZXggMmFiZWU3YmEyLi4yMzg3
Yjc0ZjggMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gKysrIGIvbGliL3hl
L3hlX2V1ZGVidWcuYw0KPiBAQCAtMzA0LDE2ICszMDQsMjIgQEAgc3RhdGljIGludCBzYWZlX3Bp
cGVfcmVhZChpbnQgcGlwZVsyXSwgdm9pZCAqYnVmLCBpbnQNCj4gbmJ5dGVzLCBpbnQgdGltZW91
dF9tcykNCj4gDQo+ICBzdGF0aWMgdm9pZCBwaXBlX3NpZ25hbChpbnQgcGlwZVsyXSwgdWludDY0
X3QgdG9rZW4pDQo+ICB7DQo+IC0JaWd0X2Fzc2VydCh3cml0ZShwaXBlWzFdLCAmdG9rZW4sIHNp
emVvZih0b2tlbikpID09IHNpemVvZih0b2tlbikpOw0KPiArCS8qIFNraXAgc2lnbmFsaW5nIGlm
IHBpcGUgd2FzIGFscmVhZHkgY2xvc2VkICovDQo+ICsJaWYgKHBpcGVbMV0gPj0gMCkNCj4gKwkJ
aWd0X2Fzc2VydCh3cml0ZShwaXBlWzFdLCAmdG9rZW4sIHNpemVvZih0b2tlbikpID09DQo+IHNp
emVvZih0b2tlbikpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIHBpcGVfY2xvc2UoaW50IHBp
cGVbMl0pDQo+ICB7DQo+IC0JaWYgKHBpcGVbMF0gIT0gLTEpDQo+IC0JCWNsb3NlKHBpcGVbMF0p
Ow0KPiArCWlmIChwaXBlWzBdID49IDApIHsNCj4gKwkJaWd0X2Fzc2VydF9lcShjbG9zZShwaXBl
WzBdKSwgMCk7DQo+ICsJCXBpcGVbMF0gPSAtMTsNCj4gKwl9DQo+IA0KPiAtCWlmIChwaXBlWzFd
ICE9IC0xKQ0KPiAtCQljbG9zZShwaXBlWzFdKTsNCj4gKwlpZiAocGlwZVsxXSA+PSAwKSB7DQo+
ICsJCWlndF9hc3NlcnRfZXEoY2xvc2UocGlwZVsxXSksIDApOw0KPiArCQlwaXBlWzFdID0gLTE7
DQo+ICsJfQ0KPiAgfQ0KPiANCj4gICNkZWZpbmUgREVBRF9DTElFTlQgMHhjY2NjZGVhZA0KPiAt
LQ0KPiAyLjQzLjANCg0K

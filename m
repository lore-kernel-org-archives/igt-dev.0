Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5C8D262B0
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 06:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E8D10E6BF;
	Wed, 21 Jan 2026 06:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7QnhSqL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F30E10E6BF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768975978; x=1800511978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=gRVTqAaAW8qAgYzPwCLww9Md0zwlgnCF4DJDSJSxYig=;
 b=h7QnhSqLXg7Yiq2m/vfOAsqXNkA+o+FA5gEGUM28fyLAWwtEGSyHMpnc
 u5X7iWuEutdchqsS7xbtPdsh2A1G003PM20f/VrApaJnmHnH/b3qkZFEe
 7+KXXYA7lC6Ept5fQVmUaiufSybRr/NVuqIuI3NxwWFmsb6j5A/rxqkTl
 GJ6gaAGCHfq3I7LVsfBlukPh7wRtwp9cSBDU9g8T0XQhSDlyiypJS71vV
 vQg/sPD+8kmlIsEFyECOdwqzysGvGwTbR9ffpF1EUkIw/WZbcgAv46ig/
 X03Qm5YDHwrg/GZXTOGFk9mWhxo2Pzgd4GTm2JHk6DdY+g5j0tDdUL45U g==;
X-CSE-ConnectionGUID: v3IDG250QymtAPcyoOA4JA==
X-CSE-MsgGUID: ZIACp7MST0qbQxj0VtM1Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70108274"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208,217";a="70108274"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:12:58 -0800
X-CSE-ConnectionGUID: TwG2KjD9RN6uxJLzhOVpRA==
X-CSE-MsgGUID: MC0EA44qShqY8SYCab9G4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
 d="scan'208,217";a="205983630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:12:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:12:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:12:56 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.29)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:12:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFeEtfenlrjE/r+FRZgyTJgE2Y+ya5MEw2esZuXUoK8aG2vyJLGffDk2vQwIoPUDKAESg/9jcbkXwAg2+dq72w7Ln7uyCUisJqMrw/1uhIpoQcYyDIjc4rs+1ixjud9SXC75vO2YUepc+7llYTsbb2H6xjeOrD62CuQ2bZXWgFpEWOOf54XSe9WA2/AqFFB45+Ks3kgTffPgmvWd4J9O+RAbmXDgae0+7USAYY1uxn9Hxp4gVDZD4pNPQGaCoxpL9yfamsd1HxA6hrB+cBe0Q8ogyFHcZ4nlasWzQvx6RJCJBNzff/4+L3Yfo0odb98rP7MrEiQclos5kHQzGVkvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRVTqAaAW8qAgYzPwCLww9Md0zwlgnCF4DJDSJSxYig=;
 b=m2FChUksC+/beSHLVc93Cyau1ZoWH5gGUPJWyZh2b2TRlOYrGUb2OapR/TDOFvi/AOA3M9e8vLcXWsb5DLpkBIRNV8ROjygjqOHWwQSvOClglsodpAg8UhHWHtViQsol4fQ/vZQprmQyy1FH+uHQbNeelni87WXBz3MXecPnituVoLds+j4ufjJHPvYCUKhueN99ktvoiGY5bPDJxpIOeWw8A94YWVFWdXK6TPbjsizfwq/DS8bqIRYBXA+nPOCL+LfkO7NMHvlT5JqTmBE+r+S3NeeCOHKrFIb+QKsTaSXCmrRlygZnCMY79R7iqxfoyXfhfV4KpH35h7RvQ7gSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:12:49 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:12:49 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v4] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Topic: [PATCH i-g-t v4] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Index: AQHccA4OOaV4+z+X+EO/Tf5KHJl08LVbP2aAgAEaPjM=
Date: Wed, 21 Jan 2026 06:12:49 +0000
Message-ID: <CH0PR11MB54272E13539D3A74542B01D19896A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251218104303.2268868-1-s.sebinraj@intel.com>
 <20260120132159.ptv7yizmtatwh6p3@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260120132159.ptv7yizmtatwh6p3@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DS0PR11MB8717:EE_
x-ms-office365-filtering-correlation-id: 12647557-f428-4c6a-9081-08de58b41aac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?big5?B?R2RXTkZBN21OK1d6enI1RkpUTDhQYmVsVzkyZkdHNFI4dnBwME92dmF0bGdSUFhs?=
 =?big5?B?QjlHMkFqczFoeTcySEhYeWpzVzl4YU04dnhYRDJZUnlqWjRuKzlxei9PMmI0Q0hw?=
 =?big5?B?MmZHdmhvWjJYaExaMWVocjFEc3ZWYVdmR0I2Qzc0dm9WdFVOWUxkdGQ3U3ZzMEhu?=
 =?big5?B?WG5kWnJpTnZBRXI5UVRiRDcrSjhkTnBIamJzaEoxY3NpVTdQRHR1WHhDUzRKZ2pY?=
 =?big5?B?ZWsvL3F4WHhJSDFtQnZsUHRtNS8zRDcrTmp4UE9qaGJvak9DcU9WMjZBbndxK1Jk?=
 =?big5?B?eGdOQzZoRldMVHo5MGQ5VDhNRyt1L3NnWW9oTkVMZlF6Tk1HckJvUW9FekN0ZDMv?=
 =?big5?B?UVdhN3FGWmhzT0YzaUNGUEhTc0VIbkFtWTdFc1ZZZTFpVkt6N3FUYVpqVEphcEtm?=
 =?big5?B?NjhDYzIyUURncXdHWE96T3U1WWJ6RjE2NGFwa0RXelE5SXNSbFBTTzAvVEJaeTVC?=
 =?big5?B?dWZ2bmNyUFE2VGtsSTgwT3k2QmJ3UFVwNkhTVnBGYjM4VVcvSjI2dXBLV1VMM3Nl?=
 =?big5?B?MlFvR2tJUEpVOWJCdnNJNjN4WFk0OE9pdWpRbGM3bFE2YjJXbWlQa3RYRTVDdGR1?=
 =?big5?B?MjI4Y2krMDIvQVJzNXNNWTdheUs4bnJzWVRvZXl3T01kUGltNUwzWmdzUzBtc25B?=
 =?big5?B?bFNURk5VRERGcnZkOHVLQlBZUjJMbkhUSzl1czMyVVZNcnFucGNUZ0hnVEZYOC94?=
 =?big5?B?MVh6RVF3YzNldkJVdzN1QzlsTXkrMHFXU1Bvc3hXRkZuRjNHakI5MmZPNFZTTjJz?=
 =?big5?B?NXFnTlpUWkNOMDg5cjZFSWd5UHQ4QVZPUjM3WXpjb3JVaTJEeG1mUktNcDFTNTEx?=
 =?big5?B?RWdBVjNudmFvWGhKeDc2YjAyWmF4VnVPdXBGOUtMNEZRMzRrTlRsVDYxWnE5UVlF?=
 =?big5?B?a1N3NThjaXRBRFdyc1RFL2dHZ01jVjd2R1ptbCtOaUtvOWRwQzJSeEpJTi93S1BY?=
 =?big5?B?TVNkdmZ6NGdtemlZdTdYY2lWSXZYUGVuVXpjODdtbkpHTTJNbUU0Y0xCL2lQYVlR?=
 =?big5?B?NVF2dmxWOHd2T2pOdGtkUDlSbkJKcis2NFB1TUFDNEpleStwWjdGREZHWmdRSXdY?=
 =?big5?B?U1oxWXZqZ25VclJKMEJaUS9sRnB5NlhiM2Y4ejRZQ1QweW1kbTl6YlRUbEhiZlRF?=
 =?big5?B?S2JVNU05UHIxM0lQWWdDQWNPWC85bFBiTTZHeldjSE0rOE5qam8yVHpHWktNSFVx?=
 =?big5?B?ZkMvVStEK2dQM1lRcTdPTS9ySVpGRUphNEY3RU9iMkhjb0N5dmxIQU5udGFMU2Vq?=
 =?big5?B?a0NTazk3UXloTExWOWxibkhibG5URW5tWDQ4ZmR0YjRaZmFVbUFlOWNFTXBMaGhm?=
 =?big5?B?R3lHRE5aUHRWVXF1T3BVZVFaRVoweHprYTNpS3hDMWN3VEI0Wi9VSWQ0NTBJL2tl?=
 =?big5?B?S2Q5UUVaOExpMnpHNStCQjVkNkNUajJEWjU1WWhDMGRXdlQ0NEJ4MXc0czA3RkNU?=
 =?big5?B?RWlybElNNEJ0SkdqZWUzb0hlVE1Ic2VSVlo4UTgzY0J5SnQ0b3ZaMWxLdkhjbjFs?=
 =?big5?B?ZUNHVFZjaTBzellQWUNnRDJtcm5DOFBiYXN1UjBXUU14aGZFZmZBODFDSkpRS2FL?=
 =?big5?B?UlQ5VVRVQ1JWd3VjSUFuUlI0amtqUXJJMzhzL3BsKzcyM3pMMzNCVzNYN3FMNkE1?=
 =?big5?B?Y3drVGhDWXE5NXF6WE5vMWpFRVVXbWUwMXQxMTRrMHUvR04zOUFJVTVtdC9JdlVX?=
 =?big5?B?R2Vpcm1aSkMzaFhzMzB4dFpUcFJPZWhjRHNZVm8yR0k1T2VNOWtQQmZRTFh1ZEJr?=
 =?big5?B?aEFTOE1DY1RRbnVod3pjUDF0OS9xVXhpZHVYbkFGNWM0U2RDYkVIeDFOZjE4UU96?=
 =?big5?B?TEVjRTNaSkQ2elFFUUpFSGZJN3NFb21sVUZMWXhhZytYUkZQQlRPSndSM3lKTTlD?=
 =?big5?B?Ylora1VSWEtpWjJRMFpVcXU2RUh0cE1MRjBsOUFpVWxkczc3N2hhT0FhcFN6Vm4v?=
 =?big5?B?bEw2QVhrOUNtWGZ6THZ1Z3dCTDRJUTNrODNBQWZ3dWhPWVBja2VHa0dHNFhhK25G?=
 =?big5?B?dUZmVjg4b1hQUmJxbC9DdUNoUkVCdktRUWJaU2N1bTB2RnJzUlZxYU9OeGhTWURo?=
 =?big5?Q?A7t+kNBElu0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?MDVtaStZVjd3RVJQSFUvNmRPbjZDWENSYnpwTnJYaE01YjZaQmRWNkFuQXdvRlh5?=
 =?big5?B?NVBjS1hkN1hSUUFTdnNJNEdNcklnTGU5TVFIVnUrZEhSK1RlKzJaZlM4YmljbFNy?=
 =?big5?B?UGJCekl1U2N3bFBlcTVnM2xoMDRoTmR3eE5UZUpCVy9lS2Z3aEZ1TzNkZ0o1SGhz?=
 =?big5?B?N1dMNi9UQk1ENXNaa1NSb3FIVjIrMkVvUU9ZNmpqKzRNcGNmeDBXZUt5aGhSZEpm?=
 =?big5?B?d3hvN21UZHROSC8weGQ5OGYvaFg1cjBvUEl3U3JFUExWaDAwQ0Q2TUFBY3VoMlpQ?=
 =?big5?B?TGhlWjZVdmk3b3hxcFBTQlpteTBFQ2NTRVlkZlgrOU1kNFBpb2kyZFRNWXNETFMx?=
 =?big5?B?RmRFQXBaSGRZbmloaFF3UmJ3bzhYSUljMVJ3ZEw2Vm9zT01JSEVUWGhMT1V1QXl1?=
 =?big5?B?R1Fnako4cnNDY0YvaEgxQkNVSmExc2lwWjVtZEFMZDJTV3dvZUQzMVVnNFNTMU1Z?=
 =?big5?B?TGxWTmZzNGNIc0FPaU15dHo3cmlqTzV1b1E1MGUzSXRoOWt6eG5OL2ZvbmtJSElk?=
 =?big5?B?d3dQT2pUUWxVdXNHWGJ1RXUxWmx3VmpFaDdKT2YrT3d0MWtlVzdQalIzM241Wmsv?=
 =?big5?B?c1d3dWRrU3lSVjhWUW9mMWR6c3RnT1BrTmNIRWxpODRncEpvUkhSWHFON09oMWZL?=
 =?big5?B?Mko0QU1ybVdYVXcrUUJVVWltdVdwZm1OQzN6Y0VDam8vbXlQVzBDcVdua1UzczZj?=
 =?big5?B?U1cwZzV5SmdEb0MrRUtZUnBNWkZhcGtHTjVtYllheDNxUlBpT3VwR1hXOUx2KzZi?=
 =?big5?B?VitwTER4QXUrWFdOV1hqcFZlREtyalJER200YUZPZXRXbEhQVHdVaXlTYXdlQ2Ir?=
 =?big5?B?ZnAxeXlsWTRrTnYrakRjdXE4T2hxcGdFVkZyc3ZDVDRPdXhSM3NuSWx6WkI5U1Nh?=
 =?big5?B?ZForeTM3OG00MlYxamJQNU12Mk14cDE0dkFqdVc1ZXVCUEtoNmhZR2pOU0JFYWFa?=
 =?big5?B?Z2JIWXJtNVdpcHlmc3BRYzk4YnU5SW4rMWRlcUU0Sm05VGRuazJMQmVwZjR6dGNx?=
 =?big5?B?OUdHRjFZS2xPem5hTnVhWk1wenFvTEhKZjVQdWlyWDhZU0xrRFBmdmRHSHlBSnJ2?=
 =?big5?B?cCtONnYrWFFGaWtURy9iSlpEZkRwUkU4a1V2YmdCcFZlR1FKVXVnMkRTTWh4bEkz?=
 =?big5?B?NFRDeFNDSTZyT0V5NWg3KzgrWUhQZHVyVUJEei9RQ2NPN3ZwZWhaWXFuYnJuUzdl?=
 =?big5?B?ZGh3bHZJOEZpRmpSVFJMTC9ySzJ6SjNZTzh1QzN6Ylk3a1E0SWY2N3U3RXMyV1kz?=
 =?big5?B?TkRURG8zMjl2OFJYTVVxZDJCV1Rsd2pRK2V5K3hVelFxYldPQ1haOXliRFRCS0JJ?=
 =?big5?B?TSt0SFhTRk53cVNObUJwd3B2Y2tiN1k0UVIzdWlaeFFVRFM1ZS9IWElTeUpJcWEy?=
 =?big5?B?U1pDT0dZM0xPWXNsQUNSOWJXVVI5em1GOHE3L0pOZEJKMWhwSWIzVmhDMVZVWm43?=
 =?big5?B?OTJnd2VWTTd5QUlnY3Nwc3pJYjNUNXJOL1ZEZXExSnRQZ1pRZVZZZGVzR0VFUHJ3?=
 =?big5?B?TEVSV09SbDYrbWl3cW9vclFWNXFYMm9veVdVMVA2b2k3V0VrRVA5Wm5samxXZVhQ?=
 =?big5?B?RTRydi80MFFTdlluUEJrQXhsUEdTU3VMWmNXL1FTN1NVZWtKZTZ6U3pleStFR1Bk?=
 =?big5?B?Tm0wU25aUWdwY203dWIxUS9yK1JXM2hTcFdxNmFITGlUU2hjZUhkYThTNXRIaVJQ?=
 =?big5?B?OHBWb3BFc1pURXlZV2pxa1BQa2RuOWRYMURaR291empOcDhnUHZCVDBpNVY3ZVU5?=
 =?big5?B?S3duRWdzY0kzQlJXYm54UldQWEJ1SkRLZDZjSjNaMlZzK1pza0pSKzUydDZUMS9K?=
 =?big5?B?Q3N3dmFTeVZkVEl6L21XaGc2Vm41NmNpSXdoKzdVRk5yb2prcjlYZlZ2ZVZsVmZX?=
 =?big5?B?RENZSkN6S1Z0QnhCWGhVLzB1NGdEdFdpMk92WHliVlRFcE03MUtqMW11cHc4NmFj?=
 =?big5?B?ZTFlSUtBVEVuUmNka2Z0VGp3akExa0o5QWd0MFFaRldrU1ViQ0s2RTF2cVFMZlJG?=
 =?big5?B?aWprMzN2d3JZcDBSRUgyeUhPMDNMUWxic0lDSDltSjErVWR0TXFzcVkyUitJWHpo?=
 =?big5?B?ckJBeFJTSlFnU3dJN2ZyNEV6UFhDUnk3K1ArTkFnd1kwQ3Nock1mZnFVeTRVT2Er?=
 =?big5?Q?whID7BfHM7p02ySe9npHSYzZw03O+nZzfHLr57I3aPfoum51?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54272E13539D3A74542B01D19896ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12647557-f428-4c6a-9081-08de58b41aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 06:12:49.7502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uv2AV/9UDnw+A5gDZOaBOKWTiWcv2mLxf0lNfEDBElOC7PAeQ0MkejFYj/Vh/uEIr+2tvwiEZjqYZkjftG+Vow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

--_000_CH0PR11MB54272E13539D3A74542B01D19896ACH0PR11MB5427namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IEthbWlsIEtvbmll
Y3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NClNlbnQ6IFR1ZXNkYXksIEph
bnVhcnkgMjAsIDIwMjYgNjo1MSBQTQ0KVG86IFNlYmlucmFqLCBTIDxzLnNlYmlucmFqQGludGVs
LmNvbT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8aWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+OyBCYWRyYXBwYW4sIEplZXZha2EgPGplZXZha2EuYmFkcmFwcGFuQGlu
dGVsLmNvbT47IEthcmFzLCBLcnp5c3p0b2YgPGtyenlzenRvZi5rYXJhc0BpbnRlbC5jb20+OyBL
b25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6
IFtQQVRDSCBpLWctdCB2NF0gdG9vbHMvZ3B1dG9wOiBBZGQgR1BVIGZyZXF1ZW5jaWVzIHRvIHRo
ZSBjbGllbnQgaGVhZGVycw0KDQpIaSBTLA0KT24gMjAyNS0xMi0xOCBhdCAxNjoxMzowMyArMDUz
MCwgUyBTZWJpbnJhaiB3cm90ZToNCj4gRW5oYW5jZSBncHV0b3AgdG8gZGlzcGxheSBHUFUgZnJl
cXVlbmN5IGluZm9ybWF0aW9uIChjdXJyZW50L2FjdHVhbCkNCj4gZm9yIGVhY2ggR1QgaW4gdGhl
IGNsaWVudCBoZWFkZXIgbGluZSBhbG9uZ3NpZGUgdGhlIERSTSBtaW5vciBudW1iZXIuDQo+DQo+
IEtleSBjaGFuZ2VzOg0KPiAtIEFkZCBnZXRfZ3RfZnJlcXVlbmNpZXMoKSBmdW5jdGlvbiB0byBy
ZWFkIEdUIGZyZXF1ZW5jeSB2YWx1ZXMNCj4gLSBTdXBwb3J0IGJvdGggaTkxNSBhbmQgWGUgZHJp
dmVycyB1c2luZyBhcHByb3ByaWF0ZSBzeXNmcyBwYXRocw0KPiAtIERpc3BsYXkgZm9ybWF0OiAi
RFJNIG1pbm9yIFggIEZyZXEoY3VyL2FjdCkgR1QwLWZyZXEvZnJlcSBHVDEtZnJlcS9mcmVxIg0K
PiAtIFVzZSBJR1QgQVBJIGZ1bmN0aW9ucyAoeGVfc3lzZnNfZ3RfcGF0aCwgaWd0X3N5c2ZzX2d0
X3BhdGgpIGZvcg0KPiAgIGRyaXZlci1hZ25vc3RpYyBzeXNmcyBhY2Nlc3MNCj4NCj4gVGhlIGZy
ZXF1ZW5jeSBpbmZvcm1hdGlvbiBoZWxwcyB1c2VycyBtb25pdG9yIEdQVSBwZXJmb3JtYW5jZSBz
dGF0ZXMNCj4gaW4gcmVhbC10aW1lIHdoaWxlIG9ic2VydmluZyBjbGllbnQgd29ya2xvYWQgdXRp
bGl6YXRpb24uDQo+DQo+IEV4YW1wbGUgb3V0cHV0Og0KPiAgIERSTSBtaW5vciAwICAgICAgICAg
IEZyZXEoY3VyL2FjdCkgR1QwLTE4MDAvMTgwMCBHVDEtNDAwLzQwMA0KPiAgIERSTSBtaW5vciAx
MjggICAgICAgIEZyZXEoY3VyL2FjdCkgR1QwLTQwMC80MDAgR1QxLTQwMC80MDANCj4NCj4gdjI6
DQo+IC0gVG8gdXNlIG1hY3JvIHRvIHN1ZmZpeCBzdHJpbmdzDQo+IC0gVG8gc2tpcCBmYWlsdXJl
IGxvb3BzDQo+DQo+IHYzOg0KPiAtIFRvIGtlZXAgZXJyb3IgbG9ncw0KPg0KPiB2NDoNCj4gLSBS
ZW1vdmVkIFJGQyBmcm9tIFN1YmplY3QNCj4NCj4gU2lnbmVkLW9mZi1ieTogUyBTZWJpbnJhaiA8
cy5zZWJpbnJhakBpbnRlbC5jb20+DQo+IFRlc3RlZC1ieTogS2FyYXMgS3J6eXN6dG9mIDxrcnp5
c3p0b2Yua2FyYXNAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogS2FyYXMgS3J6eXN6dG9mIDxr
cnp5c3p0b2Yua2FyYXNAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRvb2xzL2dwdXRvcC5jICAgIHwg
MTE5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIHRv
b2xzL21lc29uLmJ1aWxkIHwgICAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDExOSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZ3B1dG9wLmMg
Yi90b29scy9ncHV0b3AuYw0KPiBpbmRleCBmNTc3YTE3NTAuLmQ2YjYxYTU2MyAxMDA2NDQNCj4g
LS0tIGEvdG9vbHMvZ3B1dG9wLmMNCj4gKysrIGIvdG9vbHMvZ3B1dG9wLmMNCj4gQEAgLTMwLDEz
ICszMCwyMCBAQA0KPiAgI2luY2x1ZGUgImlndF9kcm1fY2xpZW50cy5oIg0KPiAgI2luY2x1ZGUg
ImlndF9kcm1fZmRpbmZvLmgiDQo+ICAjaW5jbHVkZSAiaWd0X3Byb2ZpbGluZy5oIg0KPiArI2lu
Y2x1ZGUgImlndF9zeXNmcy5oIg0KPiAgI2luY2x1ZGUgImRybXRlc3QuaCINCj4gKyNpbmNsdWRl
ICJ4ZS94ZV9ndC5oIg0KDQo+IFRoaXMgYWRkIGEgbG90IG9mIGRlcGVuZGVuY2llcyB0byBhIHRv
b2wsIGJlZm9yZSB5b3VyIGNoYW5nZToNCg0KbGRkIGJ1aWxkL3Rvb2xzL2dwdXRvcCB8d2MgLWwN
CjUNCg0KPmFmdGVyIGl0Og0KDQpsZGQgYnVpbGQvdG9vbHMvZ3B1dG9wIHx3YyAtbA0KNzgNCg0K
PlBsZWFzZSBtYWtlIGl0IHdpdGhvdXQgbmVlZCBmb3IgbGlua2luZyBhbGwgdGVzdCBsaWJzLg0K
DQo+UmVnYXJkcywNCkthbWlsDQoNClN1cmUsIEknbGwgY2hlY2sgdGhlc2Ugb3V0LCBUaGFua3Mg
Zm9yIHBvaW50aW5nIG91dC4NCg0KPg0KPiAgZW51bSB1dGlsaXphdGlvbl90eXBlIHsNCj4gICAg
ICAgIFVUSUxJWkFUSU9OX1RZUEVfRU5HSU5FX1RJTUUsDQo+ICAgICAgICBVVElMSVpBVElPTl9U
WVBFX1RPVEFMX0NZQ0xFUywNCj4gIH07DQo+DQo+ICsjZGVmaW5lIFhFX0ZSRVFfQ1VSX1NVRkZJ
WCAiL2ZyZXEwL2N1cl9mcmVxIg0KPiArI2RlZmluZSBYRV9GUkVRX0FDVF9TVUZGSVggIi9mcmVx
MC9hY3RfZnJlcSINCj4gKyNkZWZpbmUgSTkxNV9GUkVRX0NVUl9TVUZGSVggIi9ycHNfY3VyX2Zy
ZXFfbWh6Ig0KPiArI2RlZmluZSBJOTE1X0ZSRVFfQUNUX1NVRkZJWCAiL3Jwc19hY3RfZnJlcV9t
aHoiDQo+ICsNCj4gIHN0YXRpYyBjb25zdCBjaGFyICpiYXJzW10gPSB7ICIgIiwgIqJqIiwgIqJr
IiwgIqJsIiwgIqJtIiwgIqJuIiwgIqJvIiwgIqJwIiwgIqJpIiB9Ow0KPg0KPiAgI2RlZmluZSBB
TlNJX0hFQURFUiAiXDAzM1s3bSINCj4gQEAgLTc2LDE3ICs4MywxMjcgQEAgc3RhdGljIHZvaWQg
cHJpbnRfcGVyY2VudGFnZV9iYXIoZG91YmxlIHBlcmNlbnQsIGludCBtYXhfbGVuKQ0KPiAgICAg
ICAgcHV0Y2hhcignfCcpOw0KPiAgfQ0KPg0KPiArc3RhdGljIGNoYXIgKmdldF9ndF9mcmVxdWVu
Y2llcyh2b2lkKQ0KPiArew0KPiArICAgICBjaGFyIGZyZXFfc3RyWzUxMl0gPSAiIjsNCj4gKyAg
ICAgY2hhciBndF9pbmZvWzY0XTsNCj4gKyAgICAgaW50IGZkID0gLTE7DQo+ICsgICAgIGludCBu
dW1fZ3RzID0gMDsNCj4gKyAgICAgaW50IGd0Ow0KPiArICAgICBib29sIGlzX3hlID0gZmFsc2U7
DQo+ICsgICAgIGJvb2wgZmlyc3QgPSB0cnVlOw0KPiArDQo+ICsgICAgIGZkID0gX19kcm1fb3Bl
bl9kcml2ZXIoRFJJVkVSX0lOVEVMIHwgRFJJVkVSX1hFKTsNCj4gKyAgICAgaWYgKGZkIDwgMCkg
ew0KPiArICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIG9wZW4gRFJNIGRl
dmljZVxuIik7DQo+ICsgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ICsgICAgIH0NCj4gKw0K
PiArICAgICAvKiBEZXRlY3QgZHJpdmVyIHR5cGUgYW5kIGdldCBHVCBjb3VudCAqLw0KPiArICAg
ICBpc194ZSA9IGlzX3hlX2RldmljZShmZCk7DQo+ICsgICAgIGlmIChpc194ZSkNCj4gKyAgICAg
ICAgICAgICBudW1fZ3RzID0geGVfbnVtYmVyX2d0KGZkKTsNCj4gKyAgICAgZWxzZQ0KPiArICAg
ICAgICAgICAgIG51bV9ndHMgPSBpZ3Rfc3lzZnNfZ2V0X251bV9ndChmZCk7DQo+ICsNCj4gKyAg
ICAgaWYgKG51bV9ndHMgPD0gMCkgew0KPiArICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAi
RmFpbGVkIHRvIGdldCBHVCBjb3VudFxuIik7DQo+ICsgICAgICAgICAgICAgY2xvc2UoZmQpOw0K
PiArICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiArICAgICB9DQo+ICsNCj4gKyAgICAgLyog
UmVhZCBmcmVxdWVuY2llcyBmb3IgZWFjaCBHVCAqLw0KPiArICAgICBmb3IgKGd0ID0gMDsgZ3Qg
PCBudW1fZ3RzOyBndCsrKSB7DQo+ICsgICAgICAgICAgICAgY2hhciBndF9wYXRoWzk2XTsNCj4g
KyAgICAgICAgICAgICBjaGFyIGZyZXFfcGF0aFsxMjhdOw0KPiArICAgICAgICAgICAgIGNoYXIg
ZnJlcV9idWZbMzJdOw0KPiArICAgICAgICAgICAgIGNoYXIgKnBhdGhfcHRyOw0KPiArICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBjdXJfZnJlcSA9IDAsIGFjdF9mcmVxID0gMDsNCj4gKyAgICAg
ICAgICAgICBGSUxFICpmcDsNCj4gKw0KPiArICAgICAgICAgICAgIC8qIEdldCBHVC1zcGVjaWZp
YyBzeXNmcyBwYXRoICovDQo+ICsgICAgICAgICAgICAgaWYgKGlzX3hlKQ0KPiArICAgICAgICAg
ICAgICAgICAgICAgcGF0aF9wdHIgPSB4ZV9zeXNmc19ndF9wYXRoKGZkLCBndCwgZ3RfcGF0aCwg
c2l6ZW9mKGd0X3BhdGgpKTsNCj4gKyAgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAg
ICAgICAgICBwYXRoX3B0ciA9IGlndF9zeXNmc19ndF9wYXRoKGZkLCBndCwgZ3RfcGF0aCwgc2l6
ZW9mKGd0X3BhdGgpKTsNCj4gKw0KPiArICAgICAgICAgICAgIGlmICghcGF0aF9wdHIpIHsNCj4g
KyAgICAgICAgICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIGdldCBzeXNm
cyBwYXRoIGZvciBHVCVkXG4iLCBndCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsNCj4gKyAgICAgICAgICAgICB9DQo+ICsNCj4gKyAgICAgICAgICAgICAvKiBSZWFkIGN1cnJl
bnQvcmVxdWVzdGVkIGZyZXF1ZW5jeSAqLw0KPiArICAgICAgICAgICAgIGlmIChpc194ZSkNCj4g
KyAgICAgICAgICAgICAgICAgICAgIHNucHJpbnRmKGZyZXFfcGF0aCwgc2l6ZW9mKGZyZXFfcGF0
aCksICIlcyVzIiwgZ3RfcGF0aCwgWEVfRlJFUV9DVVJfU1VGRklYKTsNCj4gKyAgICAgICAgICAg
ICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICBzbnByaW50ZihmcmVxX3BhdGgsIHNpemVv
ZihmcmVxX3BhdGgpLCAiJXMlcyIsIGd0X3BhdGgsIEk5MTVfRlJFUV9DVVJfU1VGRklYKTsNCj4g
Kw0KPiArICAgICAgICAgICAgIGZwID0gZm9wZW4oZnJlcV9wYXRoLCAiciIpOw0KPiArICAgICAg
ICAgICAgIGlmIChmcCkgew0KPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGZnZXRzKGZyZXFf
YnVmLCBzaXplb2YoZnJlcV9idWYpLCBmcCkpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGN1cl9mcmVxID0gYXRvaShmcmVxX2J1Zik7DQo+ICsgICAgICAgICAgICAgICAgICAgICBm
Y2xvc2UoZnApOw0KPiArICAgICAgICAgICAgIH0gZWxzZSB7DQo+ICsgICAgICAgICAgICAgICAg
ICAgICBmcHJpbnRmKHN0ZGVyciwgIkZhaWxlZCB0byBvcGVuICVzXG4iLCBmcmVxX3BhdGgpOw0K
PiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ICsgICAgICAgICAgICAgfQ0KPiAr
DQo+ICsgICAgICAgICAgICAgLyogUmVhZCBhY3R1YWwgZnJlcXVlbmN5ICovDQo+ICsgICAgICAg
ICAgICAgaWYgKGlzX3hlKQ0KPiArICAgICAgICAgICAgICAgICAgICAgc25wcmludGYoZnJlcV9w
YXRoLCBzaXplb2YoZnJlcV9wYXRoKSwgIiVzJXMiLCBndF9wYXRoLCBYRV9GUkVRX0FDVF9TVUZG
SVgpOw0KPiArICAgICAgICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgICAgICAgIHNucHJp
bnRmKGZyZXFfcGF0aCwgc2l6ZW9mKGZyZXFfcGF0aCksICIlcyVzIiwgZ3RfcGF0aCwgSTkxNV9G
UkVRX0FDVF9TVUZGSVgpOw0KPiArDQo+ICsgICAgICAgICAgICAgZnAgPSBmb3BlbihmcmVxX3Bh
dGgsICJyIik7DQo+ICsgICAgICAgICAgICAgaWYgKGZwKSB7DQo+ICsgICAgICAgICAgICAgICAg
ICAgICBpZiAoZmdldHMoZnJlcV9idWYsIHNpemVvZihmcmVxX2J1ZiksIGZwKSkNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYWN0X2ZyZXEgPSBhdG9pKGZyZXFfYnVmKTsNCj4gKyAg
ICAgICAgICAgICAgICAgICAgIGZjbG9zZShmcCk7DQo+ICsgICAgICAgICAgICAgfSBlbHNlIHsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIG9wZW4g
JXNcbiIsIGZyZXFfcGF0aCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4g
KyAgICAgICAgICAgICB9DQo+ICsNCj4gKyAgICAgICAgICAgICAvKiBBcHBlbmQgdG8gZnJlcXVl
bmN5IHN0cmluZyAqLw0KPiArICAgICAgICAgICAgIGlmICghZmlyc3QpDQo+ICsgICAgICAgICAg
ICAgICAgICAgICBzdHJjYXQoZnJlcV9zdHIsICIgIik7DQo+ICsgICAgICAgICAgICAgZWxzZQ0K
PiArICAgICAgICAgICAgICAgICAgICAgZmlyc3QgPSBmYWxzZTsNCj4gKw0KPiArICAgICAgICAg
ICAgIHNucHJpbnRmKGd0X2luZm8sIHNpemVvZihndF9pbmZvKSwgIkdUJWQtJXUvJXUiLCBndCwg
Y3VyX2ZyZXEsIGFjdF9mcmVxKTsNCj4gKyAgICAgICAgICAgICBzdHJjYXQoZnJlcV9zdHIsIGd0
X2luZm8pOw0KPiArICAgICB9DQo+ICsNCj4gKyAgICAgY2xvc2UoZmQpOw0KPiArDQo+ICsgICAg
IGlmIChzdHJsZW4oZnJlcV9zdHIpID4gMCkNCj4gKyAgICAgICAgICAgICByZXR1cm4gc3RyZHVw
KGZyZXFfc3RyKTsNCj4gKw0KPiArICAgICByZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KPiAgc3Rh
dGljIGludA0KPiAgcHJpbnRfY2xpZW50X2hlYWRlcihzdHJ1Y3QgaWd0X2RybV9jbGllbnQgKmMs
IGludCBsaW5lcywgaW50IGNvbl93LCBpbnQgY29uX2gsDQo+ICAgICAgICAgICAgICAgICAgICBp
bnQgKmVuZ2luZV93KQ0KPiAgew0KPiAgICAgICAgaW50IHJldCwgbGVuOw0KPiArICAgICBjaGFy
ICpmcmVxX2luZm8gPSBOVUxMOw0KPg0KPiAgICAgICAgaWYgKGxpbmVzKysgPj0gY29uX2gpDQo+
ICAgICAgICAgICAgICAgIHJldHVybiBsaW5lczsNCj4NCj4gICAgICAgIHByaW50ZihBTlNJX0hF
QURFUik7DQo+IC0gICAgIHJldCA9IHByaW50ZigiRFJNIG1pbm9yICV1IiwgYy0+ZHJtX21pbm9y
KTsNCj4gKw0KPiArICAgICAvKiBHZXQgZnJlcXVlbmN5IGluZm9ybWF0aW9uICovDQo+ICsgICAg
IGZyZXFfaW5mbyA9IGdldF9ndF9mcmVxdWVuY2llcygpOw0KPiArDQo+ICsgICAgIGlmIChmcmVx
X2luZm8pIHsNCj4gKyAgICAgICAgICAgICByZXQgPSBwcmludGYoIkRSTSBtaW5vciAldSAgICAg
ICAgICBGcmVxKGN1ci9hY3QpICVzIiwgYy0+ZHJtX21pbm9yLCBmcmVxX2luZm8pOw0KPiArICAg
ICAgICAgICAgIGZyZWUoZnJlcV9pbmZvKTsNCj4gKyAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAg
ICAgICByZXQgPSBwcmludGYoIkRSTSBtaW5vciAldSIsIGMtPmRybV9taW5vcik7DQo+ICsgICAg
IH0NCj4gKw0KPiAgICAgICAgbl9zcGFjZXMoY29uX3cgLSByZXQpOw0KPg0KPiAgICAgICAgaWYg
KGxpbmVzKysgPj0gY29uX2gpDQo+IGRpZmYgLS1naXQgYS90b29scy9tZXNvbi5idWlsZCBiL3Rv
b2xzL21lc29uLmJ1aWxkDQo+IGluZGV4IDgxODViYTE2MC4uZDMyNjFkNDI5IDEwMDY0NA0KPiAt
LS0gYS90b29scy9tZXNvbi5idWlsZA0KPiArKysgYi90b29scy9tZXNvbi5idWlsZA0KPiBAQCAt
NzMsNyArNzMsNyBAQCBlbmRpZg0KPiAgZXhlY3V0YWJsZSgnZ3B1dG9wJywgJ2dwdXRvcC5jJywN
Cj4gICAgICAgICAgICAgaW5zdGFsbCA6IHRydWUsDQo+ICAgICAgICAgICAgIGluc3RhbGxfcnBh
dGggOiBiaW5kaXJfcnBhdGhkaXIsDQo+IC0gICAgICAgICAgIGRlcGVuZGVuY2llcyA6IFtsaWJf
aWd0X2RybV9jbGllbnRzLGxpYl9pZ3RfZHJtX2ZkaW5mbyxsaWJfaWd0X3Byb2ZpbGluZyxtYXRo
XSkNCj4gKyAgICAgICAgICAgZGVwZW5kZW5jaWVzIDogW2xpYl9pZ3RfZHJtX2NsaWVudHMsbGli
X2lndF9kcm1fZmRpbmZvLGxpYl9pZ3RfcHJvZmlsaW5nLHRvb2xfZGVwcyxtYXRoXSkNCj4NCj4g
IGludGVsX2wzX3Bhcml0eV9zcmMgPSBbICdpbnRlbF9sM19wYXJpdHkuYycsICdpbnRlbF9sM191
ZGV2X2xpc3RlbmVyLmMnIF0NCj4gIGV4ZWN1dGFibGUoJ2ludGVsX2wzX3Bhcml0eScsIHNvdXJj
ZXMgOiBpbnRlbF9sM19wYXJpdHlfc3JjLA0KPiAtLQ0KPiAyLjQzLjANCj4NCg==

--_000_CH0PR11MB54272E13539D3A74542B01D19896ACH0PR11MB5427namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Tuesday, January 20, 2026 6:51 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel.com&gt;; Karas, Kr=
zysztof &lt;krzysztof.karas@intel.com&gt;; Konieczny, Kamil &lt;kamil.konie=
czny@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v4] tools/gputop: Add GPU frequencies=
 to the client headers
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S,<br>
On 2025-12-18 at 16:13:03 +0530, S Sebinraj wrote:<br>
&gt; Enhance gputop to display GPU frequency information (current/actual)<b=
r>
&gt; for each GT in the client header line alongside the DRM minor number.<=
br>
&gt;<br>
&gt; Key changes:<br>
&gt; - Add get_gt_frequencies() function to read GT frequency values<br>
&gt; - Support both i915 and Xe drivers using appropriate sysfs paths<br>
&gt; - Display format: &quot;DRM minor X&nbsp; Freq(cur/act) GT0-freq/freq =
GT1-freq/freq&quot;<br>
&gt; - Use IGT API functions (xe_sysfs_gt_path, igt_sysfs_gt_path) for<br>
&gt;&nbsp;&nbsp; driver-agnostic sysfs access<br>
&gt;<br>
&gt; The frequency information helps users monitor GPU performance states<b=
r>
&gt; in real-time while observing client workload utilization.<br>
&gt;<br>
&gt; Example output:<br>
&gt;&nbsp;&nbsp; DRM minor 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Freq(cur/act) GT0-1800/1800 GT1-400/400<br>
&gt;&nbsp;&nbsp; DRM minor 128&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fr=
eq(cur/act) GT0-400/400 GT1-400/400<br>
&gt;<br>
&gt; v2:<br>
&gt; - To use macro to suffix strings<br>
&gt; - To skip failure loops<br>
&gt;<br>
&gt; v3:<br>
&gt; - To keep error logs<br>
&gt;<br>
&gt; v4:<br>
&gt; - Removed RFC from Subject<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; Tested-by: Karas Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
&gt; Reviewed-by: Karas Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tools/gputop.c&nbsp;&nbsp;&nbsp; | 119 +++++++++++++++++++++++++=
++++++++++++++++++++-<br>
&gt;&nbsp; tools/meson.build |&nbsp;&nbsp; 2 +-<br>
&gt;&nbsp; 2 files changed, 119 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/gputop.c b/tools/gputop.c<br>
&gt; index f577a1750..d6b61a563 100644<br>
&gt; --- a/tools/gputop.c<br>
&gt; +++ b/tools/gputop.c<br>
&gt; @@ -30,13 +30,20 @@<br>
&gt;&nbsp; #include &quot;igt_drm_clients.h&quot;<br>
&gt;&nbsp; #include &quot;igt_drm_fdinfo.h&quot;<br>
&gt;&nbsp; #include &quot;igt_profiling.h&quot;<br>
&gt; +#include &quot;igt_sysfs.h&quot;<br>
&gt;&nbsp; #include &quot;drmtest.h&quot;<br>
&gt; +#include &quot;xe/xe_gt.h&quot;<br>
<br>
&gt; This add a lot of dependencies to a tool, before your change:<br>
<br>
ldd build/tools/gputop |wc -l<br>
5<br>
<br>
&gt;after it:<br>
<br>
ldd build/tools/gputop |wc -l<br>
78<br>
<br>
&gt;Please make it without need for linking all test libs.<br>
<br>
&gt;Regards,<br>
Kamil<br>
<br>
Sure, I'll check these out, Thanks for pointing out.<br>
<br>
&gt;&nbsp;<br>
&gt;&nbsp; enum utilization_type {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_ENGINE_TIME=
,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_TOTAL_CYCLE=
S,<br>
&gt;&nbsp; };<br>
&gt;&nbsp;<br>
&gt; +#define XE_FREQ_CUR_SUFFIX &quot;/freq0/cur_freq&quot;<br>
&gt; +#define XE_FREQ_ACT_SUFFIX &quot;/freq0/act_freq&quot;<br>
&gt; +#define I915_FREQ_CUR_SUFFIX &quot;/rps_cur_freq_mhz&quot;<br>
&gt; +#define I915_FREQ_ACT_SUFFIX &quot;/rps_act_freq_mhz&quot;<br>
&gt; +<br>
&gt;&nbsp; static const char *bars[] =3D { &quot; &quot;, &quot;=A2j&quot;,=
 &quot;=A2k&quot;, &quot;=A2l&quot;, &quot;=A2m&quot;, &quot;=A2n&quot;, &q=
uot;=A2o&quot;, &quot;=A2p&quot;, &quot;=A2i&quot; };<br>
&gt;&nbsp;<br>
&gt;&nbsp; #define ANSI_HEADER &quot;\033[7m&quot;<br>
&gt; @@ -76,17 +83,127 @@ static void print_percentage_bar(double percent, =
int max_len)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; putchar('|');<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +static char *get_gt_frequencies(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char freq_str[512] =3D &quot;&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char gt_info[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fd =3D -1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_gts =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool is_xe =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool first =3D true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fd =3D __drm_open_driver(DRIVER_INTEL | DRIV=
ER_XE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Failed to open DRM device\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Detect driver type and get GT count */<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; is_xe =3D is_xe_device(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; num_gts =3D xe_number_gt(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; num_gts =3D igt_sysfs_get_num_gt(fd);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (num_gts &lt;=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Failed to get GT count\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read frequencies for each GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (gt =3D 0; gt &lt; num_gts; gt++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char gt_path[96];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char freq_path[128];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char freq_buf[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char *path_ptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; unsigned int cur_freq =3D 0, act_freq =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; FILE *fp;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Get GT-specific sysfs path */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path_ptr =3D xe_sysfs_g=
t_path(fd, gt, gt_path, sizeof(gt_path));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path_ptr =3D igt_sysfs_=
gt_path(fd, gt, gt_path, sizeof(gt_path));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!path_ptr) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;F=
ailed to get sysfs path for GT%d\n&quot;, gt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read current/requested frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path), &quot;%s%s&quot;, gt_path, XE_FREQ_CUR_SUFFIX);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path), &quot;%s%s&quot;, gt_path, I915_FREQ_CUR_SUFFIX);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fp =3D fopen(freq_path, &quot;r&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (fp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fgets(freq_buf, siz=
eof(freq_buf), fp))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; cur_freq =3D atoi(freq_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose(fp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;F=
ailed to open %s\n&quot;, freq_path);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read actual frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path), &quot;%s%s&quot;, gt_path, XE_FREQ_ACT_SUFFIX);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path), &quot;%s%s&quot;, gt_path, I915_FREQ_ACT_SUFFIX);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fp =3D fopen(freq_path, &quot;r&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (fp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fgets(freq_buf, siz=
eof(freq_buf), fp))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; act_freq =3D atoi(freq_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose(fp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;F=
ailed to open %s\n&quot;, freq_path);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Append to frequency string */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!first)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcat(freq_str, &quot;=
 &quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; snprintf(gt_info, sizeof(gt_info), &quot;GT%d-%u/%u&quot;, gt, cur_freq=
, act_freq);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; strcat(freq_str, gt_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (strlen(freq_str) &gt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return strdup(freq_str);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static int<br>
&gt;&nbsp; print_client_header(struct igt_drm_client *c, int lines, int con=
_w, int con_h,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *engine_w)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, len;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *freq_info =3D NULL;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return lines;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(ANSI_HEADER);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D printf(&quot;DRM minor %u&quot;, c-&=
gt;drm_minor);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get frequency information */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; freq_info =3D get_gt_frequencies();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; Freq(cur/act) %s&quot;, c-&gt;drm_minor, freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; free(freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&quot;, c-&gt;drm_minor);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_spaces(con_w - ret);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt; diff --git a/tools/meson.build b/tools/meson.build<br>
&gt; index 8185ba160..d3261d429 100644<br>
&gt; --- a/tools/meson.build<br>
&gt; +++ b/tools/meson.build<br>
&gt; @@ -73,7 +73,7 @@ endif<br>
&gt;&nbsp; executable('gputop', 'gputop.c',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; install : true,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; install_rpath : bindir_rpathdir,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dependen=
cies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dependen=
cies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,tool_deps,=
math])<br>
&gt;&nbsp;<br>
&gt;&nbsp; intel_l3_parity_src =3D [ 'intel_l3_parity.c', 'intel_l3_udev_li=
stener.c' ]<br>
&gt;&nbsp; executable('intel_l3_parity', sources : intel_l3_parity_src,<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB54272E13539D3A74542B01D19896ACH0PR11MB5427namp_--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B4ACAC5B8
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 07:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBFC10E326;
	Mon,  6 Oct 2025 07:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahHM+wnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2510E326
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759737362; x=1791273362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6LZ2n89E99Y93sDfN1MNrQFdgCrk1yncYmcFgNxIicA=;
 b=ahHM+wnJurJuzCoe+p9ZNWSQxl9B12UeFXVVM9HWZVlXhB9T3FarD+X3
 5V+rCYctOAM++t8agZ/cgs0toPoNYvJhOE5NBBBHZPetsbfd4csGPyawX
 U9QFEr+USWBSRPDus6Qe520uMeh5OiqEhdmYRGBjxsHm5euPplchC+8t/
 ftExMXJIXhxBdJyDYRTBD29/LfmDl0cqeKZ86StPhhZEdy/U5XihlmhTe
 CDygzJ5Z5XEAEt9Srr/k9Kk8qqbgg1nsAp3VdF37Jlv/FBKfGM5i4bp1K
 DbjSrb7fzHAHz8VQ5ohyCY3fJJySqw3em+fpUBm4meXA/TYhryRa2mL4t A==;
X-CSE-ConnectionGUID: 2/27ryZiTKqX6V/bDUL1rQ==
X-CSE-MsgGUID: TJAK4854RSmzO0ehnj/qUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73262896"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73262896"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:56:01 -0700
X-CSE-ConnectionGUID: L0kC+hI+Sy2kiw55XRXquQ==
X-CSE-MsgGUID: DM0LAY5ETlKHwXu8F56tRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179854593"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:56:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:56:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 00:56:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:56:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfojzLuBfP0xKEa3tSmOPj+19tQwWGBFP1Sshmx+gGP9uSvrBUoVPXyGkw3N1LQkUI/8iUrqAM8uyq87VBeYcjYAmOUwqX9VGtlgLz8s3zJ54CRrT3hHGx+Prbrxrq75SVKW+SjZEKnLVOuoOqs1Co9vyWaBAOwVcU1m/695A6jQj0nLY5fI/oOAEuhFTjOVDbvRb8l+hC/ECgRw9V+EkZC2PLRTi1g+76BruDTd5P+O3qLYG6cliw+bhQtqhsDUUpHMBuEIoxWAh/c5SQkg371vRa19u65t4blqwP9vThwDPsv+p8yLA+o4snLGY7A6rKazXxEa6kQKoLST8LM+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LZ2n89E99Y93sDfN1MNrQFdgCrk1yncYmcFgNxIicA=;
 b=PEjrL1xFqOWH4xONrlNBU/Fl7BN/KrfKv2xtBr7qIJYg9x1WtrIqOdML7IJeEdV4f8mrAUrY1CHjJ9PC81z9K/2WnShD+cEOglgxZpWxZx6h2mvOv8vW22tCGEI9JdUYUSXc3E6/ZEEAenf/2mXqHb91zlMfqHc8kODAoYHfL0QfqLOMCVa/uJV3VwG8SNKupdac2izEd/4o6SwENl/40qG2KpEQGIh7uvkZcFZZ5QqxO6edbQzlXCh1MyHvAdVovNsL+BBaxQ8RJJx5I9b5p2TwKldhH5Hm+hMDBJkUg2x8CjvHJ+ksh6LrBXKtdUNc9bcyM4Fznj/kusP+rXdgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Mon, 6 Oct 2025 07:55:58 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 07:55:58 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH v4 i-g-t 3/6] benchmarks/intel_latency: Add xe_vm latency
 test
Thread-Topic: [PATCH v4 i-g-t 3/6] benchmarks/intel_latency: Add xe_vm latency
 test
Thread-Index: AQHcJ9R/ZP3wNeCSPUqQbw789Md26LS03WqA
Date: Mon, 6 Oct 2025 07:55:58 +0000
Message-ID: <CH3PR11MB8434FF1EADF853FFA93A85518DE3A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
 <20250917131003.71762-11-gajendra.uttamchand@intel.com>
In-Reply-To: <20250917131003.71762-11-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7735:EE_
x-ms-office365-filtering-correlation-id: 39307c96-4922-47fc-7dc7-08de04adc953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SmFacVg1ekhidjhFeHpZMWlGR05yVU01KysvYnRnVjFoMTBSdW1Pbk1XRjdm?=
 =?utf-8?B?WkFUVjhjVEtLWXF2aFJxbFhwRjJ5NVBhWjRsckdzeU9GM3ZVbk0zRU5LUnlW?=
 =?utf-8?B?cmordGVUTXljaUYrQmltZ1FwR1laZzZGMklTTzVYc1BJUGNyUVJpMHoyaUgx?=
 =?utf-8?B?Q0xrSzJ5RGFqS05KaURsOXUzUHdXZ1ZVN0N4MHhqd1pZUnBTTWp2Q3hkb0Ir?=
 =?utf-8?B?MjBXeTg3STlCY3BUeXM4R1lEYkkvWG1RUklEbGM0bElGZ1pJV2JwWlM3UmMv?=
 =?utf-8?B?Vm81RFJuZFNTT01uUzJSSnUyWHZRQSsyVVFrYmNxd0lJOVdqQitId1Zrc01s?=
 =?utf-8?B?cHRVY0lxWkxlUDlmR0ZZcGpjQllESlY0bWs3MWJqbnFvNWtLVzIzQU84TVF3?=
 =?utf-8?B?NjFJRVljZE1mdmJCL2NHdktKL05HaExRQnovcjgzaGVrTHoyTlAvMG9NbzVw?=
 =?utf-8?B?TGl0c1ltUVFWOVhhQit0aHNuK2dlNXg4dCtrbVZEZmpzRzJlb0tteU9SNmwv?=
 =?utf-8?B?SzR1QVU2U3ptbklFREQ5bENwL1ptbis1VjRoaU1pRkNQSDl6WXJCZTROWVk5?=
 =?utf-8?B?VklXM0xySVVPVTN1TjlraW1nWEZPd055WENBaXhJK2dOMVlaTVFqdVJEcjJz?=
 =?utf-8?B?bkRINVJpelVGMjNiVmc4YTJtMlhJV0lOdHZabU9uYVlzVXRVTjVsNTg0RFlv?=
 =?utf-8?B?Rmxuc0pIKzV5Mkw2bURGMXFnb0I5VTVwQXZtWUZjR0Zqbkx4c3ZTMER5djhG?=
 =?utf-8?B?SG0rUUpiMyt0NGYydk12bmhtdFFHQUVmbkJCczk2cEQ5anhtTUYyQmgvM2FF?=
 =?utf-8?B?bjA5MHJKQjhSWDNtRGtOTWVNanMzakgva1RKc3cxNU91RERBd09zRG50Qnlm?=
 =?utf-8?B?d3k4dm1GdURiUmVMMWpxVjhQWjlwcml2R04rcldSeGNmUHZOYWVVVUIweFdV?=
 =?utf-8?B?YSsrYmR1c0xOd3ZOcTd6eWpmS1FMbGdnWFpweEdyUDAybDN2c1VJb0ttcUR0?=
 =?utf-8?B?VnhDQy96N1o5dHBCTG1INXhleFdsNjE0L0l6ZVd4QW9UNXdiKy9hb2dxQ0x5?=
 =?utf-8?B?c1Z1VGlhSjk0SVFzUHpXTVBERHdva21pL0J1ZWgwMVpnOFRVVG1zd1FGSHFt?=
 =?utf-8?B?QVZmMkhkR2lRUXhjVCszc2Y4eEllVEQ2NmdMOUxJdmUrbEphRElFODdtekF1?=
 =?utf-8?B?Q0ZSUVVjWFg3YkNReGhKTG4rVHlWZkYwRVdOOFVycUZNb3ZRNDNuTFlKTGFT?=
 =?utf-8?B?WU1ZT3FPTUtlbUlDYnhLeG95MjlXSGpEZ2taMXdOS3hscUxud1RuQUpkV1dN?=
 =?utf-8?B?Vy9CQit4S3QyN3ozMGRqR1BMY1A4Z1VLMG1tNHgrZ1d0SUVWeWtJb3Rub2lu?=
 =?utf-8?B?eFlXTUdtajR2bzFtYlA3T0w5c0dQUkUxOXNJcm9ZdXJCVjRwcVpBZ0JRRlJy?=
 =?utf-8?B?ZVFUWW1mbDR3OFd6YlJGOHdzMlQyQWtpYjVrb2NpOVlFaEJFTzlmZVRGVXIx?=
 =?utf-8?B?OEhQQUhiT2JNT3AycTVLcVlGZXVxUm85VWVHZVFxR3d2MXppMWlDekFQVHhn?=
 =?utf-8?B?NlRvb05CY1JaYWJwL1libEdyTlhFZlJkVDNBaWdmdE9xS2U3OGFwd0h1TCsw?=
 =?utf-8?B?SUQ5dFczeVZnNGtMWVZpY1Bic1ZENkszM05MNDBITjlPSTY2OHhuRUNoa2Vl?=
 =?utf-8?B?SGJCTE5NU1FhUDJ6amhvODBwR040U0c0VnNvWTYvNmgvV1hMMHE1cTcvZE5S?=
 =?utf-8?B?eW8yYzBPdE9MM2lnQkJYMWpMa1lJTjJuYWh3VEhEV2pYSjBmdFZvKzNIWmc3?=
 =?utf-8?B?T2pERzFFUWtjUUcvalVOS3RsdE95N25QckRWN20xdXVPNlNucGtTL0RGeks2?=
 =?utf-8?B?aE9uUHZydVFBNDdxN05qd1pRNTdMQitqT0dSdlJzcVljZUpZNUk0MHQzQlY2?=
 =?utf-8?B?MjQrelJGbUFyaW01L2o5RVQ5Z3hLN3dkSmZIOWJuY1VHb0wvcDVhT1NHK3o2?=
 =?utf-8?B?SC9LRkI0clhjcVRYTm5ZVnJkUUpnRGpIWEVXblpTc3B5VkxiWFlJKzNENTZX?=
 =?utf-8?Q?RAyRJc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3dRVDdIQ1JKcVlZd2dmQ3hOL1BXc1BYRkxrQ2tHT2kzMXlySlhCRUZncDli?=
 =?utf-8?B?M3gzZ24xVmV2ZTdyVEdYS0NqejVUOWlUZTlvR0VLMHVydExqbElMNGlCMllQ?=
 =?utf-8?B?VXpqSXBZVElqOU1ocmMreFdPbVFNWFYyNXdNenJYVC9qWFhOV3RJb25KcmM4?=
 =?utf-8?B?QlljMVU2bTByZXEwTjFjbThIQi9JamFkYnF6WDBKN0cwMWl4UC80dERkWDkw?=
 =?utf-8?B?czdHTWUyNlcrZTdGWTM5Qi9najVUM042ZGpoYVY5ZDFwaTZsY1RPelFtVDk4?=
 =?utf-8?B?a1pQdXhSRTRPWFpZdXNJcDNYN2YxWU1rck5JaFBsdlJOSElNUGRST3BwRDJD?=
 =?utf-8?B?a0p2cFBMeVFndUJ3amJRelZQSmh1dno5VE9XQzZpREErZzFyZ3YyV0xTcHp0?=
 =?utf-8?B?Y2VJSnplRlRIclhLaTlOc0FYN2pWSUJEZkxmVS9RWXdqZm9sWlFpblNhWEUw?=
 =?utf-8?B?OHVYYWVFTTBtK1orQU9oYld1cUFRUERydUZHdWc4bXRLSUoxTFppRWI4aURH?=
 =?utf-8?B?ZzdLc0pTYmw0UnFUMXdiSDFWcXppVEF5UGNvUm5WY1FMb2k1ajJweEF0YWxs?=
 =?utf-8?B?RWczaFJ3bmdkWWc4dTlqQ0h3VWgxOGlCYnFqREdUUE5lMURHS1AwbEVJQjJS?=
 =?utf-8?B?aXNTV241M3NOUE1obVlKcVg3R2JSdFZTdzZIYmhqby9nSmtnQUVlb2NBWkFS?=
 =?utf-8?B?MlZxZHIrVDdsQjJoU2tNVkh6WjZKWDA0SXJ5NjRKNFVoQzZ0MU9PdWJCMHF0?=
 =?utf-8?B?eFp3eUwwL0MrbCthOG52QjhMRVhobk9xUnhwa21ScXEzamF6NnBCUXhuN05C?=
 =?utf-8?B?Mm90SWNOUlVndlBidm9CdDE1UTR5ZzcyM1hFaW1ZQ0UzZ1RGbFdFdVRQVGIw?=
 =?utf-8?B?V2dYN3pLWi9LeGQwczdJSkpuQTNucjc5NU5mVmQwRmNtbTFPbDU0TFlYL08z?=
 =?utf-8?B?NVZKVFA0N3FBSlo2WUhzMDJ0S29lVFRnVDV5RkV3Z2dHR1liS2F1Uld5dTdh?=
 =?utf-8?B?OFVJNllNT0FRbEc5NVRIMlord3BwL2owZlNQc3U3KzNVc0h1dnV4anp2bllF?=
 =?utf-8?B?ejZNS1hzWXlOUGVUVXFhRjBva05wZ0lBSUJLR0NQaGdVZ2xaVzlueVp4emdl?=
 =?utf-8?B?eitwdGZTa2p5MEZWUWV4em1RZlFiZ3llMWhucCtYZTBIM3plcU9MSlJLMC8y?=
 =?utf-8?B?b3BmUFBiN1hwQ3QvdXN0WFQ5YUVUbE9pNFR6eFd6ak82TGFDSUlxcGlDdUc5?=
 =?utf-8?B?cEV3RnNpNFIzeDZqeU9IcWxVK1dtUTBlQ2g1MmNuSjNZWnlDZnpOZ2liZ3Na?=
 =?utf-8?B?MVFRd1IvN0VYZkFJNFlwNFhHRHdad1J2dXA5NzZUNWNEdUJmTTlSTkx3UUVq?=
 =?utf-8?B?enJkUG13d1U3citDMFRJc002Sm1aM21LR3lQM1JsTW9OTUl0OU9hYUtXZXhp?=
 =?utf-8?B?TVlLZEcxZ0s5WExuL0U3QURHVXJWSGdrQ3RkbnEzK2RjbGVtZndaRVhid0l4?=
 =?utf-8?B?NFd5Ym5nU1l5ZGR3WXd6RFlTZ3VOdXp3RzRBdEdUN3BoV2NaY2xTSGFvSGpM?=
 =?utf-8?B?RHBzdDN1dDJBVFpjcG1zTFBEOEJFb1E4bDJSbzY0TVpOMmhzNEtlNjhERmpG?=
 =?utf-8?B?VGZzcXdxaUFMRFZta3FqL3oweUFRWFp1VkV1S1prOG1CQjArSE9hVldyaUx3?=
 =?utf-8?B?bmJXSEkzSG9yTVl3eEVINzk4aUo3Wi9LWit3WVNNVnFrbmtNQkFqSm0vN1hR?=
 =?utf-8?B?eWlqTXZWYTZaanlNcVNEbkQzK0IvQ1plQS8vV3pUbUtXU3hQM09vQ0ZycFNu?=
 =?utf-8?B?NTFHeGRMSWdueUdqVUkxejNqbHNYd09Fd25jWnVreExnTGNKd2IrSW9vM0Ey?=
 =?utf-8?B?WU55Vm5WYjRuemlidTMyaHJ0cU1Rc2Q5N2xKQTFUVHdVQWpjRWg3azhnWmRz?=
 =?utf-8?B?OU1qSXhrVGx4WXVvU3VIalFtSHNGNDFDQ0l4UVJzWFNJREhaWmRUKzV0Vklz?=
 =?utf-8?B?WTNWVlY4ZVFNL3JYT3Q0MU1mclBDQXFoMFJqdkU2YXpscjhSVG5jYmtkK2c4?=
 =?utf-8?B?d1d3c0dpY01WUmRtOTNBOUlhKzRYd09iWW5hVWp3VTNSelNKUHFrS1BJa0wy?=
 =?utf-8?B?U0ZEUWJaaHJNZkFvaHNpQWdtZi90a21zaVhTK1FpcUxHTUJySDh0ZGNVakIx?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39307c96-4922-47fc-7dc7-08de04adc953
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 07:55:58.6532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5bpuclMiJA02yk6jNx1+BgwdME7YoNVaC7NG2bqPh2n1MEe7Jqpz9RKfHSFw2BOWGGt4jkl1EeVoy2E4s/ZUNxBjeuvg5h18LROKCngzkgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEdhamVuZHJhDQo+
IFV0dGFtY2hhbmQNCj4gU2VudDogMTcgU2VwdGVtYmVyIDIwMjUgMDY6NDAgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBVdHRhbWNoYW5kLCBHYWplbmRyYSA8
Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCBpLWct
dCAzLzZdIGJlbmNobWFya3MvaW50ZWxfbGF0ZW5jeTogQWRkIHhlX3ZtIGxhdGVuY3kNCj4gdGVz
dA0KPiANCj4gQWRkIHZpcnR1YWwgbWVtb3J5IG9wZXJhdGlvbiB0aW1pbmcgdGVzdCBmb3IgdGhl
IFhFIGRyaXZlci4NCj4gTWVhc3VyZXMgbGF0ZW5jeSBvZiBWTSBtYW5hZ2VtZW50IG9wZXJhdGlv
bnMgaW5jbHVkaW5nIG1lbW9yeSBtYXBwaW5nLA0KPiB1bm1hcHBpbmcsIGFuZCB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2UgbWFuYWdlbWVudC4NCj4gDQo+IERlZmF1bHRzOiBidWZmZXIgc2l6ZXMgZnJv
bSA0S0IgdG8gOE1CLCAxMyByZXBldGl0aW9ucywgMTAwMCBpdGVyYXRpb25zIHBlcg0KPiByZXBl
dGl0aW9uLCAyIHNlY29uZHMgcGVyIHNhbXBsZSwgc2luZ2xlIENQVS4NCj4gUGFyYWxsZWxpc20g
YW5kIGJ1c3kgbW9kZSBhcmUgY29uZmlndXJhYmxlIHZpYSBjb21tYW5kLWxpbmUgb3B0aW9ucy4N
Cj4gDQo+IEVzc2VudGlhbCBmb3IgZ3JhcGhpY3Mgd29ya2xvYWRzIHdpdGggY29tcGxleCBtZW1v
cnkgYWNjZXNzIHBhdHRlcm5zIGFuZA0KPiBkeW5hbWljIG1lbW9yeSBtYW5hZ2VtZW50IHJlcXVp
cmVtZW50cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdhamVuZHJhIFV0dGFtY2hhbmQgPGdhamVu
ZHJhLnV0dGFtY2hhbmRAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGJlbmNobWFya3MvaW50ZWxfbGF0
ZW5jeS94ZV92bS5jIHwgMTI4DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS94ZV92bS5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYmVu
Y2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX3ZtLmMNCj4gYi9iZW5jaG1hcmtzL2ludGVsX2xhdGVu
Y3kveGVfdm0uYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAuLjAy
ODdhOTA4ZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5j
eS94ZV92bS5jDQo+IEBAIC0wLDAgKzEsMTI4IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRp
b24NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5
bmNvYmouaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hl
X3F1ZXJ5LmgiDQo+ICsNCj4gKyNkZWZpbmUgT0JKRUNUX1NJWkUgKDEgPDwgMjMpDQo+ICsNCj4g
K3N0YXRpYyBkb3VibGUgZWxhcHNlZChjb25zdCBzdHJ1Y3QgdGltZXNwZWMgKnN0YXJ0LA0KPiAr
CQkgICAgICBjb25zdCBzdHJ1Y3QgdGltZXNwZWMgKmVuZCkNCj4gK3sNCj4gKwlyZXR1cm4gKGVu
ZC0+dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAxZS05ICogKGVuZC0+dHZfbnNlYyAtDQo+ICtz
dGFydC0+dHZfbnNlYyk7IH0NCj4gKw0KPiArc3RhdGljIHZvaWQgdGVzdF9leGVjKGludCBmZCwg
aW50IGJ1c3ksIGludCBzaXplKSB7DQo+ICsJdWludDMyX3Qgdm0sIGJvOw0KPiArCXVpbnQ2NF90
IGJvX3NpemUgPSB4ZV9iYl9zaXplKGZkLCBzaXplKTsNCj4gKw0KPiArCXZtID0geGVfdm1fY3Jl
YXRlKGZkLCAwLCAwKTsNCj4gKwlibyA9IHhlX2JvX2NyZWF0ZShmZCwgdm0sIGJvX3NpemUsIHN5
c3RlbV9tZW1vcnkoZmQpLCAwKTsNCj4gKw0KUmVuYW1lIHRoZSB0ZXN0IG5hbWUgdG8geGVfdm1f
YmluZCwgYXMgdGhlIHZtX2JpbmQgaXMgbWFuZGF0b3J5LCByZW1vdmUgdGhlIGlmIGNvbmRpdGlv
biB0aGF0IGlzIGJ1c3kgYWxzbyByZW1vdmUgYWxsIHVudXNlZCBhcmd1bWVudCBvcHRpb25zLg0K
PiArCWlmIChidXN5KSB7DQo+ICsJCWlndF9hc3NlcnRfZXEoX194ZV92bV9iaW5kKGZkLCB2bSwg
MCwgYm8sIDAsIDB4NDAwMDAsDQo+ICsJCQkJCWJvX3NpemUsDQo+IERSTV9YRV9WTV9CSU5EX09Q
X01BUCwgMCwgTlVMTCwgMCwgMCwNCj4gKwkJCQkJMCwgMCksDQo+ICsJCQkJLUVJTlZBTCk7DQo+
ICsJCXhlX3ZtX3VuYmluZF9zeW5jKGZkLCB2bSwgMCwgMHg0MDAwMCwgYm9fc2l6ZSk7DQo+ICsJ
fQ0KPiArDQo+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0p
Ow0KPiArfQ0KPiArDQo+ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICt7DQo+
ICsJaW50IGZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ICsJaW50IHNpemUgPSAw
Ow0KPiArCWludCBidXN5ID0gMDsNCj4gKwlpbnQgcmVwcyA9IDEzOw0KPiArCWludCBuY3B1cyA9
IDE7DQo+ICsJaW50IGMsIG4sIHM7DQo+ICsNCj4gKwl3aGlsZSAoKGMgPSBnZXRvcHQoYXJnYywg
YXJndiwgInM6YjpyOmYiKSkgIT0gLTEpIHsNCj4gKwkJc3dpdGNoIChjKSB7DQo+ICsJCWNhc2Ug
J3MnOg0KPiArCQkJc2l6ZSA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJ
CWNhc2UgJ3InOg0KPiArCQkJcmVwcyA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWlmIChyZXBzIDwg
MSkNCj4gKwkJCQlyZXBzID0gMTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2YnOg0K
PiArCQkJbmNwdXMgPSBzeXNjb25mKF9TQ19OUFJPQ0VTU09SU19PTkxOKTsNCj4gKwkJCWJyZWFr
Ow0KPiArDQo+ICsJCWNhc2UgJ2InOg0KPiArCQkJYnVzeSA9IHRydWU7DQo+ICsJCQlicmVhazsN
Cj4gKw0KPiArCQlkZWZhdWx0Og0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4g
KwlpZiAoc2l6ZSA9PSAwKSB7DQo+ICsJCWZvciAocyA9IDQwOTY7IHMgPD0gIE9CSkVDVF9TSVpF
OyBzIDw8PSAxKSB7DQo+ICsJCQlpZ3Rfc3RhdHNfdCBzdGF0czsNCj4gKw0KPiArCQkJaWd0X3N0
YXRzX2luaXRfd2l0aF9zaXplKCZzdGF0cywgcmVwcyk7DQo+ICsJCQlmb3IgKG4gPSAwOyBuIDwg
cmVwczsgbisrKSB7DQo+ICsJCQkJc3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQkJ
dWludDY0X3QgY291bnQgPSAwOw0KPiArDQo+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05P
VE9OSUMsICZzdGFydCk7DQo+ICsJCQkJZG8gew0KPiArCQkJCQlmb3IgKGMgPSAwOyBjIDwgMTAw
MDsgYysrKQ0KPiArCQkJCQkJdGVzdF9leGVjKGZkLCBidXN5LCBzKTsNCj4gKw0KPiArCQkJCQlj
b3VudCArPSBjOw0KPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywNCj4gJmVu
ZCk7DQo+ICsJCQkJfSB3aGlsZSAoZW5kLnR2X3NlYyAtIHN0YXJ0LnR2X3NlYyA8IDIpOw0KPiAr
DQo+ICsJCQkJaWd0X3N0YXRzX3B1c2hfZmxvYXQoJnN0YXRzLCBjb3VudCAvDQo+IGVsYXBzZWQo
JnN0YXJ0LCAmZW5kKSk7DQo+ICsJCQl9DQo+ICsJCQlwcmludGYoIiVmXG4iLCBpZ3Rfc3RhdHNf
Z2V0X3RyaW1lYW4oJnN0YXRzKSk7DQo+ICsJCQlpZ3Rfc3RhdHNfZmluaSgmc3RhdHMpOw0KPiAr
CQl9DQo+ICsJfSBlbHNlIHsNCj4gKwkJZG91YmxlICpzaGFyZWQ7DQo+ICsNCj4gKwkJc2hhcmVk
ID0gbW1hcCgwLCA0MDk2LCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVEIHwNCj4gTUFQX0FOT04sIC0x
LCAwKTsNCj4gKwkJZm9yIChuID0gMDsgbiA8IHJlcHM7IG4rKykgew0KPiArCQkJbWVtc2V0KHNo
YXJlZCwgMCwgNDA5Nik7DQo+ICsNCj4gKwkJCWlndF9mb3JrKGNoaWxkLCBuY3B1cykgew0KPiAr
CQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2NF90IGNvdW50ID0g
MDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0K
PiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJCQkJ
CXRlc3RfZXhlYyhmZCwgYnVzeSwgc2l6ZSk7DQo+ICsNCj4gKwkJCQkJY291bnQgKz0gYzsNCj4g
KwkJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0KPiArCQkJCX0g
d2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiArCQkJCXNoYXJl
ZFtjaGlsZF0gPSBjb3VudCAvIGVsYXBzZWQoJnN0YXJ0LCAmZW5kKTsNCj4gKwkJCX0NCj4gKwkJ
CWlndF93YWl0Y2hpbGRyZW4oKTsNCj4gKw0KPiArCQkJZm9yIChpbnQgY2hpbGQgPSAwOyBjaGls
ZCA8IG5jcHVzOyBjaGlsZCsrKQ0KPiArCQkJCXNoYXJlZFtuY3B1c10gKz0gc2hhcmVkW2NoaWxk
XTsNCj4gKw0KPiArCQkJcHJpbnRmKCIlNy4zZlxuIiwgc2hhcmVkW25jcHVzXSk7DQo+ICsJCX0N
Cj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gLS0NCj4gMi40My4wDQoNCg==

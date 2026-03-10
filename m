Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EF0EB104B
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 11:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379E410E23A;
	Tue, 10 Mar 2026 11:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lseyDb8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB1410E23A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 11:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773141463; x=1804677463;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wbq1szE9BAVHo0jzauEDgNaNUtMwsROoSgzYke9cvv4=;
 b=lseyDb8VmcjzknAbEsTrIge4tX+cr3WFnOzsQt4jtm2UCPzxbQbt3IO2
 vvbS8MI3OEfuUA9jmFCwR11iosOlL/lqKFitq22/EOD/hLf85CdBPIOjJ
 3DQhWGHme3z1vYa01USJYkLqu7n8521bXKUHcRswT836r4pTCBf/JZgyH
 5+f+yrwQn/4ET/n1/bTZrdjG+51werFMYQ5+6u02dTFN+ahHTs16ziubj
 Wlo61JXSdKfp2thxXYHGuJnEF3Xt6DwjlyeLNgXB54/HNP2xDyEf1+xvf
 Ud4VtaoltHN9nwO0FyR41nxlmFu4kmZmjp54v2qAibfujd1l2XIOz2Aiq Q==;
X-CSE-ConnectionGUID: B4QSxH9WTZemSRSoFk6Xnw==
X-CSE-MsgGUID: 6LTA0qIERFyax07aMvF+vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84818978"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84818978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:17:43 -0700
X-CSE-ConnectionGUID: rOOTZqqbRYaVuF9r1jxcDw==
X-CSE-MsgGUID: nLrC+yJ8RdeycZqrK8rp3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224250552"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:17:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 04:17:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 04:17:42 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 04:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1PDTj1y4xS3tU+mnXMwKkqtxgYyBZDCUyCBZKL/49w1QVWcxENE1EzY4xw1K5iVaieE1TckPY0IPvEZH53C7HPBD4llWBjn/ycItRqefgufm4B6MFKRiYcypoc29VEjUie4hVLfidM92hZnxXIPuXzbCpNp5j36XJDiz6BUO3PkASbEr3ClaWWnim4gM0tyViH8cEM8rXo10/ZNrJvh14boJf/0wH6lbSF+IwtLJ6pnypquj3dz/NTmSULGV6B2xLfsYGZu2j87XhMFmtC74o4eecPNNWQhhNZNwCwHt3rKM6k96XkkS2re6TmLBzMBUSZ9WgphPfL+UzL0V1S2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbq1szE9BAVHo0jzauEDgNaNUtMwsROoSgzYke9cvv4=;
 b=D8WgKe/TMOV0UslYj8KM+CRpy1tsF3Kofhs5Dijn9BSRprEwPb/ZM95+nKdWyAF1cSigKIQ9bteCjnGXFvUuR3zV/1QSaOG5BeAIJmHpNrFuUUeWdNH0cGiCVqZSYgURJmQMSTPBPcd6DWqA1YkoLsq5r+lVNwaH0mjV9a+Iw00UDmG/BRcGRGQuYIm5Aascvwx9F8n2zjwJZsF4j9c4sH05r7Gw9vf0Q98h0hBrDJCjKGzMPr5IOgLkGOMJD16a9w0hYyF7pnUJkJ5SBkrQio/s+YeS492oe6oOox0vQeNFF+LtNYobwJ4/UpgabjvznDVoNM3nqHlYyqPq8haz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 11:17:40 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 11:17:40 +0000
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v4 4/5] lib/xe/xe_eudebug: Track active debugger
 sessions and close when disabling
Thread-Topic: [PATCH i-g-t v4 4/5] lib/xe/xe_eudebug: Track active debugger
 sessions and close when disabling
Thread-Index: AQHcon7/Tz4ZKLpm2EuNERc81dqwWLWnt+wA
Date: Tue, 10 Mar 2026 11:17:40 +0000
Message-ID: <DM4PR11MB8179468727CACA1F8F285F5B9446A@DM4PR11MB8179.namprd11.prod.outlook.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
 <20260220153748.210381-11-christoph.manszewski@intel.com>
In-Reply-To: <20260220153748.210381-11-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB8025:EE_
x-ms-office365-filtering-correlation-id: cdf7d105-79c0-43cb-a473-08de7e96a46e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: ILq9BfPV866kznCngqSjQ1lqizqQn8pAeMpSoMsEAY1a/Wm/+AHRj7o8iKrOoG34WvL9TRgbuMRsKnsdeja7boQXDBqBfeWxobo5WUmdW3DxMdOZEdqMtYmEnJUvynoYkXSBITZRdVE1u6hD7fjPANf38LfDcqmuoty8yPRjaBjUqnpZ8g8emYP6KqXkSRtPrW0TAi7qBeT37QdbNYXPfSXRV5j1NDGqjG+RTMblWG0md7Bawp1kyI7jErM8qghccEBC4oAyMll5pYXdlBm4+HyQ97X8/Kia+mAVsNzHab1w4vdmZHElTtl3R+Pr97kFf4kXjIe0DfMA1emAfHgn8PP20gbKckWst73uc+4lZK907VjxVvYTKFLelKx0N9WLUDvUoQZgfc8w28+0I7/oC0o/sOEnozMKEYgOIthwu4tHA46x5Ung+BYCpx2PKHwXYcjFrM4aVjO3zndEBAzR/dBVqPyBNI2jxqdFIEoZhTX+FgxFScLs+YWwnzPPpt3VpHu9Qrq41YLjrDPNkCW5d0jVUjesr4Pd4PYkbJTv8rolSP5IZQVgYwUwGLXbmWt9gmj5AGNfG/fmgWUhfU5SOIhSHr5Ctvx7THc3aMD4d2jRcteyA/J7B4H4nU+cDQGyjYJIJC0I9uY2sKt7Q+T/ptiyBLxx+G7y97Q2xzCCKKS3BrIZZS3aeZbc3kTR69h/Sg71IvS45XvaFivmxqEyceBrevq6NLAOUbbHnFOtZ1IefQIi+2DJ4csluYs3F+LgMmw9bDXEkmUxL/fXul97vGLLMpQO41P+l2CMsekPdWI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajB1THh1QlN4cFhQM01OUkphclZZZVJxWjBvRzV5K1RLUVY0SkhtcUFPNnpX?=
 =?utf-8?B?QldIWVJNOS9lUWQ4UTdYcmV1VTd6bEMyblNzd0NVTjI3Q2ZQSXFwR2FzK3cr?=
 =?utf-8?B?ZVJCd1R6ODVFbktuOE8za2swc1lJRVMyNWdHWkcrWlFoNlc4bVg5V1A0N1hO?=
 =?utf-8?B?V3crcjI3R2JscWxUeS9FRzV5ZlIxdC9wMWFtQTV6Mi9OWXYyREdlS3NOaWpZ?=
 =?utf-8?B?VXpocVlqdlZaRndnYVhtYnhYRVM3WCs2YTd4cEs4TVprQU9yZWdHWGZzMW03?=
 =?utf-8?B?Vi9xQmQ0ZFJmNktwenVmbjJWaWNRSEVFT0ZJand6Tjk3SnRacngwM001SUVO?=
 =?utf-8?B?ZW9jNW1SejQ1Q0JqbzluYVU2QUJtcTNBZFhzcTlmYjRIVG9GQ2FkWGxERUVr?=
 =?utf-8?B?dENGY01GN0ZOWWsveFJJOEdYbXh4RjhrMUJqRjR2RzZZTkhYNGZBT3ZXODAr?=
 =?utf-8?B?SmsyQ2djSm1rOG9rL2ZEUExDUWtzQlFmbTNhQVQ0Uno0WnpxQzJtbEZyUGRk?=
 =?utf-8?B?Z0xYVzFZMXJzSWVqZjk0SnRsM3lWL25iZFZwdmlmKzR0MUovSit6a3NIVElZ?=
 =?utf-8?B?V3BZQ3YzZEd1MEx5akExdllXNHYreXl4TytGNnplNDZVS0xnSnBRUWh2YkN0?=
 =?utf-8?B?OGFhd2lCZTcyOHB0b000MERueTRiaFQrYUpxaHIyTFVZaml0bGtyRTg1bmhN?=
 =?utf-8?B?VmlXbFNSd2l5QVl1aDNDL1h6N2pxR3JlNUN4dDNjRG5oaW5kcEV0cERpMXpy?=
 =?utf-8?B?ZkYzaVI1WFluQlcyV2REZnFaalljK2N3NFU0TEdGSUtqTmJZK2ZLdVoxcjNH?=
 =?utf-8?B?VjFWelo4Z3haa3lmcnN0RWFGR3FkWnM3YWw2K3FibXFOSmphMWxRSEpuZTBT?=
 =?utf-8?B?TzJnN0I1cE5ERHYwRG9ud1B4Z29ZbC9iZXFCZVlidE4rdDlYUjFGMWtlMjUr?=
 =?utf-8?B?MTk1SU9tSk5IZ3E4SnoySXhiWjcyRlBTQmoxdy92ZGNheER4Tmx3UWtrdXBC?=
 =?utf-8?B?amtBak13U1B5VERML3NNSmZMQkpmYW9DaC9RUlpjV3R0ckJPb0dmRlJIYzNO?=
 =?utf-8?B?eTRxa1p4eFMrQjVSU01LbC82dmRhN1VyZ21CUk4xTlZpZlQ4U3lORWh2dTlo?=
 =?utf-8?B?MHNkN1hKTFFxUkh1ZTFNY1g1Rm84dkVPUnhLWnBMd2tWMkNOQVFaT1dkL1Rw?=
 =?utf-8?B?UWUxQU9kaG5ZcytqNDN5dVc3d09EcUFiVDdEUFc0dTBSY08zdEFiY1FMeEhk?=
 =?utf-8?B?TU9oOW9vMUlEUmM5OSt5Wm5KOTJSbzdrM1cwdHR6aWpmVVQzYm5COFBZWHJl?=
 =?utf-8?B?ME05S3h2UmlFdFpwK3l1VTBrbFNBeFpQMDUrVHR4SjJZcDMyWjRYaTViWHZY?=
 =?utf-8?B?WlgvVEtMQnd3RTJiZUZ6UkVOQXJQSjJDYVhZaW5lLzM0Ry84WTB5SDl0MlU5?=
 =?utf-8?B?WHphbktsVTRPaUZsYU55U0FGVjdpdzFNeG1QL3V4UEptSSsvOWRta0htY0Fz?=
 =?utf-8?B?WlpIWStOUjVNRW1iV1FFNVYvS21KSXdFNDdFSUFXdlFCZmFFTVlUQ1dSU21R?=
 =?utf-8?B?U2w4ak1ZUFVTTzRSZUkvdWxsZDJnRlV0ZXEwbmFmMlpEK1dQajRDTHpsRUJ5?=
 =?utf-8?B?YUd0ZmNhYm1obHBMa1RwNXdGUC95aWIwN1NqNXlubzlaemo3eFluSWNXV1BI?=
 =?utf-8?B?KzZUZW1MYmdkWloyYUVCaE9GUnNaSkErZDdVRHZlQm1CTXJZamdoU2xwVkpn?=
 =?utf-8?B?RWhVUENmQ3lWbXhlUTVtWWIwRUxib3pEMEthTk5mVkJOUElXcEttY3FSVFBa?=
 =?utf-8?B?a0RBTXhyUTYxcERRUUlRcjVJdEIyYUpvV1NZVy9BdFlKTGJ4ZEQxOTBUVk9V?=
 =?utf-8?B?MXg5aTlTOTc2eDV6UnR1ZHFUVGVQNzVINUN0Sjk4aVVqY0Y3dCtFSWd5SklK?=
 =?utf-8?B?cGkvTkh4ZjJjN3ZVODNTTlB2VHc3U1ljdGlPdmdhNUxsbkZ6bm5CMFZsdSt6?=
 =?utf-8?B?cnBSa3gvQlFQbVI4UjhZdlRSWERrZlExVDdGU0MraWwzUWZ3dHdHL1pQL2Rx?=
 =?utf-8?B?OW83bkF3RHJ4M3FtN1NkU1VkdTEwTmNEYmFhK2Y5akdmenY5SVk1TVB5MjBm?=
 =?utf-8?B?c3B6WCs4dVdmR2ZnRHVLY1dWblgybHkxM05vVFZyRnRHck1sL0d6RnJpUVIv?=
 =?utf-8?B?UVNVTlhZWmo0dkt6YW5jUkJPZUFtYmMyOEtwb3RhS1VCNWxMS21aVFhMWE51?=
 =?utf-8?B?UWFNenR2enVHUExWVXFSMU05MFk5b3JBWExUdHQ0WnZxdnBsSThhcUpYdWVz?=
 =?utf-8?B?SklrYnpqSlp2d1RpbnZTbHhmUzlMdk43RHNrLyt6aHZGZWJ1ZWNVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PofrtkyKHmU4DPN0U/JlU3LNGn6r83LAGHh8wTT9vAFD4Bq+Sae2+5jq1IAHghqdsQtI0qkJcpnnTXx9iC7HPt3Mzuuf7MjMmZhsOKWY9TGB8LgEfN157UcE5EGWtl5RzNCEn0wBxixssAxes7w/lWL3p2dtIWXG1J62x0NSkk9SatIECkB9DQ7dw5+9WscBCzgFAi4Qg8PLJYYlgY7tyaHBmWjXnrI1w2oPcytTMkQ8eaRzp8LKvKZ9xP4H5BkC0jyL52ODLaU1PVc5ozwe2/tM0dVq6Ko64StC5ORE7g+O3VS5ok1GqbWwfMe8Gqe7FBCJTLhcl75V40Cw/uaWWQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf7d105-79c0-43cb-a473-08de7e96a46e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 11:17:40.0439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KIDX+p06ipEuOzy8sRTE+Fx04vZaF9fIGVSx5J+7uSJ3qHl5B8QUjCuGKRZiNRlDc4M/oavh/zOxKP97V6LXg2MGmpjj8Vw+b3wUnM5DQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFuc3pld3NraSwg
Q2hyaXN0b3BoIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgRmVicnVhcnkgMjAsIDIwMjYgNDozOCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IFJ1ZG5pY2tpOyBSdWRuaWNraSwgUGlvdHIgPHBpb3RyLnJ1ZG5pY2tp
QGludGVsLmNvbT47IFBpYXRrb3dza2k7DQo+IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wgPGRv
bWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBTb2tvbG93c2tpLA0KPiBKYW4gPGph
bi5zb2tvbG93c2tpQGludGVsLmNvbT47IE1hbnN6ZXdza2ksIENocmlzdG9waA0KPiA8Y2hyaXN0
b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjQgNC81
XSBsaWIveGUveGVfZXVkZWJ1ZzogVHJhY2sgYWN0aXZlIGRlYnVnZ2VyIHNlc3Npb25zDQo+IGFu
ZCBjbG9zZSB3aGVuIGRpc2FibGluZw0KPiANCj4gQWN0aXZlIGRlYnVnZ2VyIHNlc3Npb25zIHBy
ZXZlbnQgZGlzYWJsaW5nIEVVIERlYnVnIHZpYSB0aGUgc3lzZnMgdG9nZ2xlLiBBcyBhDQo+IHJl
c3VsdCB3aGVuIGEgdGVzdCBmYWlscyB0aGUgaWd0X2ZpeHR1cmUgd2lsbCBmYWlsIHRvIGRpc2Fi
bGUgRVUgRGVidWcgaWYgdGhlIHdvcmtlcg0KPiB0aHJlYWRzIGhhdmUgb3BlbiBkZWJ1Z2dlciBm
ZHMuDQo+IA0KPiBJbnRyb2R1Y2UgYWN0aXZlIGRlYnVnZ2VyIHNlc3Npb24gKGRlYnVnZ2VyIGZk
KSB0cmFja2luZyBhbmQgdXNlIGl0IHRvIGNsb3NlDQo+IGxlZnRvdmVyIHNlc3Npb25zIGJlZm9y
ZSBhdHRlbXB0aW5nIHRvIGRpc2FibGUgZXVkZWJ1Zy4gVGhlIGtlcm5lbCAnc3RydWN0DQo+IGRy
bV9kcml2ZXIucG9zdGNsb3NlJyBoYW5kbGVyIHdoaWNoIHJlbW92ZXMgdGhlIGRlYnVnZ2VyIHNl
c3Npb25zIHRyYWNrZWQgYnkNCj4gWGUgRVUgRGVidWcgcnVucyBhc3luY2hyb25vdXNseSB0byAn
Y2xvc2UnIHNvIHJldHJ5IGRpc2FibGluZyBpbiBhIGxvb3Agb24gJy0NCj4gRUJVU1knLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraQ0KPiA8ZG9taW5pay5r
YXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE1h
bnN6ZXdza2kgPGNocmlzdG9waC5tYW5zemV3c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIv
eGUveGVfZXVkZWJ1Zy5jIHwgNzQNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9ldWRlYnVnLmMgYi9saWIveGUv
eGVfZXVkZWJ1Zy5jIGluZGV4DQo+IDdhNjQxZDJiZC4uYTBjYWFkMmMzIDEwMDY0NA0KPiAtLS0g
YS9saWIveGUveGVfZXVkZWJ1Zy5jDQo+ICsrKyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gQEAg
LTE4LDYgKzE4LDU4IEBADQo+ICAjaW5jbHVkZSAieGVfaW9jdGwuaCINCj4gICNpbmNsdWRlICJ4
ZS94ZV9xdWVyeS5oIg0KPiANCj4gK3N0cnVjdCBkZWJ1Z2dlcl9mZF9lbnRyeSB7DQo+ICsJaW50
IGZkOw0KPiArCXN0cnVjdCBpZ3RfbGlzdF9oZWFkIGxpbms7DQo+ICt9Ow0KPiArDQo+ICtzdGF0
aWMgSUdUX0xJU1RfSEVBRChhY3RpdmVfZGVidWdnZXJfZmRzKTsNCj4gK3N0YXRpYyBwdGhyZWFk
X211dGV4X3QgYWN0aXZlX2RlYnVnZ2VyX2Zkc19sb2NrID0NCj4gK1BUSFJFQURfTVVURVhfSU5J
VElBTElaRVI7DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHJlZ2lzdGVyX2RlYnVnZ2VyX2ZkKGludCBm
ZCkgew0KPiArCXN0cnVjdCBkZWJ1Z2dlcl9mZF9lbnRyeSAqZW50cnk7DQo+ICsNCj4gKwlwdGhy
ZWFkX211dGV4X2xvY2soJmFjdGl2ZV9kZWJ1Z2dlcl9mZHNfbG9jayk7DQpQbGVhc2UgbW92ZSB0
aGlzIGxvY2sgYmVsb3cgdGhlIGNhbGxvYy9hc3NlcnQsIG90aGVyd2lzZSBMR1RNDQpSZXZpZXdl
ZC1ieTogUGlvdHIgUnVkbmlja2kgPHBpb3RyLnJ1ZG5pY2tpQGludGVsLmNvbT4NCg0KPiArDQo+
ICsJZW50cnkgPSBjYWxsb2MoMSwgc2l6ZW9mKCplbnRyeSkpOw0KPiArCWlndF9hc3NlcnQoZW50
cnkpOw0KPiArCWVudHJ5LT5mZCA9IGZkOw0KPiArCUlHVF9JTklUX0xJU1RfSEVBRCgmZW50cnkt
PmxpbmspOw0KPiArCWlndF9saXN0X2FkZCgmZW50cnktPmxpbmssICZhY3RpdmVfZGVidWdnZXJf
ZmRzKTsNCj4gKw0KPiArCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZhY3RpdmVfZGVidWdnZXJfZmRz
X2xvY2spOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB1bnJlZ2lzdGVyX2RlYnVnZ2VyX2Zk
KGludCBmZCkgew0KPiArCXN0cnVjdCBkZWJ1Z2dlcl9mZF9lbnRyeSAqZW50cnksICp0bXA7DQo+
ICsNCj4gKwlwdGhyZWFkX211dGV4X2xvY2soJmFjdGl2ZV9kZWJ1Z2dlcl9mZHNfbG9jayk7DQo+
ICsJaWd0X2xpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnRyeSwgdG1wLCAmYWN0aXZlX2RlYnVn
Z2VyX2ZkcywgbGluaykgew0KPiArCQlpZiAoZW50cnktPmZkID09IGZkKSB7DQo+ICsJCQlpZ3Rf
bGlzdF9kZWwoJmVudHJ5LT5saW5rKTsNCj4gKwkJCWZyZWUoZW50cnkpOw0KPiArCQkJYnJlYWs7
DQo+ICsJCX0NCj4gKwl9DQo+ICsJcHRocmVhZF9tdXRleF91bmxvY2soJmFjdGl2ZV9kZWJ1Z2dl
cl9mZHNfbG9jayk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGNsb3NlX2FsbF9kZWJ1Z2dl
cl9mZHModm9pZCkgew0KPiArCXN0cnVjdCBkZWJ1Z2dlcl9mZF9lbnRyeSAqZW50cnksICp0bXA7
DQo+ICsNCj4gKwlwdGhyZWFkX211dGV4X2xvY2soJmFjdGl2ZV9kZWJ1Z2dlcl9mZHNfbG9jayk7
DQo+ICsJaWd0X2xpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnRyeSwgdG1wLCAmYWN0aXZlX2Rl
YnVnZ2VyX2ZkcywgbGluaykgew0KPiArCQlpZ3RfZGVidWcoImNsb3NpbmcgbGVmdG92ZXIgZGVi
dWdnZXIgZmQgJWRcbiIsIGVudHJ5LT5mZCk7DQo+ICsJCWNsb3NlKGVudHJ5LT5mZCk7DQo+ICsJ
CWlndF9saXN0X2RlbCgmZW50cnktPmxpbmspOw0KPiArCQlmcmVlKGVudHJ5KTsNCj4gKwl9DQo+
ICsJcHRocmVhZF9tdXRleF91bmxvY2soJmFjdGl2ZV9kZWJ1Z2dlcl9mZHNfbG9jayk7DQo+ICt9
DQo+ICsNCj4gIHN0cnVjdCBldmVudF90cmlnZ2VyIHsNCj4gIAl4ZV9ldWRlYnVnX3RyaWdnZXJf
Zm4gZm47DQo+ICAJaW50IHR5cGU7DQo+IEBAIC0xMjcwLDYgKzEzMjIsOCBAQCBzdGF0aWMgaW50
IF9feGVfZXVkZWJ1Z19kZWJ1Z2dlcl9hdHRhY2goc3RydWN0DQo+IHhlX2V1ZGVidWdfZGVidWdn
ZXIgKmQsIHBpZF90IHBpZA0KPiAgCWQtPmZkID0gcmV0Ow0KPiAgCWQtPnRhcmdldF9waWQgPSBw
aWQ7DQo+IA0KPiArCXJlZ2lzdGVyX2RlYnVnZ2VyX2ZkKGQtPmZkKTsNCj4gKw0KPiAgCXJldHVy
biAwOw0KPiAgfQ0KPiANCj4gQEAgLTEzMjMsNiArMTM3Nyw3IEBAIGludCB4ZV9ldWRlYnVnX2Rl
YnVnZ2VyX2F0dGFjaChzdHJ1Y3QNCj4geGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwgIHZvaWQgeGVf
ZXVkZWJ1Z19kZWJ1Z2dlcl9kZXRhY2goc3RydWN0DQo+IHhlX2V1ZGVidWdfZGVidWdnZXIgKmQp
ICB7DQo+ICAJaWd0X2Fzc2VydChkLT50YXJnZXRfcGlkKTsNCj4gKwl1bnJlZ2lzdGVyX2RlYnVn
Z2VyX2ZkKGQtPmZkKTsNCj4gIAljbG9zZShkLT5mZCk7DQo+ICAJZC0+dGFyZ2V0X3BpZCA9IDA7
DQo+ICAJZC0+ZmQgPSAtMTsNCj4gQEAgLTE5MDksNyArMTk2NCwyNCBAQCBib29sIHhlX2V1ZGVi
dWdfZW5hYmxlKGludCBmZCwgYm9vbCBlbmFibGUpICB7DQo+ICAJY2hhciBzeXNmc19wYXRoW1BB
VEhfTUFYXTsNCj4gIAlib29sIG9sZCA9IGZhbHNlOw0KPiAtCWludCByZXQgPSBfX3hlX2V1ZGVi
dWdfZW5hYmxlX2dldHNldChmZCwgJm9sZCwgJmVuYWJsZSk7DQo+ICsJaW50IHJldCA9IDA7DQo+
ICsNCj4gKwkvKiBXaGVuIGRpc2FibGluZyBldWRlYnVnLCBjbG9zZSBhbGwgYWN0aXZlIGRlYnVn
Z2VyIHNlc3Npb25zIGZpcnN0LiAqLw0KPiArCWlmICghZW5hYmxlKQ0KPiArCQljbG9zZV9hbGxf
ZGVidWdnZXJfZmRzKCk7DQo+ICsNCj4gKwkvKiAnc3RydWN0IGRybV9kcml2ZXIucG9zdGNsb3Nl
JyBydW5zIGFzeW5jaHJvbm91c2x5IHRvICdjbG9zZScsIHdhaXQgZm9yDQo+IGl0IHRvIGNvbXBs
ZXRlICovDQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCAxMDsgKytpKSB7DQo+ICsJCXJldCA9IF9f
eGVfZXVkZWJ1Z19lbmFibGVfZ2V0c2V0KGZkLCAmb2xkLCAmZW5hYmxlKTsNCj4gKw0KPiArCQlp
ZiAocmV0ICE9IC1FQlVTWSkNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWlmIChpIDwgOSkgew0K
PiArCQkJaWd0X2RlYnVnKCJ4ZV9ldWRlYnVnX2VuYWJsZTogRmFpbGVkICglZCksDQo+IHJldHJ5
aW5nLi4uXG4iLCByZXQpOw0KPiArCQkJc2xlZXAoMSk7DQo+ICsJCX0NCj4gKwl9DQo+IA0KPiAg
CWlmIChyZXQgPT0gLUVOT0VOVCkgew0KPiAgCQlpZ3RfYXNzZXJ0KGlndF9zeXNmc19wYXRoKGZk
LCBzeXNmc19wYXRoLCBzaXplb2Yoc3lzZnNfcGF0aCkpKTsNCj4gLS0NCj4gMi40Ny4xDQo=

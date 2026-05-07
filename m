Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E19CD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 19:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC4510E2C5;
	Thu,  7 May 2026 19:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euYR79cE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C3B10E2C5
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778181322; x=1809717322;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=UOwhVF8/IMJ8Xtl0OSFFZKtAMDQd/OJKeM9BB2GJ9I4=;
 b=euYR79cEjLnOhwJzrEhrwjFw6zK1hIz75Gr840WBTQtwNuyR8mY3MDgg
 6lb2yhh77IeLnyF5OAJSWtmS1iedu8Fw8zh2mS5J2tMybxb2iFIyHjMQ4
 7JHAGJCJjzLQgYlLLXdXbRwLcSdtUjILp7DcnzoBREvHP3WGbcpKTAzIO
 hSPfwb3gkzeKHqQyk9HqruhqYw5Ldk2YxgHmsnw8CkdSqm2DbqS4xAjC3
 85Iicbsf4JBAkRZTZqXEot/REDxOo/SvQIpD9NPuKWAZMeFnvnxGELjQH
 7fYS4WwdFZ+B6ngxOusClsC9DjwI/YTyVuGPg0i7sS2LlAoTganSubh3E Q==;
X-CSE-ConnectionGUID: 7ZU6Lwj2RaGeu66FJxiong==
X-CSE-MsgGUID: NTQmq7jdT6m2WOhV9LbTKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79045569"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79045569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:15:21 -0700
X-CSE-ConnectionGUID: 0IlSDxggTUKGCt6Wx7DcWg==
X-CSE-MsgGUID: n8txJeXyQcCiF8oqKgdi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="233490905"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:15:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:15:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 12:15:19 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G52UC0yF+rliJIyCgK75lecSHH+4FtkBhSBBbwRz+6S6ulE0Slg6NJ43tswZuJsqPb34c9h0vPowJqWExAHAhrCBpvSjyjacdO9WZawrU2Db93DEOGQ9OpL0WXDnc7eftK+8xcj+RCX/slIo1qqZhRlP7wo4XTBNWiXs1QToHGNSOwGFPnCnvW+2tEQm3a5jNRJ0wty6W3e+juPV9dFv8S/kzpYtsRqIFKTfM2Ot0PhNz4mOZx4yMBh24Kpnyx53YD1kADK0pGAlR3m6TPxN+73tmDGA9NKCBxFquHzqgNNZx8gSMXlfRc1QbmmBmIB6El9ydKobFN+06S22r8Y55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOwhVF8/IMJ8Xtl0OSFFZKtAMDQd/OJKeM9BB2GJ9I4=;
 b=AkBM6w5YuxLylpEobvlJu9ByMmkUjQ8GbHWUZS3IMFPNq2WZdEvDPUlrLYqOaGaqUunwzobOWUkCGsSXYfunjglhH5dBFbyLwoOjmDpFbyySygPXEq+vPi2rQJOp5g8/QuiRFmeP98cVJlamSKwYjqjQTirTa97Sxv/2jtDMP/z1UXp1qeqg04mRI9KRr7iGzre2OZfqyNIRp1aMvZkOJvjA1wEOygYyTg9JONBzO8Gj3qkGZ6Tuz1lZarUvsQCLHiZPwKxYn4hAOJ7JgHbkQvvyKXXR6s5SPZEFPIi70aLhkV6rRsgrHmQ1SqyzgCu4gGEgj5ZxGH96Faqg4aDipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 19:15:10 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 19:15:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/3] lib/xe/xe_spin: Enhance multi-queue switch option
Thread-Topic: [PATCH 1/3] lib/xe/xe_spin: Enhance multi-queue switch option
Thread-Index: AQHc3YarY1PooQqcRkm7qW2ateyvXrYC8JaA
Date: Thu, 7 May 2026 19:15:10 +0000
Message-ID: <9575266a54ec7fbce26b586c4c70f70750ea9d83.camel@intel.com>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260506183137.51479-6-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB8344:EE_
x-ms-office365-filtering-correlation-id: d7216380-d89b-4da1-4412-08deac6cf53c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003|3023799003;
x-microsoft-antispam-message-info: HLKd3qcJVybkbNcHn/3G6cygcHk/XJGPPfoksBf4WdMTvEf33OzjQE7dw967BXIpCf9uzNiASzH8F5+C+TF20P9g76nD1EmBDXQVILPPHzviaWTIyTbgLnR96iEu9HJ8Lx4RHLHE1t2fg90SAello96YhrI/YTLDeaLD675+73veCWGnQzdzt9y7oOok16xoiMQYGlLmz15oYbHo8O0+dGA7s1MRUsOcD3jwa/AJAc+IoC0nRz2B4QGaUYqIERmNe544Qe3Un2YUu3JUfRXkbIGn9Oe90/qq81rKRBKfY/k20m1d6PrufaJahvdLNmSWEfeKMhpIKoU4TMOnaCgc9O41XTWwgoSgZ01u8CqUHxJdzLIEzmnhb9irceFOCKTgOA5n+2LdEIO0U9RuxOkV2zwofKv2rW9M7Bjj2O+bDYjU6/hqaaskmN0RFKRD+ySWrrvcQPyBlZpdf7xNP1K9tkrzg5tDMih+AcogFvP+ieQiN5FKuWiJLIdXXAbnhzV2ZjU/0gRCM6BHwn9cw7geqRoTlnCTcIjKSUizcRBF/DYqIIVMrUYbBRIQz6QrQNCDCxoBX58u89y2bvu14N0ivf+xN8Ikt9NJjkP6BR5I7Ffjs0C3FX28jWdn3Mv5m38CHKiWugH9BYCANg/l2XIHFfahS2srmpSdF4EGp3GmBQ1AO/A5SgDCSrfm1Xc6hef29LROxF6Tw60wjHZ7NnxLZu2DZmmayl21DbfBuNrvhfGgY1VwtinC/TP5TPtq3WAx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anN0eGFYNHBFUnFUdmw0RzBCZStYaWF0R3B0OGNPVnBUSVUrRVJ3YjVHTita?=
 =?utf-8?B?NkordE85K2xoU2hEbVRTTXlTSjRqa0JVTWloSVhuYU4zQjdaTmJNbm1OMTJm?=
 =?utf-8?B?K0pDZGtTMkFyaFlWOTF3aGxKYlpFK3NuQUM2ZUl4SEd1dlNuOGo3aWlWQVcz?=
 =?utf-8?B?M2xVbGFMeUd0bkNjZFRLek5pY2hiYndJaTF4NnRmSjY5OFJQZzhIVit2dFdE?=
 =?utf-8?B?UjlpRkQwcXJ6WG9ERGZmNUpXQ2VWUjZ6L2hCODN6bGk4RUpFdnRvZ0orbTkv?=
 =?utf-8?B?NUJ6WlVGTWtsZTl5MExuek94cGtia0x6alVEeDdVaFA3Rmx4eFdIZ2dKMTRD?=
 =?utf-8?B?TExXNEMveXVBSzNzM0ZpYWZQcEp5ZkhkU3Fib3V6dEM5UXVFSmlsMG9kNGJT?=
 =?utf-8?B?bUwzaGRrRkR5RW9ZendsTlM4UlZ2MVlheWtsVmIxY3JIZDZsaDg3RDVPakVy?=
 =?utf-8?B?MUFXaFpjZEZnd1VIbXN4M1hrN2pwMmhKUEt4OHlIQWNublp3eTRRUUNQU3pM?=
 =?utf-8?B?RE5kanJrOXQ1Q3Vud21mcnBRUU9XZ2Z4TFIzSW43L2p4OWlxeWVNa0g3d09C?=
 =?utf-8?B?N3VWNXhHMHhVa0hCSE9HMEZRMTZ5SXQweE5pZ1laeko2WDd5MnZiOS8za3Rz?=
 =?utf-8?B?ZVV0NzNnZWFuRmJaR3RrUTJVblFFV0RXdkVLV2tnNldNZGtLZEx1RDhNZGYy?=
 =?utf-8?B?UHNjeXgyN28vU3RiSktUMWlpNjVFZVdHSVV5Mzh5WDd4SlJPamh3T214M2hq?=
 =?utf-8?B?OTlBVDM2ZVE1NVhMWEZ0UFdGa2tpNjZwMGVTTzAvQitNZmhKU0xVV3I4byty?=
 =?utf-8?B?N3FNaVlGZVUyblpCZ1Z2TWdQbU13bTJUZG5OQzQyS2hFdWwvUWF4Q1pGcXJK?=
 =?utf-8?B?T0FEU1FXS2VsbzFJbVZSREpFb2ZqZU5DTlprWWlTZkEydGZVdmR3dHVCR2xH?=
 =?utf-8?B?NGNZRlFjcmlGN3FsWmZMUHNMbytRejlmZitpcXh6d0NCWk1oNGxKOTJzWmRt?=
 =?utf-8?B?bW9malNaNXRDSEE2M1RJdWY4NTczeGY4WXFTaU9ZMVUzMnNVeVdFUFhZUlBo?=
 =?utf-8?B?S3NZazN2QTIycU9vclhkUkRsdHdZMGw4RFV3ZXJ1QlpQTHloZURKRFl1c3ZP?=
 =?utf-8?B?K2tMbmVCZjlDNE41dGV0WXpOdkRsZW1qLzMvZXVpS1hzZkxYVC9XTjFUMU42?=
 =?utf-8?B?cjNMQmR1K2hhcXo1NUxVeGhBaFp1ZENUS2p0VHpIT0JENUZTU1h5WTJYa3ly?=
 =?utf-8?B?QXZEbWEvQllLRjF2WFAzVWkzQ25aYUtvc1hYMFB3bGZ6MUZDK0xFRmRKalVJ?=
 =?utf-8?B?S2o5RnhyVTZQaElXaTRURGdnQTZZZ3JUNGNYNlUvQi9maDBBa2VyZEJ3ZHF0?=
 =?utf-8?B?MFFocmpWYlZ5ZDVNNHdYOGZPUE8wQmk1K2hOMlIybGZJdWlRakpPSEl6bU5s?=
 =?utf-8?B?c09yWWZ0NVBJcUJxclRacGQwNGlFZXp3bUFJcUlHckFaVWNQNHVRZWJLT3RW?=
 =?utf-8?B?c2xLVUZHMzNRMWk3VHVqeE5FYURUN1k2b0RFY2tnekNDNzRhTllTMVl2T2tR?=
 =?utf-8?B?UlJPZXFyMFBWVVdlc0ZNR2VYa2dGd2VKSnBHejJkQ1ZoMkdLQjY5N0t1R3ds?=
 =?utf-8?B?T05tNTI3Z2pBQ0p1ZFI3Z2tROXdNZHYzQ1ZVdjFtcWt1OEE4dW5NTG9DdWxV?=
 =?utf-8?B?V0FmdnNVYW9BTitrUHBoaHVRS2pNaUcxcVFzK1J0VVNYbUVxUGlwMkpCbUFL?=
 =?utf-8?B?OTM5dHBpdWh3cEZsMStOa3NMSTRZdHlib2I3MXkzK3pIS3VOYU9VM2pzWWlI?=
 =?utf-8?B?bjVPVTFPbERwUHFVUWVLdmVRWk5Fa2QwNmtGeXo1TFozZ255c3BtbWZycTNU?=
 =?utf-8?B?ODhBdWFUMHkxc0dMTkJ0OGlYNG9yRGFrN25sbEtIM2hWZEYxbG8xdng2K2xQ?=
 =?utf-8?B?YnlyQ0c2amFubmpYTUNOcytKbzNSQUtoNmE0T3Z1emlTRVFlQzYwVVhSZ0Zz?=
 =?utf-8?B?QytTdFhUdit5aDhEbm93ejk5ejBWVzE3L3ROa0pWeks2R3kzYXMxNkxNc2cz?=
 =?utf-8?B?ZlpwT2l2RmlZV09Cd0pqQ0FwK25ma1UxbFYyemdNZkxuYlh0ZmdzK3hCK1lh?=
 =?utf-8?B?NG1DSFhxeWU5SW1xWXYzcE9UVWc4cmtoZWN2dkZubFo4VWdBd3I0NHZQdHVM?=
 =?utf-8?B?UzNhRVhQSzVhUzRKYnladkZIZHFiU2p5bDZvMGVoVjFURWxER0hzTjVUYXpt?=
 =?utf-8?B?TmFadFN0b2hUOGNxUW56UW9HWW5xaW5rN1dVSjR2WjFEaHVJZWtVK092c0VV?=
 =?utf-8?B?SklJUVh6TmtLTnFsQ1ZodlFYd2l2cmJiaUZrNW11OXVObmcwTllVRWZFKzY1?=
 =?utf-8?Q?K8t186Q7hADW3jNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53BA3E2AAFCCC54FA7E98F1C88422063@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UMoN9mNo+wbZaEFZXuXUJW8O+v9RZEFJOGh6DbFncPXTKstYn3qMxKkVtSjBQ8yp5G8nQ2IlU3apBbXcgIgFN3PU9HoEzuGi2NbAlhbl8WwBP6pjZ+fpT6QGOL1hnhf3C51jkHjzCZuaprWUgfGbzMmoiXdoOg5/WTWYY/gLwhZNjW+okxN3gwMXh+LCTjTBm4PV1l/18YaW1B3RLKj5asUqzDF9IQQD3iULPhlPfq+2f/79B9tJkbMNcKyks68bKtbuSLKxQYsj+KvcvdmM9wmd0rR3is+YhSZlHnPte5V6Hk7DQqUkTRb39TMHMIcPS4zxv6rfSL3aoiGayjkitA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7216380-d89b-4da1-4412-08deac6cf53c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 19:15:10.2940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzIUP8DAok1y2v3JYG/y24LSSSGfYhPSBAYg5M9BVDmepUfWSdlMydbLKk7a3BYa0Yr9VUk819J5eJFfqNesRbCE1tb4GlGioRkbiG3191w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
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

T24gV2VkLCAyMDI2LTA1LTA2IGF0IDExOjMxIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEZyb206IGd0YSA8Z3RhQERVVDQ2MzdOVkxQLmZtLmludGVsLmNvbT4KPiAK
PiBBbGxvdyB1c2VyIHRvIGNvbnRyb2wgd2hldGhlciB0aGUgbXVsdGktcXVldWUgc3dpdGNoIHNo
b3VsZAo+IGhhcHBlbiBhZnRlciBwYXJzaW5nIHRoZSBNSV9TRU1BUEhPUkVfV0FJVCBpbnN0cnVj
dGlvbiBvcgo+IG9ubHkgaWYgdGhlIGluc3RydWN0aW9uIGlzIHVuc3VjY2Vzc2Z1bCBpbiBnZXR0
aW5nIHRoZQo+IHNlbWFwaG9yZSwgdGh1cyBoYXZpbmcgdG8gd2FpdC4KPiAKPiBFbnN1cmUgdGhh
dCBpbiB4ZV9leGVjX211bHRpX3F1ZXVlQHByaW9yaXR5IHRlc3QsIHRoZSBtdWx0aS1xdWV1ZQo+
IHN3aXRjaCBoYXBwZW5zIG9ubHkgd2hlbiB0aGUgc3Bpbm5lciBoYXMgdG8gd2FpdCBmb3IgdGhl
IHNlbWFwaG9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJh
Cj4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+IC0tLQo+IMKgbGliL3hl
L3hlX3NwaW4uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMyArKysrKysr
LS0tLS0tCj4gwqBsaWIveGUveGVfc3Bpbi5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNiArKysrKy0KPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYyB8
wqAgMiArLQo+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfc3Bpbi5jIGIvbGliL3hlL3hlX3NwaW4u
Ywo+IGluZGV4IDRkYzExMGMyMjIuLjE0OTUyY2E5MGUgMTAwNjQ0Cj4gLS0tIGEvbGliL3hlL3hl
X3NwaW4uYwo+ICsrKyBiL2xpYi94ZS94ZV9zcGluLmMKPiBAQCAtMTc5LDE0ICsxNzksMTUgQEAg
dm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdAo+IHhlX3NwaW5f
b3B0cyAqb3B0cykKPiDCoMKgwqDCoMKgwqDCoMKgICogSW5zZXJ0IGEgTUlfU0VNQVBIT1JFX1dB
SVRfQ01EIGluc3RydWN0aW9uIHdpdGggY29uZGl0aW9uCj4gY29udHJvbGxlZAo+IMKgwqDCoMKg
wqDCoMKgwqAgKiBieSB0aGUgdXNlciB3aGljaCBhY3RzIGFzIGEgcXVldWUgc3dpdGNoIHBvaW50
IGluIG11bHRpCj4gcXVldWUgbW9kZS4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKg
wqDCoMKgaWYgKG9wdHMtPm11bHRpX3F1ZXVlX3N3aXRjaCkgewo+ICvCoMKgwqDCoMKgwqDCoGlm
IChvcHRzLT5tdWx0aV9xdWV1ZV9zd2l0Y2ggfHwgb3B0cy0KPiA+bXVsdGlfcXVldWVfc3dpdGNo
X29uX3dhaXQpIHsKCkkgZG9uJ3QgaGF2ZSBhbnkgcHJvYmxlbSB3aXRoIHRoZSB3YXkgeW91J3Jl
IGRvaW5nIHRoaXMuIEkgY2FuIHNlZSB3ZQptaWdodCB3YW50IHRvIHVzZSB0aGlzIHdpdGhvdXQg
bXVsdGkgcXVldWUgdGhvdWdoIGF0IHNvbWUgcG9pbnQsIHNvIGl0Cm1pZ2h0IGJlIG5pY2UgdG8g
aGF2ZSB0aGUgc3dpdGNoX29uX3dhaXQgYXMgYW4gb3B0aW9uIG9uIHRvcCBvZgptdWx0aV9xdWV1
ZV9zd2l0Y2ggLSBiYXNpY2FsbHkgcmVuYW1lIG11bHRpX3F1ZXVlX3N3aXRjaCB0bwpzZW1hcGhv
cmVfd2FpdCBvciBzb21ldGhpbmcgYW5kIHRoZW4gYWRkIHRoZSBtdWx0aV9xdWV1ZV9zd2l0Y2hf
b25fd2FpdAphcyBhbiBhZGRpdGlvbmFsIG9wdGlvbi4gQnV0IHRoYXQgYWxzbyBtZWFucyB3ZSBo
YXZlIHRvIGtlZXAgdHJhY2sgb2YgYQpzZXBhcmF0ZSBwYXJhbWV0ZXIgaW4geGVfc3Bpbl9pbml0
X29wdHMoKSBhbmQgc2luY2UgbXVsdGkgcXVldWUgaXMgdGhlCm9ubHkgdXNlciByaWdodCBub3cs
IGl0IG1pZ2h0IGJlIG92ZXJraWxsLgoKT3RoZXJ3aXNlIExHVE0uIFBsZWFzZSBhcHBseSB0aGUg
YXV0aG9yIHJlbGF0ZWQgY2hhbmdlcyBYaW4gaGFkCnJlcXVlc3RlZCBiZWZvcmUgbWVyZ2luZzoK
UmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3Qgd2FpdF9hZGRyID0gb3B0
cy0+YWRkciArIG9mZnNldG9mKHN0cnVjdAo+IHhlX3NwaW4sIHdhaXRfY29uZCk7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVpbnQzMl90IHNlbWFfY21kID0gTUlfU0VNQVBIT1JF
X1dBSVRfQ01EIHwKPiBNSV9TRU1BUEhPUkVfUE9MTCB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1JX1NFTUFQ
SE9SRV9TQURfRVFfU0REIHwgMzsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzcGluLT5iYXRjaFtiKytdID0gTUlfU0VNQVBIT1JFX1dBSVRfQ01EIHwKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNSV9T
RU1BUEhPUkVfUE9MTCB8Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTUlfU0VNQVBIT1JFX1FVRVVFX1NXSVRDSF9NT0RFIHwK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBNSV9TRU1BUEhPUkVfU0FEX0VRX1NERCB8Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMzsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKG9wdHMtPm11bHRpX3F1ZXVlX3N3aXRjaF9vbl93YWl0
KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VtYV9j
bWQgfD0gTUlfU0VNQVBIT1JFX1FVRVVFX1NXSVRDSF9NT0RFOwo+ICsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IHNlbWFfY21kOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IDA7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gd2FpdF9hZGRyOwo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IHdhaXRfYWRk
ciA+PiAzMjsKPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3NwaW4uaCBiL2xpYi94ZS94ZV9zcGlu
LmgKPiBpbmRleCAzMTE1NDk5N2I5Li5kYjBmZWJkOGFiIDEwMDY0NAo+IC0tLSBhL2xpYi94ZS94
ZV9zcGluLmgKPiArKysgYi9saWIveGUveGVfc3Bpbi5oCj4gQEAgLTQ2LDcgKzQ2LDEwIEBAIHN0
cnVjdCB4ZV9zcGluX21lbV9jb3B5IHsKPiDCoCAqIHN0cnVjdCB4ZV9zcGluX29wdHMKPiDCoCAq
IEBhZGRyOiBvZmZzZXQgb2Ygc3Bpbm5lciB3aXRoaW4gdm0KPiDCoCAqIEBwcmVlbXB0OiBhbGxv
dyBzcGlubmVyIHRvIGJlIHByZWVtcHRlZCBvciBub3QKPiAtICogQG11bHRpX3F1ZXVlX3N3aXRj
aDogQWRkIGEgbXVsdGktcXVldWUgc3dpdGNoIHBvaW50Cj4gKyAqIEBtdWx0aV9xdWV1ZV9zd2l0
Y2g6IEFkZCBhIFNFTUFQSE9SRV9XQUlUIG11bHRpLXF1ZXVlIHN3aXRjaAo+IHBvaW50Cj4gKyAq
IGFuZCBoYXZlIHRoZSBxdWV1ZSBzd2l0Y2ggaGFwcGVuIGFmdGVyIGNvbW1hbmQgaXMgcGFyc2Vk
Lgo+ICsgKiBAbXVsdGlfcXVldWVfc3dpdGNoX29uX3dhaXQ6IEFkZCBhIFNFTUFQSE9SRV9XQUlU
IG11bHRpLXF1ZXVlCj4gc3dpdGNoIHBvaW50Cj4gKyAqIGFuZCBoYXZlIHRoZSBxdWV1ZSBzd2l0
Y2ggb25seSBoYXBwZW4gaWYgd2FpdGluZyBvbiB0aGUKPiBzZW1hcGhvcmUuCj4gwqAgKiBAY3R4
X3RpY2tzOiBudW1iZXIgb2YgdGlja3MgYWZ0ZXIgd2hpY2ggc3Bpbm5lciBpcyBzdG9wcGVkLAo+
IGFwcGxpZWQgaWYgPiAwCj4gwqAgKiBAbWVtX2NvcHk6IGNvbnRhaW5lciBvZiBvYmplY3RzIHVz
ZWQgZm9yIG1lbW9yeSBjb3B5IChvcHRpb25hbCkKPiDCoCAqCj4gQEAgLTU2LDYgKzU5LDcgQEAg
c3RydWN0IHhlX3NwaW5fb3B0cyB7Cj4gwqDCoMKgwqDCoMKgwqDCoHVpbnQ2NF90IGFkZHI7Cj4g
wqDCoMKgwqDCoMKgwqDCoGJvb2wgcHJlZW1wdDsKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBtdWx0
aV9xdWV1ZV9zd2l0Y2g7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBtdWx0aV9xdWV1ZV9zd2l0Y2hf
b25fd2FpdDsKPiDCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgY3R4X3RpY2tzOwo+IMKgwqDCoMKg
wqDCoMKgwqBib29sIHdyaXRlX3RpbWVzdGFtcDsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X3NwaW5fbWVtX2NvcHkgKm1lbV9jb3B5Owo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9l
eGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+
IGluZGV4IDA0Nzk1NTRiYjYuLjZmOTBjM2U0ZTggMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaW50ZWwv
eGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9x
dWV1ZS5jCj4gQEAgLTQ1OSw3ICs0NTksNyBAQCBfX3Rlc3RfcHJpb3JpdHkoaW50IGZkLCBzdHJ1
Y3QKPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksCj4gwqDCoMKgwqDCoMKgwqDC
oGZvciAoaSA9IDA7IGkgPCBudW1fcXVldWVzOyBpKyspIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHVpbnQ2NF90IHNwaW5fYWRkciA9IGFkZHIgKyBpICogc2l6ZW9mKHN0cnVj
dAo+IHhlX3NwaW4pOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3Nw
aW5faW5pdF9vcHRzKHNwaW5baV0sIC5hZGRyID0gc3Bpbl9hZGRyLAo+IC5tdWx0aV9xdWV1ZV9z
d2l0Y2ggPSB0cnVlLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2lu
aXRfb3B0cyhzcGluW2ldLCAuYWRkciA9IHNwaW5fYWRkciwKPiAubXVsdGlfcXVldWVfc3dpdGNo
X29uX3dhaXQgPSB0cnVlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAud3JpdGVfdGltZXN0YW1wID0gdHJ1ZSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogUHJlLXNldCBhbGwgc3Bpbm5lcnMgdG8gcHJlZW1wdC13YWl0IHNvIGVh
Y2gKPiBxdWV1ZSwgb25jZQoK

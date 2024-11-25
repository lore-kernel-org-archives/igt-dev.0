Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEF7D3B7F5
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 09:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C7610E3B7;
	Mon, 25 Nov 2024 09:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYMcKHpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F8F10E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732528720; x=1764064720;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=4C34pNVFYCcxy9aVOGpDHJvmJylBXLdoKyVEcAn6l5U=;
 b=CYMcKHpxjc5iEofWWGI6aqjdRRx1+zQJqn/RVvcXU8q7CGsC4ArjVNTR
 2Vmv3VvGTv+0cDwk7zLpiMWMbZnN6qhuA01yOtHVJ1YLsPW8hQzwVoaa/
 cRtXZwi6EJwfGR2pzIiLUpSvhUJ7YsgRnbMepw9zip0m3HgMoQoUTOjHj
 H/QrPNdd268p4TTuVnkr5tNCguGBzN5FXyvMY3OBnwdubF9zbcOeL14h8
 0TNCN5eGxRWiZfrByS0Yo2QQ3x4fHESB/ph1ppNaKZw35FcQeDhA9R5y6
 i6K07SkBc5FLShuaeQFgqdwvtWWthf4imSyMopSKUsSdypiOTBhPLLhBp A==;
X-CSE-ConnectionGUID: JNklCEPTShSkeybaTP7anA==
X-CSE-MsgGUID: zEmQojlZQu2Sp6/h54fnSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36406219"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="36406219"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:58:39 -0800
X-CSE-ConnectionGUID: l1xIcWEESUiLGpXEkwsjvg==
X-CSE-MsgGUID: fQKNGavgTOm/7MkP0Ku8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="122060300"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 01:58:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 01:58:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 01:58:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 01:58:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvbH5ubXp8IBdD0Ja0VyQIpe0c2YtE2LJqeqOQf2DKOh5Z7CgSQyUHAVYNhGeauUCcRL3PoZnSUb9MHcZJXNnQKEnj9oV2SseF0C65hXAGVvEgVtL4k5Dmno53Qv95ztnSTGliUqHvjRvJ8FgpEC5ZLdEQU09HqI7K6eIUVTMCW0Mb/l/+LJhElP7P7Pgi9bc2aVyCiO3Bpuoxk18PNujS06ojuS1orv9D5FKcjCMh74gX+cPTgdQMsDykQXqBxC46WmYgIcqRhCrNjr2O5jX/JflGgqVlydrmLKQVm+/4ox05BSvrMwhw/Xh7q1WVO9PcbDJGS6G5svEVRmT4nYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C34pNVFYCcxy9aVOGpDHJvmJylBXLdoKyVEcAn6l5U=;
 b=F3BH81nwC3xo58zK4qPXvHr3WQCx7wz8xzFgW9kkSMc74C3Yu4dsxJclks2kdLILjzyv/HfZ2NdELPljE6rLXiZH5Y71b22JkPs6Fckk6iohSEFtkWZOqHra1jcagVDhrKMGzzfN6RwTDy9Z3ivt2vKXNRjZqpOQvW1J4zI//QfhWq9L0y562Cfo1UZCFhUa77uGmKH1qym8OMbmXWg//lbvBuQJe73D9eG0uCFo9q2ny32pxf6enq/XgODicJsltV1z0T/BKmk4sjGrNfh1shPJOGDrFUy63gSlPJXV5FqWNCGEV7OHuGkcgt3yFa36BkzQny2AVr+74IYrgh8hVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Mon, 25 Nov
 2024 09:58:34 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:58:27 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] intel_compute: Use valid number of array size for
 unbind
Thread-Topic: [PATCH i-g-t] intel_compute: Use valid number of array size for
 unbind
Thread-Index: AQHbPMl4zhGaOR3je0eoVQklK28F77LHx5EA
Date: Mon, 25 Nov 2024 09:58:27 +0000
Message-ID: <d8100bbd251774db0ff72a35b422afdf2d28a1e7.camel@intel.com>
References: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH8PR11MB7021:EE_
x-ms-office365-filtering-correlation-id: 05bf11bc-dc66-4c76-2605-08dd0d37b5b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VEcrZFZlUVJEaGRzWUQvNXpBMXovZ1dJcFdsZXA4Y1Fyck9KTWNJa0VCTlUr?=
 =?utf-8?B?YWpBVC95WVRUcTZ1S1R6V2RZZXZoOG5vUVB1YWt3cDlDTUluYVhsZ0ZtT0M2?=
 =?utf-8?B?bzc3WENieEMzSWNaaUNEMGFOQ25LczNiMXkzKzRRRDBHdkJzcUQzdjI5cWVv?=
 =?utf-8?B?UHZzSm9wQm9lekdVL25hQjdCeVl1ajk4cXhqR0htcFhWRHVLQXhpV1dmVVp6?=
 =?utf-8?B?UHZ0SFkybXAyNS9Wai9sZnlvTno1YUlUbTJTbitYY1VjdmE2R3VzdnRmRTlV?=
 =?utf-8?B?RjduT2xURjBrQWpJS3RkdTA4bzduRDAvR2lFQUV0UktXK1BZSGxJTnh2a244?=
 =?utf-8?B?UTNlNnliclFhRllUZEZ4NnZpTVBhY3kxbTdoMlR0ZGlkdFVJSVZYaHVBVlpi?=
 =?utf-8?B?VnVaUFRqZFg1bmxmeTdyS0NrTVg4TDdYTnMwanVRemhkTjFNZjZET2Z0NVVD?=
 =?utf-8?B?MlFlL0ZDT3FmMDIyR0JtbXNhWmc4RThLM1NteVpXMFBDSTRrb25CdDVHTjVj?=
 =?utf-8?B?a3ljUjU3OEJzSHhwbk96bzI5d25CMEE5UnczQnJGL0pObHFXNm03VGZldnpx?=
 =?utf-8?B?Vld6YmdxcytNM2dKYUlZcGhKcE1VTnZ1SmJpNHVaM25kQ21FZTdmSENGU3h1?=
 =?utf-8?B?WTZSTzhjd2IwekxTWk1TRVNZVFU2c0U2YUo2YnRkZzRXenl1QUFjQ29BQ2Yy?=
 =?utf-8?B?dkNXb3JOa0RUeGtCWVJ2WGM3ZEhEeS9PaE53SG5IVno3VURZS1l3aUlBa0t3?=
 =?utf-8?B?c2crekRQSmpQeDRva3hzZjBwRWZtcmIvdnNqZ0tublgycTd3S2hyNVMvY1la?=
 =?utf-8?B?bVg1VENqZkd4SzJja25YQmZWRkNIV1c2Y1BMN0hXRG5Za0d3VFNIOWtlQVBx?=
 =?utf-8?B?alZNQkplZWxUZnNHRDFSOGZrQVFUTmdjYjYzRlo0ZVdyRzI5OWh1Sm1OUDNo?=
 =?utf-8?B?M1NwUk54Z0hzVElmM05iSThkRlBVZklxaStZc2p4eWxPM0xmbnU4dWh4MzZL?=
 =?utf-8?B?RWw0S2N4SU9zWUNjcWtUQnhyUUFDRXh4N20yRHJYVHh3a0h4NHUrMnNXOWRy?=
 =?utf-8?B?Q2t3WjRXZHRNWGVwM0NKenR0VkpBeXZYeXBjUEp0T1U5UkdHUW41Z2xBSjRm?=
 =?utf-8?B?Vy9sc2xtSU9uWjhVcGtzb3o0amQrUzF2VGVkMjJXMWE4ais3c0N3ZU1NSmE2?=
 =?utf-8?B?WlB3MGdoZW5RVVRkaTNVRk5iMnNSQzJVd2ZRNmdrRk9aY283WWtjMnBKRXMx?=
 =?utf-8?B?RXJ5YWhrTHZoNlBNOXhmeWUvM0hlM0VJVTljYWhnS0lkSlpTZ3BpeHhpVFd6?=
 =?utf-8?B?SHVtOXB2UTBYR1BYTEx2VkcwQlU1alMxTlhBWHNaOCsxV1VESW5WbEREYUFG?=
 =?utf-8?B?WmlIMnF5RGxFMDNoMi9HRkNZREdjOUlpL3BDS1dyMk90WW4wL1g3UTJ1OUNa?=
 =?utf-8?B?SUFxdEdON3NaRGRQUUtkS3VLT1V3bnIvbjgzYklaVWlYMFpReGRUSisvNk1T?=
 =?utf-8?B?a2IzeHdmN1E5S0pBbW0xUkZneGo5Rk1JZkc0UVJFbzZHTFo2Z2N6clVNRWMz?=
 =?utf-8?B?VGVId3llSVZ3RkJjQjF3TVk2dlJ1RXVZWklVMzNKNjhwR21GVEthaVdrY0dN?=
 =?utf-8?B?SUc0b1h5NmhadHhTcTN4b1ErK3hkUVZBbE15Q3RxaG9xanh4K3FaS0xGMStu?=
 =?utf-8?B?NHJmcC83ZDMzc1VMWnJTa0FCdWRMdkpTSTBNWmllUHBxRmpWNTdwVkh4ZFJR?=
 =?utf-8?B?YlNURjBvMThtVmUzdTYrSVBPMGpFdWFEY0VtZHhmU2hhdzA3UmNlVm9LVzJ3?=
 =?utf-8?B?OGxRQytxSmI4cXRiaU95SjU5TzJqc25xNVVVS3dlR2VUczd2dS9oald1Wjds?=
 =?utf-8?B?eVNJeGRxWXpaMXI4eDlnSHBkWnVFd3NzQVgxMGhOKzZWS1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVpydjQxZzNmK0RoVE5ETVUxMG1aN1hxY05MajEvWTRXOUhlTFFZMHR1V01u?=
 =?utf-8?B?QUdVSDNvVU9uclJkcXZmRWR5WXVhWmxiQStCQWk0K3RaMDB0ZHZzN29zTmJJ?=
 =?utf-8?B?aGE3eU9MSWpMYXR4d2Y5enA3WkUvV3F0bk8rUnQ5bVpIbWxjYm1KNGVMaml6?=
 =?utf-8?B?OUtvMnpjS05yTURyc1YrUWRpb3czbmVweUNqall6cnU5RDNDY1BVVjY5T3ND?=
 =?utf-8?B?cG80OG5XK0ZSV1RVMFhkMnVYVkF5VmVTRDlRdVFoQ1F4RzZDbGlxUUpSSEFJ?=
 =?utf-8?B?QmdkQ2dLeE1kQ3NKdU5uZ2FzeUN6SXY4TGU2aEltWWNqQy82MEY2UXdTQytv?=
 =?utf-8?B?dXN1Q3E1bjk2bWxCUVN3ODBxcGZMODBSU1BpN2ZFU2V6Ykl4eFNTZmxJWlhP?=
 =?utf-8?B?YmxiQkJlNkVjbnBocGZoQnJ4L2tyT2FRVGlQOVJLbE41WXpYNWQ2eTd2VDgz?=
 =?utf-8?B?bVRCdzVtT3I2V01CZUhEMkZiVENudXJDODU0VHNWeEx3cnY4Y0w2NlR2OUU4?=
 =?utf-8?B?MWdqV1VaQ1dvTlRRS2JnL1NNajVKZStkQUgvTUlwQVRUSjJVR0xWRDc1ZXNx?=
 =?utf-8?B?RmtyMUF4Q1VRSEtlK0Vsb2tsN0o4QUtCTzc3THZVMFJXRkY0bFV6N1JKUTl0?=
 =?utf-8?B?SEJrRDFDWWluM3JWVXY2cy9kWGUrMHhWYyt1NFhRN1dWRHlKY2tqTXEwS0Vq?=
 =?utf-8?B?R0xtWVRIdDJ4UHFLVTFkUitrbE52eWg1dk1meHc0cjlJZ0s4K2ZLS01Ydmk3?=
 =?utf-8?B?Q3ZUK0hGb2hGMXFoSU50MGpHVmVXUWpuTFdBeFhON0JlbkZXTFJrQ1gySCsv?=
 =?utf-8?B?dWlCNnFsV3FncWE2Ull4Ky8yMjVkOU13VmR2Vkt4MVdWUU1yTEZRMVpBT0ZJ?=
 =?utf-8?B?ZUdOVVZBTnk5Y2hDaDZ0dGhHQkliaVhIR01KZE1ORlV2d2dHRHFlMkZxZ2JQ?=
 =?utf-8?B?UDZRK2d1SGg3Zm5uN21mM2dwK2I2bFFOU1lZWW9zRGx4aVdKd0VYUFcvTVp0?=
 =?utf-8?B?U3Z3OWs2SithdzMwUzhDNGVtNGQ5YUtoY0xYb1RmUU5kVGYra1pXem5jQURy?=
 =?utf-8?B?SmFCWjRpRjhRUkdsb21NVzEyVWNTUnBFMTFsaTVmU2ZaaU85dmFFY2tOVTNF?=
 =?utf-8?B?d3NGbjlxeXZ4bEVZTjJ6TTB5NWZQMU8rNnE0RHBkYlh6bDR6WGp5WTd5NXM2?=
 =?utf-8?B?MUk4bVRZZjRkYVErVitleE9BQUp4NUlJQ2EvQVhlL0ZQMDdTMEswdnMzM3Fx?=
 =?utf-8?B?MXB1RVI5cGc5NDA4UlJWc1liOFkxWFZONzdKbGV6N2NselhUdXVic0NJTDBH?=
 =?utf-8?B?NStnUlZkZmlydWJnaW9aM3ZJbUpheVVYMUFNRjdmNW5DVmVvMFc1V0wwUm9s?=
 =?utf-8?B?SWJvY0tkd0JHcmZ0eW94aEhXMTQxcVdqdVZ0RW5KRjZGT2lvMUh6dzdoTGV0?=
 =?utf-8?B?MmRQMExsSithZnk2eHU3d256bjdyZ0NuaXVnYm1na1FELzljV2d2YjhsM2xm?=
 =?utf-8?B?TlR6TmhZNi9zdkpWaklSM1JWUmRoVUh4TE93aWwvK3Q1M01iVmpLWWhwd2E5?=
 =?utf-8?B?bzBaQS9GZk5BNm9sc0pCZFpLRCt6LzJBamxkdTlpeDR0V05pRHJYNXhXamZK?=
 =?utf-8?B?WHdiT3JGMmwrRlBXbFUvaTBWVkp2YjV5WmpBdi9RVlRXTGVjZEJzb21JTjU5?=
 =?utf-8?B?ZjFjbVdDNUdTZGxvcHZpc3BCYnp3SDEyUFFOUTllNkRxS25hSEtmakR2SVR5?=
 =?utf-8?B?VWxzUDVDMnhMVG9URGtKazRVVERUU1VlVGNMVVpGWmlvdjZ6L3Z6VytEN2FP?=
 =?utf-8?B?cTQ1ZmFMSDVWTzF5K1NFelI1aklhcFprR0IvaUhRYS92eVppc2FsbTZNOWx5?=
 =?utf-8?B?czVnWFB2b0Zlb1V4MGJYSGEraE40YWtId2ZGcTl5WUU4QzZwamhac2pFZzBX?=
 =?utf-8?B?U1J6OXk5bm1qUDE3N1UwemdmY0h3UkVZWC9ZOUhGM05DeWRtdkFNV2RZM3hl?=
 =?utf-8?B?WG1aZlQrdE0xQmkvTmowbWNYOURhWThzeDg5RzRibGRGdUJTdEdiMGRvSzNI?=
 =?utf-8?B?UGdNL0owaEh6RmcyOVBLTTBjbnNTNXAzaFRodWxLS2ZFR2t5Wm5UMXhtUHlo?=
 =?utf-8?B?VGVwSk9oNElCQ1BtRW9aSldGUFFnblFxcmNESHpQdFQ5bStYMzBKV0QraVR3?=
 =?utf-8?Q?r9TdI7eM1GLY+vNU7hj5UHc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <762CAF927DAFB247965D090F8938CF1D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bf11bc-dc66-4c76-2605-08dd0d37b5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 09:58:27.8814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bs7dwKoHdIFSxOVzTyohR6GFq93AmC4DfjI9fZ4tWB+BoLRwjMYO8rEtVm3OOIG9xjt/5Mwh3lUfdFunPxDnwdRqUP+K8Yc6mV2Sw9VGD+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
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

T24gRnJpLCAyMDI0LTExLTIyIGF0IDExOjI5ICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IER1ZSB0byBjb3B5LXBhc3RlIG51bWJlciBvZiBlbGVtZW50cyBmb3IgdW5iaW5k
IGlzIHdyb25nIGZvciB4ZTIuDQo+IEZpeCB0aGlzIGFzIGl0IHNob3VsZCBiZSBwYWlyZWQgd2l0
aCBiaW5kLg0KPiANCj4gVGhpcyBpcyBsaWtlbHkgc3ViamVjdCBmb3IgcmVmYWN0b3IgYW5kIHVz
ZSBBUlJBWV9TSVpFKCkgYnV0IGF0IHRoZQ0KPiBtb21lbnQgaXQncyBhIHF1aWNrZml4LiBMdWNr
aWx5IG51bWJlciBvciBlbnRyaWVzIHZhbHVlIHdhcyBzbWFsbGVyDQo+IHRoYW4gZm9yIGJpbmQg
c28gd2UgZGlkbid0IG5vdGljZSB0aGUgZmFpbHVyZSwgb25seSB0aGVyZSB3ZXJlIHNvbWUNCj4g
ZGFuZ2xpbmcgdm1hcyBpbiB0aGUgdm0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBL
ZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCg0KR29vZCBzcG90
LiBJdCBpczoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdv
cnpla0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2ludGVsX2NvbXB1dGUuYyB8IDIgKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2xpYi9pbnRlbF9jb21wdXRlLmMgYi9saWIvaW50ZWxfY29tcHV0ZS5jDQo+IGlu
ZGV4IDNhYjlhY2U3OTMuLjg3OTkyOGFiNjQgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pbnRlbF9jb21w
dXRlLmMNCj4gKysrIGIvbGliL2ludGVsX2NvbXB1dGUuYw0KPiBAQCAtMTQwNiw3ICsxNDA2LDcg
QEAgc3RhdGljIHZvaWQgeGUybHBnX2NvbXB1dGVfZXhlYyhpbnQgZmQsIGNvbnN0IHVuc2lnbmVk
IGNoYXIgKmtlcm5lbCwNCj4gIAkJaWd0X2Fzc2VydChmMSA9PSBmMiAqIGYyKTsNCj4gIAl9DQo+
ICANCj4gLQlib19leGVjZW52X3VuYmluZCgmZXhlY2VudiwgYm9fZGljdCwgWEVIUENfQk9fRElD
VF9FTlRSSUVTKTsNCj4gKwlib19leGVjZW52X3VuYmluZCgmZXhlY2VudiwgYm9fZGljdCwgWEUy
X0JPX0RJQ1RfRU5UUklFUyk7DQo+ICAJYm9fZXhlY2Vudl9kZXN0cm95KCZleGVjZW52KTsNCj4g
IH0NCj4gIA0KDQo=

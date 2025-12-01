Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0884ED116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EE210E3D8;
	Mon,  1 Dec 2025 13:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+M1gFqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02F810E3D8
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764595039; x=1796131039;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+JGr2NnccLL3f2V15WeUuR2gRbA3foLy8iAwX0oel7s=;
 b=T+M1gFqFJMKnd5uKUiaLLL9LkeVauTUkFiVXgoO+tUMQpdTnjXmUQ7S7
 XtLahJQvAFuMAYud17wFTM1byMFYuR1C++dJeMdeqUoYBPTjQKBV99Ci0
 nsePb/WSjtdeqSekT6GNVLScNP5x9NqQjYRf6RLFEpY1Wke6mrR8C1x0p
 P3iIZrLqMEj6t1vsDsE3wVLRCvpO4HpqrLiwnQyFojzQK+2dWtQ6FJ5d5
 o7iUSb2rpmaCOV+ye8gTOuvsHo4DNF/Zjfbx+tKp6lWEe19udVoPov6PG
 DKvuO/WWBgtUyFsaX/X9phRyR3TbVNX36fqp9HYgAC8WwZ4pZU4S0Iai6 w==;
X-CSE-ConnectionGUID: Gjtm5gSzSayptgFgyF9MnA==
X-CSE-MsgGUID: aWksLG7BTaOKfzO17yv6PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89182959"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="89182959"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:17:19 -0800
X-CSE-ConnectionGUID: mtezgqEsS8+9OXe7eep5FQ==
X-CSE-MsgGUID: 7YMfc4M2S+68U4DjbnvDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194272182"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:17:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:17:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:17:17 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:17:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0bKeITi8cFB82Ar3HP9xy/ZJrvz13Psh9iVHnHm1wqhdyh2AjUWmAYiaUzOyNqqX+/QpXg0GVGic/wktvKxgb0ZwYQE9OmUtkr2eC1+u60eCDfcQMSQfjzXQrP4c+8d06mE/c16Q5B0s6clnrpqrZEUcbgsnMPmjHym+tqna8eLbUrm8KvG1kvHMIeEYFpoXqxfiz8+UUM8u93G+iuz0SZ2C6WsjIwKQCokIeMve02nkm/1C3ad9r4srfWELheJk3ZoYP6UaaHHfGB3Tw0qf4xRQlxmo9TEbuwuMGWehaQ9zI/VITN+Lz2X1ojhp4V/TB5tJ7hPEHqjaA5XqoWodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3tOJoIB1/W9ILT9cYiOL1z2RQ/frcf/y586UtklmgU=;
 b=zKHb55R6XXIvZLPiKLI1AaqH0XxdrY0RIZl4l9wpSn7XBsu8z3z7uxVHrH5DTQL2cwjYtyzi6FoSOfNfLip4PUlCSBneuJb3ib1AyqK18bQksIYFybg2hoENvTlqzLXj9ZIWWnlEsoMDVTmVUItsg/mQiHWHZJjbMRrTZXuzFxasEig3h5UxgbDnashFjhaLpX6IOZrPyDSZOSmNBlTenVVHr8wASoH8zid1GIOcGZJxxHlE55Yf7pb0DQagJ3PTlrU48Aq1LDOAFA4+fbpQPgu4345en1YyVl5bEfWnOQKtz09Bc85cPh75YSs+NKzO1vcQrRrNwB/xZQkcuY0q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:17:08 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:17:08 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 05/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU coherency test
Thread-Topic: [PATCH i-g-t v9 05/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU coherency test
Thread-Index: AQHcYqFyytOfF+K0f06xlspbiDjkirUMxEQQ
Date: Mon, 1 Dec 2025 13:17:07 +0000
Message-ID: <BL1PR11MB55250370713E96C229F365B084DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-6-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-6-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: 6a9b8014-2c65-49bb-502b-08de30dbede5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RwLNWFpkQHCGTjt4WWIRO2W9xxG33mxWeAlEuoYSyX6WDIzQI7H3Yqn+Dqpq?=
 =?us-ascii?Q?gTHoumKnLTiSYzMHfbkATnUvECu1Y6Y4CuPqq2MPqeyzcYS4aoxgv8SAikBg?=
 =?us-ascii?Q?mg+swIG7f7q6V0lwWtgFnMnh4vdt8VJCrwk9YJDdlPCIz9SBK5g6Yi5sGE7B?=
 =?us-ascii?Q?CKn107TqSwIctPr5cPGhdmtY0lTLncsFfHfXkgeHnN8ZuptkAaJh3vId/1Bn?=
 =?us-ascii?Q?9UduRphG7NIFFbI1FOBVVEaoiE3SXrOH9Z8Od6KUgeJDjHBOIdlYwPrCFesl?=
 =?us-ascii?Q?OXC5iffd/22fCrMIZaRQBFnAztKTmKWeFatMl71murClxncMQnHVPz3am7oH?=
 =?us-ascii?Q?w8sP0yCnlAWxna5og8cu37Ijtx8oM0Qn/ju4OobAHtOZpF5h8Msm0mpUxRu3?=
 =?us-ascii?Q?f7eFhrGDK6B082IPCXQzR6ZQCY+M/iQJ3mjCQpns7n1RsjLXGgHbsbOB6ta/?=
 =?us-ascii?Q?pmDnfBJCBcT/tkkufhr+MTdSBlJMMyWNR33YHw8gvGLQcr6w0a7ZJ5JCGrK/?=
 =?us-ascii?Q?qUq8lt0r+g60GpA38L2QGgQ3C4htSrwNGC1GYpbUyIAL4n8/c48BqHqQUh4Z?=
 =?us-ascii?Q?Ox/EBIK/Xkx3stXI/Qp/lQdbf24GegxPodBuF2qg8lsYcXOCrrTAO1zcTU5e?=
 =?us-ascii?Q?mwqQKI3tfhpht04J5+K1jqML6ApNxPcWhiy0ssARMSKaCZYo5Tqryw9A9D0B?=
 =?us-ascii?Q?GpyW9SMk/TrvVxUiid8ywL3anti//phSCB2WMvCsW/3lvZdoi5Lhe8u18r5e?=
 =?us-ascii?Q?xGjKTYvcE7B0pX+H+gcCT6eZf1HLXsWH1p0xchhraUYRdeZGgo9wVMr4ecK9?=
 =?us-ascii?Q?rwcM2LYMnEvfvW/e53naJ+aunLg9wVuDj9eNCsLV3kmROTe0XetQaAqGNWXm?=
 =?us-ascii?Q?vdeTUSauTdi8Nhazz/M3gwLlbWhfIl1VJnFvflHE4eRdv0MZMKFRFKsPsqrw?=
 =?us-ascii?Q?tIoHWQUYbSRkQI0RQh1QFFMZUj2m/vBmZmB9+2KeNQkSfUXnwXbd0Gc3S8aP?=
 =?us-ascii?Q?evEAwQZwM9hEchpGx2hoNZ/pkuZEGnsH9vqq9iZw/s6zvnW15BsJW/7QVEqL?=
 =?us-ascii?Q?YqT0bUqHl+SfIQfkCJ4uvaB1U3DXacQdr2nUxy4zzJ0t3ogmjF4twsnkjrN/?=
 =?us-ascii?Q?mEomfGUhlP3E0WS63bi22ra4qwMG3CETcL0eHXdJuTN6+jCwBNXZl1+/DoIl?=
 =?us-ascii?Q?wPnkoI+MBa+ApbTp7oh2nuTdnwsUxLcMl+eRErUhRQcCD3mLaWcABvW0NRo6?=
 =?us-ascii?Q?oEhpgT74NEYb4z4eWts5oIJYvnKdqp3jMfE6n/DiWwzI6Sjyyx5zC0MHIhCR?=
 =?us-ascii?Q?SSB2tqnVmR5wZpPaAop5lW9JHWCoePE6iqgyVGVhMVgE9SjJhGxKNnMTZTLj?=
 =?us-ascii?Q?ntGPZ/dPPViISKWj1lHpQG88oQGFtwjGL9TkpeMKLH7fvdV7lJp+UKh9zMvN?=
 =?us-ascii?Q?PwvuWY0D/uav2sjgUxFaApYF+cHiHtV5PxPAG0Ucp9M7lKQ3ZYJl4h5Sui2T?=
 =?us-ascii?Q?UXS92XKVjIOLcvXhCXSmDfaRP6nMAo5oFupl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cvEBKLxRX7UZdQRrquj+Bk3MNPzxRN9xllOgCuC7dqeTNse9g2bdK408z3iJ?=
 =?us-ascii?Q?TFjyyKLQloc9ySRYMv7ia17nx0eHKNUxwMiojnGahRWHl+b2LLbs4eyj3G1z?=
 =?us-ascii?Q?SW4NpUCEHY9YY3X1VYVJXHnDrnnkeONJiGvPrKH+f+IE5MI4gmrYgdXu6H+H?=
 =?us-ascii?Q?ax0X56oq1yNBoQqOuLwt1H/NXy+28KYR2NAr1M/OTb/ryUhJkO4lAc7h6ehr?=
 =?us-ascii?Q?pbQP7j4bfPe64H8EFX2IN2QMhsvp3sSWeWiqi5vhpza1H68AGfJuNRXk3QqT?=
 =?us-ascii?Q?/0tWcy1suWCt5YzlElghReEgaNjtkvvVLUZKxqhTkYpHU9WM8gG2SGSF1+F7?=
 =?us-ascii?Q?3ywgo7PWbOppSiLzlV+hXOK1EnlgQOc320Rhq1KHE2vmhF8ayyF3qrzFY407?=
 =?us-ascii?Q?GM+nYXAASYI5USTHfMmmmz8LYdjQR+m5dhSVZLj+qoxTJBEgH8Lr+wlxRCI7?=
 =?us-ascii?Q?FCt5yObSHvIrLC54R+5vLKOhDuq8c9qI9lto3I+MX+elQzD76Wyc2HgPHY7e?=
 =?us-ascii?Q?+FUrG7MBCui4SmOh8iZT0q4VXUIMUKUJwzwyxecEyUfOOw6t9bdGlNDQ96p+?=
 =?us-ascii?Q?3PO7gi5KYfyhUjjpCbRGXJDYK2TduWoMes4i7PGKWZmgb+xaOFKA1nzVl32Q?=
 =?us-ascii?Q?MGxZ2gRE33FLu+HbFbMARnQ9DcCW5qGkgNwkohWp3rsCypPt/fWWbLRtqM6x?=
 =?us-ascii?Q?pPhqu/DDPDsrYgL7rD4V0UqJOn/SSmmvpXYgwSzGqd/DAhOPzMAdw/F4U2lL?=
 =?us-ascii?Q?d/n3m7iFLE6B1/esn4zpQQUaB0ZW6nLim8teduNgXJRHPbSlID8Bk7bT8oAK?=
 =?us-ascii?Q?6ctv1gVUXEH19aSxIlqbRd1JzGs8L8X2MFFnhB8AgifqPZpcLhT6ukk54aQt?=
 =?us-ascii?Q?mk5u0N6Ci/RN43X3PQ9S4tsngbLcPV8pnBh6klo50c4RtzzHwvQLV/RYGqNc?=
 =?us-ascii?Q?Vy0OYCpyuDgQ/jt5lKjFrnPVY1Zk3FNHt3SnbPefJZAYuaAw5dh1wuofmxMA?=
 =?us-ascii?Q?LAPPTLdWwY3bIOk1RRKX0pXqaHFPusGq6WCmgguAQqIOhF0+NuNb9kmkdqzG?=
 =?us-ascii?Q?teLbSOIqNifWtBASWVoU3042cy6GTjNRehLlAPJa2Ew8Fyxtd396fWJUahTX?=
 =?us-ascii?Q?9WNMQ9FfvThbDXEfhtpsSenqEzzPoCzSugZ2CLivEH/3QAGmiT083iKTr0l4?=
 =?us-ascii?Q?0hrWu6an4aw026k1k0hAMHKWkjBY5D+eEoSmsM1pNT4ucDNlmCAiv137gnHK?=
 =?us-ascii?Q?fIZNrZHJ2IL+Uvvpzl0tqqA+/Z6zWzUuL5BMOtleDLUZIWSYowV0Ax1tSvCh?=
 =?us-ascii?Q?YMs7rT6/BlkWmnW6S9gPbQi0+Wm65Ub3N/scUpfmfWZGwHbmi/8yj6id8kPb?=
 =?us-ascii?Q?i9WOy+lrvfnZYQ9vwamdXu90pxRZP9+kLsBUVxqvuRgWijZwMAf3FPUUnjtg?=
 =?us-ascii?Q?TcN5ffYWHMh7KgGE6sMHTE89kAWAlPP2hWdeDJdjXZQVCxJWtr0HL5H2f8mI?=
 =?us-ascii?Q?4PZOxsPcZk8TYetGiJ+SlS8RP3YwNn2H529KR4pI3/WC6cawXWl1DVIczwe8?=
 =?us-ascii?Q?uoz/QGz5RBMJPNjWB2B4rrWFE5PPPCE2RwVDxN/w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9b8014-2c65-49bb-502b-08de30dbede5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:17:07.9984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PlWG2xXydwB/8ObvtUgzO1CXlWcwDShBwRhTORC/7K8bpZPPeYy9G+F3PPmNL2VnkpxYjKunCV4O1HMUyCioVizuJotvNiMCosBu6uFvAI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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



> -----Original Message-----
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Monday, December 1, 2025 2:34 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>; Gurram, Pravalika
> <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t v9 05/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU coherency test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test verifies memory coherency in a multi-GPU environment using SVM.
> GPU 1 writes to a shared buffer, GPU 2 reads and checks for correct data
> without explicit synchronization, and the test is repeated with CPU and b=
oth
> GPUs to ensure consistent memory visibility across agents.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 220
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 220 insertions(+)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index 1d126c740..6166795b3 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -44,6 +44,26 @@
>   *	Tests cross-GPU atomic increment operations with explicit memory
> prefetch
>   *	to validate SVM atomic operations in multi-GPU config
>   *
> + * SUBTEST: mgpu-coherency-basic
> + * Description:
> + *	Test basic cross-GPU memory coherency where one GPU writes data
> + *	and another GPU reads to verify coherent memory access without
> prefetch
> + *
> + * SUBTEST: mgpu-coherency-fail-basic
> + * Description:
> + *	Test concurrent write race conditions between GPUs to verify
> coherency
> + *	behavior when multiple GPUs write to the same memory location
> without prefetch
> + *
> + * SUBTEST: mgpu-coherency-prefetch
> + * Description:
> + *	Test cross-GPU memory coherency with explicit prefetch to validate
> + *	coherent memory access and migration across GPUs
> + *
> + * SUBTEST: mgpu-coherency-fail-prefetch
> + * Description:
> + *	Test concurrent write race conditions with prefetch to verify
> coherency
> + *	behavior and memory migration when multiple GPUs compete for
> same location
> + *
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -54,14 +74,18 @@
>  #define EXEC_SYNC_VAL 0x676767
>  #define COPY_SIZE SZ_64M
>  #define	ATOMIC_OP_VAL	56
> +#define BATCH_VALUE	60
>=20
>  #define MULTIGPU_PREFETCH		BIT(1)
>  #define MULTIGPU_XGPU_ACCESS		BIT(2)
>  #define MULTIGPU_ATOMIC_OP		BIT(3)
> +#define MULTIGPU_COH_OP			BIT(4)
> +#define MULTIGPU_COH_FAIL		BIT(5)
>=20
>  #define INIT	2
>  #define STORE	3
>  #define ATOMIC	4
> +#define DWORD	5
>=20
>  struct xe_svm_gpu_info {
>  	bool supports_faults;
> @@ -102,6 +126,11 @@ static void gpu_atomic_inc_wrapper(struct
> xe_svm_gpu_info *src,
>  				   struct drm_xe_engine_class_instance *eci,
>  				   unsigned int flags);
>=20
> +static void gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
> +				      struct xe_svm_gpu_info *dst,
> +				      struct drm_xe_engine_class_instance
> *eci,
> +				      unsigned int flags);
> +
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> drm_xe_engine_class_instance *eci,
>  		    uint32_t *vm, uint32_t *exec_queue) @@ -218,6 +247,35
> @@ atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
>  	*addr =3D batch_addr;
>  }
>=20
> +static void
> +store_dword_batch_init(int fd, uint32_t vm, uint64_t src_addr,
> +		       uint32_t *bo, uint64_t *addr, int value) {
> +	uint32_t batch_bo_size =3D BATCH_SIZE(fd);
> +	uint32_t batch_bo;
> +	uint64_t batch_addr;
> +	void *batch;
> +	uint32_t *cmd;
> +	int i =3D 0;
> +
> +	batch_bo =3D xe_bo_create(fd, vm, batch_bo_size,
> vram_if_possible(fd, 0), 0);
> +	batch =3D xe_bo_map(fd, batch_bo, batch_bo_size);
> +	cmd =3D (uint32_t *) batch;
> +
> +	cmd[i++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	cmd[i++] =3D src_addr;
> +	cmd[i++] =3D src_addr >> 32;
> +	cmd[i++] =3D value;
> +	cmd[i++] =3D MI_BATCH_BUFFER_END;
> +
> +	batch_addr =3D to_user_pointer(batch);
> +
> +	/* Punch a gap in the SVM map where we map the batch_bo */
> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
> batch_bo_size, 0);
> +	*bo =3D batch_bo;
> +	*addr =3D batch_addr;
> +}
> +
>  static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>  		       uint64_t dst_addr, uint64_t copy_size,
>  		       uint32_t *bo, uint64_t *addr)
> @@ -352,6 +410,9 @@ gpu_batch_create(struct xe_svm_gpu_info *gpu,
> uint32_t vm, uint32_t exec_queue,
>  	case INIT:
>  		batch_init(gpu->fd, vm, src_addr, dst_addr, SZ_4K,
> batch_bo, batch_addr);
>  		break;
> +	case DWORD:
> +		store_dword_batch_init(gpu->fd, vm, src_addr, batch_bo,
> batch_addr, BATCH_VALUE);
> +		break;
>  	default:
>  		igt_assert(!"Unknown batch op_type");
>  	}
> @@ -500,6 +561,146 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
>  	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);  }
>=20
> +static void
> +coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
> +			struct xe_svm_gpu_info *gpu2,
> +			struct drm_xe_engine_class_instance *eci,
> +			unsigned int flags)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo[2], batch1_bo[2];
> +	uint64_t batch_addr[2], batch1_addr[2];
> +	uint64_t *data1;
> +	void *copy_dst;
> +	uint32_t final_value;
> +
> +	/* Skip if either GPU doesn't support faults */
> +	if (mgpu_check_fault_support(gpu1, gpu2))
> +		return;
> +
> +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
> +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
> +
> +	data1 =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data1);
> +	addr =3D to_user_pointer(data1);
> +
> +	copy_dst =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(copy_dst);
> +
> +	/* GPU1: Creating batch with predefined value */
> +	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> +			 &batch_bo[0], &batch_addr[0], flags, DWORD);
> +
> +	/*GPU1: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu1, vm[0], exec_queue[0], addr,
> &batch_addr[0],
> +flags);
> +
> +	/* NOW CPU can read add (GPU1 STORE op) */
> +	final_value =3D READ_ONCE(*(uint32_t *)addr);
> +	igt_debug("GPU1 written value: %u\n", final_value);
> +
> +	/* GPU2 --> copy from GPU1 */
> +	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr,
> to_user_pointer(copy_dst),
> +			 &batch_bo[1], &batch_addr[1], flags, INIT);
> +
> +	/*GPU2: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu2, vm[1], exec_queue[1],
> to_user_pointer(copy_dst),
> +			 &batch_addr[1], flags);
> +
> +	/* verifying copy_dst (GPU2 INIT op) have correct value */
> +	final_value =3D READ_ONCE(*(uint32_t *)copy_dst);
> +	igt_assert_eq(final_value, BATCH_VALUE);
> +
> +	if (flags & MULTIGPU_COH_FAIL) {
> +		struct drm_xe_sync sync0 =3D {}, sync1 =3D {};
> +		uint64_t *result;
> +		uint64_t coh_result;
> +		uint64_t *sync_addr0, *sync_addr1;
> +
> +		igt_info("verifying concurrent write race\n");
> +
> +		WRITE_ONCE(*(uint64_t *)addr, 0);
> +
> +		store_dword_batch_init(gpu1->fd, vm[0], addr,
> &batch1_bo[0],
> +				       &batch1_addr[0], BATCH_VALUE + 10);
> +		store_dword_batch_init(gpu2->fd, vm[1], addr,
> &batch1_bo[1],
> +				       &batch1_addr[1], BATCH_VALUE + 20);
> +
> +		/* Setup sync for GPU1 */
> +		sync_addr0 =3D (void *)((char *)batch1_addr[0] + SZ_4K);
> +		sync0.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync0.type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
> +		sync0.addr =3D to_user_pointer((uint64_t *)sync_addr0);
> +		sync0.timeline_value =3D EXEC_SYNC_VAL;
> +		WRITE_ONCE(*sync_addr0, 0);
> +
> +		/* Setup sync for GPU2 */
> +		sync_addr1 =3D (void *)((char *)batch1_addr[1] + SZ_4K);
> +		sync1.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync1.type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
> +		sync1.addr =3D to_user_pointer((uint64_t *)sync_addr1);
> +		sync1.timeline_value =3D EXEC_SYNC_VAL;
> +		WRITE_ONCE(*sync_addr1, 0);
> +
> +		/* Launch both concurrently - no wait between them */
> +		xe_exec_sync(gpu1->fd, exec_queue[0], batch1_addr[0],
> &sync0, 1);
> +		xe_exec_sync(gpu2->fd, exec_queue[1], batch1_addr[1],
> &sync1, 1);
> +
> +		/* Wait for both ops to complete */
> +		if (READ_ONCE(*sync_addr0) !=3D EXEC_SYNC_VAL)
> +			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr0,
> EXEC_SYNC_VAL,
> +				       exec_queue[0], NSEC_PER_SEC * 10);
> +		if (READ_ONCE(*sync_addr1) !=3D EXEC_SYNC_VAL)
> +			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr1,
> EXEC_SYNC_VAL,
> +				       exec_queue[1], NSEC_PER_SEC * 10);
> +
> +		/* Create result buffer for GPU to copy the final value */
> +		result =3D aligned_alloc(SZ_2M, SZ_4K);
> +		igt_assert(result);
> +		WRITE_ONCE(*result, 0xDEADBEEF); // Initialize with known
> pattern
> +
> +		/* GPU2 --> copy from addr */
> +		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr,
> to_user_pointer(result),
> +				 &batch_bo[1], &batch_addr[1], flags, INIT);
> +
> +		/*GPU2: Madvise and Prefetch Ops */
> +		gpu_madvise_sync(gpu2, vm[1], exec_queue[1],
> to_user_pointer(result),
> +				 &batch_addr[1], flags);
> +
> +		/* Check which write won (or if we got a mix) */
> +		coh_result =3D READ_ONCE(*result);
> +
> +		if (coh_result =3D=3D (BATCH_VALUE + 10))
> +			igt_info("GPU1's write won the race\n");
> +		else if (coh_result =3D=3D (BATCH_VALUE + 20))
> +			igt_info("GPU2's write won the race\n");
> +		else if (coh_result =3D=3D 0)
> +			igt_warn("Both writes failed - coherency issue\n");
> +		else
> +			igt_warn("Unexpected value 0x%lx - possible
> coherency corruption\n",
> +				 coh_result);
> +
> +		munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
> +		munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
> +
> +		batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
> +		batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
> +		free(result);
> +	}
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> +	free(data1);
> +	free(copy_dst);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst,
> @@ -524,6 +725,18 @@ gpu_atomic_inc_wrapper(struct xe_svm_gpu_info
> *src,
>  	atomic_inc_op(src, dst, eci, flags);
>  }
>=20
> +static void
> +gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
> +			  struct xe_svm_gpu_info *dst,
> +			  struct drm_xe_engine_class_instance *eci,
> +			  unsigned int flags)
> +{
> +	igt_assert(src);
> +	igt_assert(dst);
> +
> +	coherency_test_multigpu(src, dst, eci, flags); }
> +
>  static void
>  test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  	       struct drm_xe_engine_class_instance *eci, @@ -533,6 +746,8
> @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_mem_access_wrapper, flags);
>  	if (flags & MULTIGPU_ATOMIC_OP)
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_atomic_inc_wrapper, flags);
> +	if (flags & MULTIGPU_COH_OP)
> +		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_coherecy_test_wrapper,
> +flags);
>  }
>=20
>  struct section {
> @@ -555,6 +770,11 @@ igt_main
>  		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_XGPU_ACCESS },
>  		{ "atomic-op-basic", MULTIGPU_ATOMIC_OP },
>  		{ "atomic-op-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_ATOMIC_OP },
> +		{ "coherency-basic", MULTIGPU_COH_OP },
> +		{ "coherency-fail-basic", MULTIGPU_COH_OP |
> MULTIGPU_COH_FAIL },
> +		{ "coherency-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_COH_OP },
> +		{ "coherency-fail-prefetch",
> +		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP |
> MULTIGPU_COH_FAIL},
>  		{ NULL },
>  	};
>=20
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> --
> 2.48.1


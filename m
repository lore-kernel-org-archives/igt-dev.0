Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088F1C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 13:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F43010E0FA;
	Mon, 26 Aug 2024 13:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUFNpaG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D0F10E0FA
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 13:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724678292; x=1756214292;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=dhVgveN2Hi+FsnvBIykIH/M3EE/4TbSpzi/GX0OV4PU=;
 b=HUFNpaG+p8PGU3aM8K6pyGvAVCJll1Qc4tBhsEzEiI7UHVQo0eF1z1v0
 uHRUYdh2nH/6AvOgYl4alGF9bA6eDL0b3z5sKi+fliC2S1bk7ioOqIFfo
 iy7+4VCP/cW8lMmVr8dpXBg2gIwjnUGJJhkRMMq5QNRYI1IsusYW/qsLp
 iqOffFlzvj1cRlc+JkZFcWjmBdZLXBgnfffrO8Psq2MklHd+UB/KwaN7K
 WBwRi8e0zfThRZpw87P3KraE62q2cwQRSDo4EnP405a8jHmkEp87bcp3E
 +3eNtiVqYZjmRF2zEJIn4rXJiLPG6k00Wh77IOXz0Dtr4PJJjHPrtWE3D g==;
X-CSE-ConnectionGUID: XVi/Nng/Si2F0vUWWJOS4A==
X-CSE-MsgGUID: Ti6Mj9zMRv+PRAACTjPJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22693224"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="22693224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:18:11 -0700
X-CSE-ConnectionGUID: JV4ZgBIoRhWF5GmL54zpZg==
X-CSE-MsgGUID: TGMJv5lWRZS+2EL8N1MCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="67404812"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 06:18:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:18:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:18:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 06:18:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 06:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjW9U0Bkp84T0rua8hd4HqPSATUA/vL8IaC8pSZXK3QTqs3xfogJEsR6eaZDXtYPkTXViupCB+Az2a3YfDNeZ4RNFVPnqIy1DfF70UaR+gNdpZsp9peT2+/HUUs+7dE8xKSmWoYQfM31fnZslFNUHph3qzB6RvHDS8ITbV3bzBJUEV4HkcNeoKfHM9j9FgdTg1NJhcrdTm8tfcsO2uQPMWoAM+3pAnBww3csih66f70ul7w2Gxx+6L0T5VwLJt0ygY+k033mqKWtb222A2zhYB0BaUA9odsK0cRYebBbV9f5drT6IWkI02NgIkUxJ7gqAKah595XdDosghxil35XhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S29B9GX6LU1WbBjjapLMHPhbaa8xLysarBwNNG+/pxc=;
 b=eVqWeDxvzIEsox1vDWlQ5ZN5uMWQ8NReTcTfHjzcUDQ9FR0D+gGVTeAs3Aox/zuJ2mWQ9Pku8qaWhqKKe0aF/PWBKJf3XYdrkRqw0xdUDd1DgbIe+FpbEPWgJj0E7G3zx/si96N1PztZ37YysXmEyDnvFrEagOxWI4CtFoWwKoS5asChUN/HyJDyJsBEzhdfo6PyftTnHzQbnYHQ40CvQb4V+d5bln7BlfI4N6Sd3V7T7ng9dOV2zYufc+p2o8bjwyQjODk8m6NwKkEVKlmBj4PT5i+B5kSo7wwQ6cfMAzKqQjfXTbE6lPIZt8MesCtSeZTnGY5MW5eDN0rgk1CIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 13:18:08 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.7875.019; Mon, 26 Aug 2024
 13:18:08 +0000
Date: Mon, 26 Aug 2024 15:17:58 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 Introduce memory mapping tests (rev3)
Message-ID: <aakjxaofolkn6rxryymeuit3rsynfsfxgj72wii7v5due66mxg@u6kla2eik2u3>
References: <20240822124744.13054-1-krzysztof.niemiec@intel.com>
 <172437291681.727909.13206891092253977259@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <172437291681.727909.13206891092253977259@2413ebb6fbb6>
X-ClientProxiedBy: VI1PR07CA0280.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::47) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f44e259-ad7f-4a00-f55e-08dcc5d186bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajRHT1o1QWt0VDhqMDBtUm83eWkrNFlkUVhTbXEwMUFmbXFieVV2M21GWlFK?=
 =?utf-8?B?RThRTGx1Qk1IRGx2TGpuMmRoWUJWOW9sekxKK2FpQkRRbklYangzNWhnNUtI?=
 =?utf-8?B?MFFYMjZYa0V1QzlpMVZ6OXFNbGpveVhyWW5vd1lnUUoxUmVGTkh4M2R4Q1Fz?=
 =?utf-8?B?bDVnY2tRUkQzSjMwcExTNjlmbS9JTThkZGQ5UW12cGFIZ0kxUGZ0UWc4RW1H?=
 =?utf-8?B?Yk5CNUlWOFVVVjNhRk8vUUcxaXJTWW1rM0V5eFRYVmlNRkMyVFVEWHdaSzNa?=
 =?utf-8?B?dXR3NDh6YmRNZ2hBUUt2M2xoRFBRN1NrZDB0WTZuU3ZYUnFCMmpzQmliS3Zv?=
 =?utf-8?B?RVFEdlhVRmtaNW9heGVYZ1ZLWGZvdVFmVWY4bVhGa29IenFoL3hZajd2RFAw?=
 =?utf-8?B?SENXSnFLcnVrVXo1cTQzTFBUZ3NlYjVMc2lJZFhhejczQzc0cTJHV2p5eTlp?=
 =?utf-8?B?QzlpenZIWkQ1ZUZPbS9ud01TQUxiR3N2WDR1eXF3czlFckQ2QXh6dFJFc1F6?=
 =?utf-8?B?U3FwWWd2bEg5ZHV2VU9UK0hoT1JzNTM4TlRTMHR0M3Z3SXFiMHhPM1p3c0ZF?=
 =?utf-8?B?MG1zajY5SUIrMWlLb01DMTU2bHlUUmE0K1hpWXJjYU0zUHg3ZjBZQUVUZml1?=
 =?utf-8?B?L2wxZmtndGhWVVFiOFlXUHhsbFp6TFdzMy9HSHQ0Z2Y1bTFldExtejUzcExL?=
 =?utf-8?B?V004S1Fvai9RZmZpYUlFN0NIUlpIZHA4L1VvWUdtVGk3bGJRaENveC9DWmZO?=
 =?utf-8?B?ZlB4am1IOGVMYnQ5UEVsTDZpYzdDcHgwcmVJMG0xb0lGZUlOYjEvaWtSQUpp?=
 =?utf-8?B?S2lpelFCZHR2bS9taEZNR2pzT0tpNnVUTHZMRlNhSGFJNU5kbWZXb01lTHFa?=
 =?utf-8?B?ZTU4ZkpESklwYjdHNytCWW1tWFNrN2hpa1pKdzJuT21lNFJjS2xEM3FnTzZF?=
 =?utf-8?B?QlBzdEZ5R052QzFmNmRSQllBS01aN2JxbUV5UmJjUXkxYUZnQUxyNlpTQWdP?=
 =?utf-8?B?eXNuWnpzSEx0ejZ5RCtneXZjc2pxY3drK094ejVWL2NHNUJwcTVBVGhlVnhI?=
 =?utf-8?B?TCs2eXhDVVNablJvZmpLNU14TGE0Slp1ZmppaFRRby9QNDBWaCtHLzhDR1Ft?=
 =?utf-8?B?cjdRRWVMQ0hFYy9QZUlma2QzY0lBY1haZ3FrRWw3MjVlTTNockdBaldtT1Ja?=
 =?utf-8?B?QlpwOTRJME8zQzhuczN0cStYTjhIRjBNSng5amJvZVVQUHc2YVF0MjZHVGdX?=
 =?utf-8?B?L3FGb2xlcDRyb2VyOTlYVUNUNzBhMm9MejYwWXBLODBadnUrRW1OSXltdDBB?=
 =?utf-8?B?bDduNjVNaHh1OGRjczBhdDA1elVaUkdoT2pRMU5NMHB4MkJ1L3lxdGt6RXhZ?=
 =?utf-8?B?YS9sY0hGKzhEZEU4NzQzWTl3Rk1xbUloUkpqQ0N1ZVlzRzNUKzYwZUd5Tkgy?=
 =?utf-8?B?dFJMUG0rejg0UkkrSGZQMEdvci9xVStDVC9QbzlWTzJaNGs5NU1yTjVaamN2?=
 =?utf-8?B?dmM3bU9NTVNaMDhmRThrL3dMQzZ5TkM3dU1lQ1BKTnJGOUk0RXh2S2I3MjlD?=
 =?utf-8?B?OThTWkRCcWtiVGVFZCsrNTN5amVuMy9YcG5CdWplSTNzZkg2UkwzZVdFMUpl?=
 =?utf-8?B?OERJNi94eDJKc1RtQVFtc0lmVGtXQWdBYkdQTUFWUTFGbUJhWldSWXh2WVVr?=
 =?utf-8?B?cThFN3hzV2thWjIzZDc2azZpSjU4N0YxU0NabnVLaHJxc0lsM2xMVm53Z3RV?=
 =?utf-8?Q?ZigpV5Z+pktZ1l+QqY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enJIanhULzNiWVZ1Y1lSaGx0UnYveTlSU25hNnp1cXdabTFZdTNUUlcyczNB?=
 =?utf-8?B?R0svS2VTYWcxb0R2NFYybm9sRS93cXI1OWF2Tk5XR1d5b2wxcjN1T2FVRXl5?=
 =?utf-8?B?MGUwZmdWRTlydWtzZk0wek9TK1FRV29DaUNpd2YrNkxGb096blVjRm5Td1ZH?=
 =?utf-8?B?bysvUnBDU3FTRU5xWGRnaTZQc3BPUlRFVENNQkFKLy8vY041eUw4Yyt3QXA0?=
 =?utf-8?B?WUk2WEY1c3gvSDh6bUIwN0lWSnBwYzJqVUM5V0puZThHVmZEQUNKcWF2Tnl0?=
 =?utf-8?B?MERJUWU5OWdSY3lDVHJzZ1NxZ2ZOT0dQRE1NakhtODQ0WEtQb1RlTFhpSnVj?=
 =?utf-8?B?TUk1MG9oZnpINVNvbUxVSEMzUStCVFo2SDJkTXZZZnBGeEdsRWZmdXpvaXZG?=
 =?utf-8?B?ODRuR1hBcU5DRDYvN3RSUlVoTUIvWHQ0WW01N0xrUDJhYU4rbGM4ZDVYeUR3?=
 =?utf-8?B?SkdWZkRsRWNHQndOSnJCRnI4VC83SzJsTUltODVxV0NqM1dKVXdqOWp5NHZZ?=
 =?utf-8?B?SCs2Mk9Bd01oUkxwWFg3THEveTBWZ0cydlUvRnNNODNwRTFWVkVuNUE2bk9w?=
 =?utf-8?B?RGVMdHJ4MW4rVktLRWRtZkhxM0pSU296NnZ5QzAxQkRhbzFGNzZKUVd1MzFH?=
 =?utf-8?B?d0wxRWpIL3dQazdsU0JmME5ObEhCYWloZllzZ1gveWtpcUwvTU5GWitiRFZU?=
 =?utf-8?B?WGZuMk9Lb2Y5cmhRUmhuRGlMUkxDWXJwMmdUQXhMTm1qUEF5WGdYbWRpQ1Yz?=
 =?utf-8?B?VC91cTdoa3JSNEtlZk1hV3VNeVFNM09QdjZwTGU4V2NpVi85MnVyY2ZHQkJy?=
 =?utf-8?B?Z2o2bU1rYUorYXkxdW9GaXp2czZoMzVPeHd3TU9HOHVENXhBTFRVMit2SnFE?=
 =?utf-8?B?NDN0RmwreE1yQVlOUGJpcE02N2c4djFzZXRaNkFqajlsZFBEc0pLRnczcTFl?=
 =?utf-8?B?d3V1cjZYT1NzTnREMDZBRk9URTdvTGVUbEk3Y0p0ZUZUYkJpbFM1OTFSM1Bl?=
 =?utf-8?B?bHNZa2RGV3Zuc21qeThJSW1ERFJFQVZsK0lNL0plZXdIUXZOUXJ1ajNYazdU?=
 =?utf-8?B?RFJ6NVpCUFFrQ0EvaXd6alQyRG1MRkFMN2hsY1hhbmFsdzZSaXZrUkZ1MGl5?=
 =?utf-8?B?ZmM1OUpWTzZQVktKUHBHdmFOTUdGNmJjUXRvUnl0b2E2WFFhS2MrU0xDS21m?=
 =?utf-8?B?ZlhyMU54NHRFNlJlUXZ3U1g5dTVKLzRPRk91RXVQbHBvM3ZoMjdUczljbXlH?=
 =?utf-8?B?N1FHbXJzN3FLZXVGbFptczMvVmQ4cmFIcjdVdUFWeXphQ2hCRkhjTjhIZ0pU?=
 =?utf-8?B?ZXVMUE1HVUxqQXZzRUtSTDI5dENXdFlCYmVjU0w1Z1JUQ1Fvb0ZPNS9nNFFY?=
 =?utf-8?B?SXFQcFI1SVpBRWhackNrS2Q1alNKMkViZ21XMXg5emxISFQrdndzZVhxdDZv?=
 =?utf-8?B?UTAvUUV2Tkd1UzJoL0EzQnRYeEFDd1hjclJXdU9jT0tmVWdPY2NxTllxZU1h?=
 =?utf-8?B?QW1xS1hvd215aVBnNkl5SXlQVG1lM3dBUi9EU1pXNnFoY0IwVUVTZUttNVF5?=
 =?utf-8?B?VG5EWUNwd0dWVWpSTUd0Mi9LdGl5VU1rcm9zdkE4aHNkcTlXaHFnMVF5aTJn?=
 =?utf-8?B?MWE4UENhL1g5Y0lXRWNYWitha0ltVEpQRkdjbWM5NEJENXBNeFNEWWpYckZl?=
 =?utf-8?B?bEwrM09sUURtZlJkdmVUaGUzV1BEdklDL0EwK3ppRit4enE1TTl0Tm9NT0pJ?=
 =?utf-8?B?MUpXL2VyNmJlS0ovd1B3VUFhbXM0V1JIOWNKMlhFNTU0WStQVTJFcDhUMXEr?=
 =?utf-8?B?ZkJocS9sRE81R2I3WTZwN3cyMFh0SzJvazZZMVRtSWREMVZGQnhZbUF6TnBB?=
 =?utf-8?B?TFVkSHlTTnhWeUxMdDVrVXIzaFhDcVRnR0pYMUhFd01WbzBma0VyL0RjejZF?=
 =?utf-8?B?MkN0QXAvU1Y1Wk5GYVBBZE82NEZhcmx1UkVYQlZZLy9Wck1IaDVPTWYweHYr?=
 =?utf-8?B?TTUyZmIyMUN3REhHWVBkY2Y4SlE4aEhMMmlFM1A4ZWRPbzhXV1lSQnZCZFZn?=
 =?utf-8?B?YyswUGU1ZU1NV0Jkd1Vub2kzemRIdDBZNS9STThUaHdmc0ZsRHhrdk9RbVZF?=
 =?utf-8?B?Zllnb1J4U2EyRGxnNFNrZklwelJRK2x5SjlNNkFCdW1VSVZ3bEh0dk1SYUp1?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f44e259-ad7f-4a00-f55e-08dcc5d186bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 13:18:08.0129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdkUx1SwkzpGFS2lkM5/XCCm6jOCtuB5KA7KGJmsxExftfcYvyOcT8pIq5MoU4wgHOv4/aeu/3mT/xOM9TASHulY0k9bMutwBMHO3G9CSxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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

On 2024-08-23 at 00:28:36 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce memory mapping tests (rev3)
> URL   : https://patchwork.freedesktop.org/series/137303/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7984_full -> XEIGTPW_11618_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11618_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11618_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11618_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7984/shard-lnl-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11618/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html
> 
>   

These are not related.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11618_full that come from known issues:
> 
(snip)
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7984 -> IGTPW_11618
> 
>   IGTPW_11618: 11618
>   IGT_7984: 7984
>   xe-1815-882c26c7017bdcc4eca493c7bf1ffb034d40be02: 882c26c7017bdcc4eca493c7bf1ffb034d40be02
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11618/index.html

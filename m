Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D769FC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 05:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B5610E8C9;
	Thu,  6 Mar 2025 05:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REHSUqAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E9E10E8D4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 05:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741237432; x=1772773432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=KxpEtGygjla/vJOhgBvw3Z4KR+MXi8O2VolExuu1mhc=;
 b=REHSUqAzXB0ZnpcXAeVjCpFK3b+1egUqvcOteXMasEYbRexUgBM4Jlax
 S8BIZGQ5Ozo3ecPq46s3Z41I18RbCUSEjDdUZz+o1W3/ORCW/dN4BjPxo
 3lE/MrAasrPuetBvQPrfiS8tKxFzbR6m0BzJglTkTlgORQOS6uN6sFjzf
 rxzGpBYv5p0S7/epuyYjFt6kXuahJOmMCz0ZtP7mDZTQLHZEALD9lbSh/
 LdxwdWC7QO+hVJN3MmFTNAbs2PzyIhWLYEAuNymigt3csQ596LuBv3QBJ
 mYUDfESzozymzqFIEdRNLeuj52oN/isjlgTrOsIJWN60WbU0IplV07nSB Q==;
X-CSE-ConnectionGUID: X3J6aeIuSEWa9a+Axgp5Ug==
X-CSE-MsgGUID: a8YzvTpPQ36ySgN6AH0e7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64678372"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208,217";a="64678372"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:03:44 -0800
X-CSE-ConnectionGUID: ZvMx/XeJSyqXSHaP5i/+tg==
X-CSE-MsgGUID: LzRUoEmHRmCMH3N7kJIuqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="118807693"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 21:03:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 21:03:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 21:03:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 21:03:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6sU6KQdziHjRfLmSxWkkKibo22wlXWNFZUE8lg8X+SLob6FEAykHpSagfhaD1E6Meo/T8Cpi/52nlJFCM74y9+PyzRbRyJmFo2bBjYbsr4Z2vSOC3SpvxIDLz8dKJ7deO11BqRWSH/CWMShGlJXtmcJTS0+aJDhAS8j4zeOX/VOYIX9UIcpNxZzIk8E9eCNi/aF8y+YCKBHULa99sUgLN7KmILURkuf33dXMLa79vP43l3EYG8BX//kOrP/E7idapqK0YEgXcWOSVy0+8oaywEs6XPXMDbd1gtpnZar2K1H81rm7uYIhnjoAHpUfZYmDrG9BFNWOErvyNLa0tQtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxpEtGygjla/vJOhgBvw3Z4KR+MXi8O2VolExuu1mhc=;
 b=Bp8cTrVox0oV2hrWGg4wd+vqqZVujwIMSzb3iBNshaqVgiLLimpw3AmBSTLnlq+zAvyvauTVGJGeImQqygESVUHD9MvOrOGBC3Jd652xx5dbuPpZjvfjpYu8pz3TUgwRzoMEhMjXC2dz5+96UaMfn+3ygqScHXsAFFMAbp/Ueu0BKNaSYapUoFndDtvh5DFGQKvPFjCYRkt5rwqt8x2vb1l/4Au9hEAGdMwdtQp2WnhLtf26kDdzY+FQV7LOOFxEsmbVtqwS9Fee5FnnccFtj/pJjj52QcczOfw75IHFKxpcxG4UKQ7oUB9CTiYy5SFcxKlQq+Nb6dT37XyrBeXGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 05:03:34 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:03:34 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dp_link_training: Restrict to Intel
 GPUs
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dp_link_training: Restrict to
 Intel GPUs
Thread-Index: AQHbjbMJqabP/QiMOUa7st5sulcUxLNljqLV
Date: Thu, 6 Mar 2025 05:03:34 +0000
Message-ID: <CY8PR11MB6889F86950BA5B6A4F3EE141DACA2@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20250305094307.1349154-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250305094307.1349154-1-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|IA1PR11MB6515:EE_
x-ms-office365-filtering-correlation-id: 084572a9-6ba2-43f1-1057-08dd5c6c3f2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?czoXMEgJL6iMVIJPLwJcxeARS12nDwxmuxeUnoS24C+X7oGzPk4+LSDsmk?=
 =?iso-8859-1?Q?NHwKO11YBUAKpD2FzvBALvtzEORHDwVydJ2J9tVJAZIEcXrzvclwxYSqe1?=
 =?iso-8859-1?Q?2fXFdSR8je9w8s8yJm/PQxmD823FkUpjYtu2qtDy4EWFJyTUA3iY3ZYHAQ?=
 =?iso-8859-1?Q?7Y6QUz+arT9IIP3bQ7OrsTa6G2pTBdffn4zht1L2chui+gt0XhKc4splFF?=
 =?iso-8859-1?Q?9jE/eskS2n7BMO7NQYV5MCEpSUR0Q//cdTnxxdseUuWctOpG4YWiHH16A4?=
 =?iso-8859-1?Q?EhISojU/DZgYyS4LTllNVvsEaX4Pw4WSO65wh1L+YfggLCB+H3lRsB+w+T?=
 =?iso-8859-1?Q?ZSRjCc0JSgQ8tIB2I1m61YSr7EqwlAcnDcPvjlK+nf//h9O6SftujQAZu+?=
 =?iso-8859-1?Q?wIblChwh9LfvaN2ygQy2EuXqLoCIYp/Mfoi6fC/tNpvB7XLIB0H0/BfEzg?=
 =?iso-8859-1?Q?Jww6QNcvSAw3/574vko9zhL6bJ3FEdIvH3tuURiwfrCrDpllkriqi11ioL?=
 =?iso-8859-1?Q?k/pP3Keb45UWg69MO8e1qZipceh22yR19DvNeLMIIpAVJMY7VSBttzmRL+?=
 =?iso-8859-1?Q?qkcSyyDDyPBzRcMVfUtcIpdp7FmMl9yt2z9hSAKrjy2EhZb3gUbIIntH7J?=
 =?iso-8859-1?Q?LdKr8myO8OaGo904FuLLvWeDOHFIuqSk5AymyUqvompgkl+6DXLVC9xMnG?=
 =?iso-8859-1?Q?6Qdhn9NAwU7qBYyqXCHc4+hHVZzOjFT7MpwfMwLRxtMUSLtw5ZHPtpZsD7?=
 =?iso-8859-1?Q?fuWHrIVJYVHflC37ZbWdzZn11X8Vx/Go3J5C2CywCIZWl8etkiMkaL/avX?=
 =?iso-8859-1?Q?LuCw02aaPeV8wv1bD4TKMdw9pkbI9nrZwlYoIal/kcv4v0UZgJQDEEnT+9?=
 =?iso-8859-1?Q?kP7RSPEb2n9n/WI+evdmoWPURZmXeR2TAkk+75mHnB9SiAcdyxxipuFyxF?=
 =?iso-8859-1?Q?R6u/aMyQJ6oMlucq9k0768LrHcb9+Lx68XvVEuqMw2XfxqAuQYa/FMnfzz?=
 =?iso-8859-1?Q?nQ/d7GxyBosCZvCQu/oKskxzQucgJRt/siSTz1ASro9mUVXafprhO71lCl?=
 =?iso-8859-1?Q?moThH1wgvy7jNS4a0EaEOYJCTiv7NVZWB8MCkwPZONqvOo6yx9AqIcwEu3?=
 =?iso-8859-1?Q?wXSyz6mIfqel+GWTc/zzoWCOwgT1+Wokde80Vmie7nx0Qua+hdc8gAVdLT?=
 =?iso-8859-1?Q?DzDwpUmRbwzlfbY1p/ja2Rd6niwAPAnN838A22rFn60OAJES19hjbakNkY?=
 =?iso-8859-1?Q?+ufeuh9DJTOAD4jbcLPeriSXiEETpkueA9UjD4wrERBKnVVMRxBq76As1M?=
 =?iso-8859-1?Q?GfD4Qy8Vfidboi7N2NpGLqD1Gj/lHkI7yh7e8eNO7od2Jnx34NX5Z6SYLa?=
 =?iso-8859-1?Q?w8m9TMVCNXrD4G2OQkSSwdFVt3Gel7rrJSKGa4QbeZNSWX/qKmmFbsAuXw?=
 =?iso-8859-1?Q?6SCHRWCIKi1BdtR5s9YoMRKYDot72OQ/pI2GkXPrqrmOLO/L4gmDqxxgH4?=
 =?iso-8859-1?Q?HmNxujj9cJhYXTENYrvJz3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WYs+NzVLSXt8hC1KU6l5XG5Yw/OkVuamU5vHiJFw3GGwQLruGs860AOXkj?=
 =?iso-8859-1?Q?XoC6xqPbNfHPmN9YhbnXdcMbIHqyrqQiqW5gxpnRrcOQKbW2N0jecndLbs?=
 =?iso-8859-1?Q?SeKOu51HaYhMQtqT6TCCJUamYhmjUf8gq1UjksWoQvuRJO5PzzBsXoGmtP?=
 =?iso-8859-1?Q?WyOcOcJGdCpUhb8Retjj18x6vMULRrToUmGesuEgfbISZJXfFUPJWVWptD?=
 =?iso-8859-1?Q?9z4Ps9pn0JzNppdCvFlQZNgbaAajnNy/Ia9M80aN2/A6RM0keIhkGGPaRu?=
 =?iso-8859-1?Q?R4RRWOri6DLMdt5MXbF8F2BLZ6nUow55BnKqCQnmJ/QrLC2jL1YYwd0pt3?=
 =?iso-8859-1?Q?WtnHdwAoD26HXsuIgSMQPgMOP0qHLsUnfYmFOxKtItUyXlF2iXaj1U/TBS?=
 =?iso-8859-1?Q?UoBmWJiH/Halhy8FaMIjx7QTmR0V5LpfXVBtlTrwwD8ZJM2SyHLGnpZlwq?=
 =?iso-8859-1?Q?tbSFLzS5Uj0u6TfWVeokMFz5y4gsKAuJVbFP+u+f2N1DiJgB8JBF8LvzAM?=
 =?iso-8859-1?Q?kAWTGyfZomvqGZDi1mDoKlLaoEsBBHOgiuRtJTu0EZokqOO4djjj4ecrVS?=
 =?iso-8859-1?Q?Vqf7BJMBvSsjYyj+j612AAcZIsXxbDa/PcGv1V+4E1RmWSAaxnyElU+z2Y?=
 =?iso-8859-1?Q?NdGHfX6pIAQEP8npwFRggo1PlZsQBipu3tAHK3lYl0TgBQBHtD6rU6VN7j?=
 =?iso-8859-1?Q?wPEerl/2EI70pXmYU97k/J7WoGbnMgs7gpvrM+BU/MAwVE5DBg0NhX2sez?=
 =?iso-8859-1?Q?8AXnu164pyeLzOVhFGo467ghtAuEEe1un+s7Mz6lB6ArAVRzaKVjsUb66u?=
 =?iso-8859-1?Q?vbDCuIEUx/uZDqNj8xLXrKK+Zvz1dWfBa+XSN6pyLIKb26/Xv2x/xnUggt?=
 =?iso-8859-1?Q?bSTgLmNBet5JYsxes2fQXagUFsP/FNm1SJg2VDqg1u5mGqld2CrXqGV5ks?=
 =?iso-8859-1?Q?1xq2prdVHwgYmDJn9uReQrlwGNILz8QsEjb2M6ZnfYJCAuAl6Foh0DYLDf?=
 =?iso-8859-1?Q?3xBSYqeAf+wMNtmpUKGIdB92vtiY0TM9aj0AQs6UhwsNksgS69EOO3Vl2/?=
 =?iso-8859-1?Q?t+R1ftiH621ThBP3RVc0Aa5VKs5QqWM4TILU15RgfeBuQKV0l4+FCjBTYp?=
 =?iso-8859-1?Q?r0PAqXJR+b0LPvgn06OawWSArU4viraHouvJjccEYSh2qpSNFR4ItcL2wU?=
 =?iso-8859-1?Q?4OIPaQ+Zfy5XhDPuGbY3UgW6qCQnoPZQUqCzl6cowprftYswWq7Y4G9fPy?=
 =?iso-8859-1?Q?j5Jv8GvXdGEQwbO4JA3nWaJFdmQou6MB/q4tj62Fs3fQf7ZU70MoJ0yIKK?=
 =?iso-8859-1?Q?vuBatXGkBKOly3Oo6JINrqCo+MqDg0PdEB+wC8K2bP3Z7+Y/IxhBjltvmG?=
 =?iso-8859-1?Q?pQeGeTIcPV0Ogq0HEIu0PptuVJb+f5NCqUKFPz31KiD9/fA+Jmb0eq83GG?=
 =?iso-8859-1?Q?f+OP50sGYINGFptF/0RQ8Hioq4lHNK3NeUbf5/FMqS/fsb35HUkUHCpoZN?=
 =?iso-8859-1?Q?CWd4vTu/Y6+P9Ptsc5X8i5uBCNnn0+SLTOBhXeSkX2LnZsDba2a189Z2H0?=
 =?iso-8859-1?Q?9Om6KKQE1KuFJH5XM+Z4qYfVL9z3ATXCLtNjGVkZunIgnr69mknuaBid+K?=
 =?iso-8859-1?Q?DWZzGNmo+kpQADp+ZtqIQmBajrbqbM1vfdhkoksaTGYSncOKCdyP6cSZRe?=
 =?iso-8859-1?Q?CkuC3ZB7G/xuYrj//9y3QfizfKJM8PXDg0vux9AC?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR11MB6889F86950BA5B6A4F3EE141DACA2CY8PR11MB6889namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084572a9-6ba2-43f1-1057-08dd5c6c3f2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 05:03:34.2081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCfVjm8frjRzxh+1nsdMKA9YytUNygEYeXnOW06ECNwIkKyNPgvZTHqL0zpTZ6y6J54YmkQ4UtjSKrLiCxKCBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
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

--_000_CY8PR11MB6889F86950BA5B6A4F3EE141DACA2CY8PR11MB6889namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Sent: Wednesday, March 5, 2025 3:13 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Joshi, Kunal1 =
<kunal1.joshi@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dp_link_training: Restrict to Intel =
GPUs

Use DRIVER_INTEL instead of DRIVER_ANY to avoid assertions on non-Intel
hardware. Previously, the test opened any DRM driver and failed if it
was not Intel.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>


--_000_CY8PR11MB6889F86950BA5B6A4F3EE141DACA2CY8PR11MB6889namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Marcin Bernatowicz &lt;marcin.bernatowicz@linux.intel.com=
&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, March 5, 2025 3:13 PM<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Cc:</b>&nbsp;Marcin Bernatowicz &lt;marcin.bernatowicz@linux.intel.com&g=
t;; Joshi, Kunal1 &lt;kunal1.joshi@intel.com&gt;; Murthy, Arun R &lt;arun.r=
.murthy@intel.com&gt;</div>
<div dir=3D"ltr" id=3D"divRplyFwdMsg" class=3D"elementToProof"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>Subject:</b>&nbsp;[PATCH i-g-t] tests/intel/kms_dp_link_training: Rest=
rict to Intel GPUs</span></div>
<div style=3D"direction: ltr;">&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Use DRIVER_INTEL i=
nstead of DRIVER_ANY to avoid assertions on non-Intel<br>
hardware. Previously, the test opened any DRM driver and failed if it<br>
was not Intel.<br>
<br>
Signed-off-by: Marcin Bernatowicz &lt;marcin.bernatowicz@linux.intel.com&gt=
;<br>
Cc: Kunal Joshi &lt;kunal1.joshi@intel.com&gt;<br>
Cc: Arun R Murthy &lt;arun.r.murthy@intel.com&gt;<br>
Reviewed-by: Kunal Joshi &lt;kunal1.joshi@intel.com&gt;<br>
<br>
</div>
</body>
</html>

--_000_CY8PR11MB6889F86950BA5B6A4F3EE141DACA2CY8PR11MB6889namp_--

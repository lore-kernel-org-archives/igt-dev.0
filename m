Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE2606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsTPRiie
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B2C10E06A;
	Fri, 23 Oct 2026 09:02:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F69010E5C9
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792746084; x=1824282084;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lIyA+vBLrePpFB2ukkbTk9XNfK+eaPQgJBEim9H2fl4=;
 b=bsTPRiieAcgR2TVvzRfU1FjHaX84oTUdX6D+TxdT1IR8SOLi5cgFU9B+
 R6ldhaSzB2owz8bLHg7bu4xmhmazJc3DCB7aaXQTNdbZmdwuAgEQWFrcg
 esbpPO1LJuLTGFusBQAvsJLazx4YuYxUu1Dg/ofrowL3dN6BmUAQXPLmO
 VrCNQJT/h95o3F7dM3RGSu8skH8BUcVT2E4g9sEhLQxpWkCRIZ0myGlAV
 f63/31ismh95MQO1Isk9FSwUPtfF3Pvpnxj9bU+eqO536cST4k8088Lf/
 Eh+gMEdfkFl0i/1hBGH6vH4SDALW14HYfbUmlMjmyBhxA9HmY/J1GDVq+ g==;
X-CSE-ConnectionGUID: 5CojeCPkTlGivXqTdbFTMw==
X-CSE-MsgGUID: hyLzsqUQT7GQJQg8BdNg8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1388439"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1388439"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:01:23 -0700
X-CSE-ConnectionGUID: 82lB0+ksQ6qGyEaZ0yVVlA==
X-CSE-MsgGUID: YLhk0FqoTReDnLB/aIS9og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3471820"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:01:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:01:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 02:01:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMfK7HM82BjfDVCEPZanM1AXi8GT8AjgkcjRM38E9QITdxhH5Q5NX2S5PMQWJXlg9zqZ1liajmS91NrHnHI8K4nnhEQaifoGZv0tfLihGX8vO/zuekMhVKHhfOg0vYeBqAVQjuyDuN8UjTXVHsSTvWIQSl6qWvS3O1YngYzlBvJbxuj3XHSsL8BhnafojgoJtUELqIIuJTncvVLjvt8pIoyAF6zclXdKztbK57MSN2NVMmtHmDaupTlKKdi7pcTlLbXMsULWgjrB40FuxJCL9PdeYW3AJ9DicbqrIr1boq43YM2tBhIi/94Ok3syAy1ZcnLQPX9Wl25jREz+p6fg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njp9df0AdrLlH2Uby7BuYfnCxekAhUEeU99k1ssHJeA=;
 b=hUb3jQfuMVQpnB1YiABm7BVD4cKQQ5GrPMwSlOeX1MZuDQAd3dhOjb3uaNBYW2mOI5eYoU4DAm9RDj++vuJzfkDIiwSP+a7FKjhws7tW8cnq5ISRNkd23SOSNMzGIbCmOy44I/RoIwM6qtVr0SPvZTAK3c7Gvxc3/kNNCqRbDDkWqeI5w6NRa84qfuoXLSJETqN973UmQVZgScosqZJXLppLzwVBNloZKFZDLriP2EHrBBUTDT1bzbI9adPU9yT4vM5L2xGcLWUZ1PHjogILKaj84nrUVkFmYOuxQ6HUEpVc5VfBc8RzwFp08/fkbJ59AGMfcTQtqiNrXahr+T+muQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PR11MB507330.namprd11.prod.outlook.com (2603:10b6:8:503::18)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 09:01:20 +0000
Received: from DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4]) by DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 09:01:20 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v3 4/7] lib/igt_pm: Add power/wakeup accessors
Thread-Topic: [PATCH i-g-t v3 4/7] lib/igt_pm: Add power/wakeup accessors
Thread-Index: AQHdYJ0Ef2oFSfXQEkORwscFHUjdm7cK2E9A
Date: Fri, 23 Oct 2026 09:01:20 +0000
Message-ID: <DS4PR11MB5073302FF1A654575E9A16C46CDA642@DS4PR11MB507330.namprd11.prod.outlook.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
 <20261020141151.753331-5-pranay.samala@intel.com>
In-Reply-To: <20261020141151.753331-5-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB507330:EE_|SA1PR11MB7112:EE_
x-ms-office365-filtering-correlation-id: 1e8d7501-1a7d-4ae9-5354-08df30e434ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|261009223027099003|38070700021|11063799006|4143699003|10067099003|18002099003|6133799003|261021121427099003|22082099003;
x-microsoft-antispam-message-info: 94WDR2wbZt46alME+IQYsrl72HSxtfSgsvIK5omJG/griTNOqmmWiPnA9ofPc5PlnKeMa2EEazs4Kl9xryp8XGgAzLLSLICxOylzyigIat2CW1PdLJr137JJfYkZTWHzRKZoF8tvQcmSyBWSgVTfQOz+0dFpaginSHgrgbMwxe9b0CdYYGM5xZqeoqSCiTgWgQB6Jw3En4s+HFhQYfgLeN4WPZ9XrOnprvJ8447pZjZiPQCskffMqu5peBDKRJDUAvBjQ/KefLwaa63c8vk54W4UJzpEJ50kGz8HI555JAEjA0woTjV7J8VkTXSnf/rdOJ82yjci67x/l4ekc0WfxZFB3XONaY2pdcgItljl4O6qZ8fXMkMB92mkXXQAscT3wR7hlhdtNdKjlC4Ly18idzIlhQjOYV+fXvIHh/rLVGcIBLM8fXm2mqnzdjY276Bmf2p5wuCE0Nl+5EaCJ9IbP7AIAYUqzajRXRdZyIMC2MbhlHbbd+YcmX6lSzTSms0Y55G5z75iwh1BiAmswZCwjWtKPxUI/afREcd2KGm8xYGPfQun6GJLD0x4j9r5eIWZdG5EtUShYSVtK6D0FO437xN0cG9Y6T3RWpX3VSUjGCOaw1Ri44FL9GKcjRBXV4HE32uYz4yfTTbnTpYfpLl0wGPkvR+IA+EsnzTtimAa0O4tcEJGyqZBGvAtzPCe9VGUQN7TJk03FKraKkpwfY6ciHz9qJgNpaKM4/bPcdwn3d0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB507330.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(261009223027099003)(38070700021)(11063799006)(4143699003)(10067099003)(18002099003)(6133799003)(261021121427099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8u5YP8JqDP+VZAEMA+hbRfNOnpWw6zt8qBJM9K1IZeEPpx17cIg88ECFKJ22?=
 =?us-ascii?Q?czaG8fFysNgeOhMvYMoOPWmk3XsOVLX7oUm7Y788XXAA4ZTnGCMUNCAB+jfO?=
 =?us-ascii?Q?O4JMNa9dzWGs2FQu6Q/TYeZsUkMYM0BXNU065rm7bVr8/dDfgnId3ulvkStD?=
 =?us-ascii?Q?72OXBEbAxTKcWsBWgRtJmJZsbmJK5jH0RUs0Xhnwc6ux7PCHt5hFjUK2Y8wN?=
 =?us-ascii?Q?ItoEpQqvI0zTcfnGx6IT/YNIiAU9G8zgmpAT8Lw//RSA5lymdcaRZuqm2fTz?=
 =?us-ascii?Q?/dkDHLU3NDte9LJwABXsnz6ZJIKzGzO0wfNnG2O2l8zIoZOqQIHgi63vECUj?=
 =?us-ascii?Q?qGpje1/0Xfv9XM87HQsmmBzMSV0ObR7kbDJIHeRdLvQckZqiPkbDvV/UrDpe?=
 =?us-ascii?Q?m2wJBfieEy/zHsbmGDG1RmWfVolW6UqtGorga2jfJRIp4FM/ZCkN9eyNslG9?=
 =?us-ascii?Q?MEHFRo1Z/kCbda0u8rxBGbD6fqKRXd9eIqUztd+/ez5jur9BlsQv+bw/ZNFf?=
 =?us-ascii?Q?/0VKqTpyn1OlpRTXTZ4sTS3a+t9/aLX4i+u18pBgc5G0O3GB5dV4vshVXt+w?=
 =?us-ascii?Q?FPMcbAIurzcsAPqyi+kabHRo5d0dFHbYKKzP6fH9mxcyZqbd1T3Bg8ese+QC?=
 =?us-ascii?Q?zZ16Di3UyNi96eiIWHfpdKmVr/K4AwnYITfgGa+NPraxSx5F8W1PHDq1MZBH?=
 =?us-ascii?Q?iVdvD9mgKnGI4vZHkVfyhNfhOry+D5Zw15PW9Rznc7SlLpaXKrivSuHxp+Tz?=
 =?us-ascii?Q?t0e9jHWFJNZILvyd5AjkujXuXcapIv5ScbWISkUO4mb3L0yHD2CEV0AOaeQO?=
 =?us-ascii?Q?R7p9DWOwupu2G24weSqOpWkqRVW1aFyGOmLx1c5FN4O/XV3PyqvsFpbvfSJv?=
 =?us-ascii?Q?i6uwIMlFsUZeIs8FCSjEPuCmc6dAFSQSieTrge9Rng7rpKIdNx1fsfUEsPvg?=
 =?us-ascii?Q?vzOKXpfv+41j7H76o2s9RMxuRPKyXJ5Bx/HQepcT/n/lesY+4cVD6Tceq1co?=
 =?us-ascii?Q?3yQIlWAkrXd3W/6WsQwI8BiuhTMLr5zGM8j+lDIYGfeQb2LeJtN2KGTdwlXS?=
 =?us-ascii?Q?pwEq41XreJwvzwGZW004Nnu9kDnZMPTXcf8sXP1+0Vrn6lWjwkjuE+Y0d+MA?=
 =?us-ascii?Q?mfHFd7/uoOlnMTlCStFuP/EqJHJavPE3hZpqgGqyQ5O7BCY69OlYinBxER/A?=
 =?us-ascii?Q?n5OaQgZFuGl2n20u0170uiQE6nXpiE/eUKLEsFBmVYftDRnUEUQzaCPGPw/E?=
 =?us-ascii?Q?ElLOLcFnA5WA4w0NDskoQQw0+1o2CVIerY/wNDX1pKDDjA5OY3X+Yg47OvVp?=
 =?us-ascii?Q?kvzlyAIZL1Z0VezkrAru6MkolD5O+gqASqAmDBTV//syOzgL7X+Gi1MI36Dh?=
 =?us-ascii?Q?ouLLqDQ9cxH59MI6DMgRqYJ7vhx+PdjqRTZVxG/0SD/NF/gnm8QIFy8mfwtd?=
 =?us-ascii?Q?4NIYPxyYclsr2ylk4xTnu5AXaB57Khq81DNHKfr+4MBsH5ZA4qcsG+WGIEY+?=
 =?us-ascii?Q?DoGmaVLzQs++xGji2iKuSqchfQUtRmhICYjs+GfEOrEbc6COl4XVaNJx1cLD?=
 =?us-ascii?Q?9d1MOKTW1OFnKjaIzeN2wjncUoXz88TWLRVUagZoEMWAa2gLq6AeZKbIm5la?=
 =?us-ascii?Q?eG+hb4uekbp3hrJpuUd4XlDrTG+bpMxwDGY5qNe1xuaIIF54etYxjO+6GCEn?=
 =?us-ascii?Q?QoP3k+IoKsvwqjHMcTW+Akt3pF/2kVSxjyxi3ZQj12FHyYmSe9t3Xp0RU+e9?=
 =?us-ascii?Q?hq+oSFJXow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: a6bBJpS9JkvdtU2RvLOi58+QHkFhfAaDH9p/bYbQWWyDx+tSNrXZlqhHzZiHfswG6wuXp4UYDVnyPoNWv+Z2tSVB5Mk8QkotCV/nVHgo18zwdxHptlLGSp4Gz3PFVzSw3IPHJGluoaYgSPyOgJU/p95rgjCKP6kq/vOnT3cUs5r6pEdzqCAeLXkYDyoanPXJRLkSCxmuOUI7ymutZTThguOnXltzgJNlhXaFWNGJ3Hwf0xHn7mLqAwrLYkaTeJe3pJcscP8N+UVjyx6w8nFdVHwKBoetmMfUfBbdzdxbAieGskasz/oxxNsuH/MJJ5QZAci00/ajIDZf1bsgmvdXqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB507330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8d7501-1a7d-4ae9-5354-08df30e434ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 09:01:20.3687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLvSo6E56+KVDUIYCNZCqtIgv/ZQOlsLERCaogcC3i4C/qXOIVg4WXM6S/c3K22E6xO0nyey+fts7LpDEVmPOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Tuesday, October 20, 2026 7:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v3 4/7] lib/igt_pm: Add power/wakeup accessors
>=20
> Add PCI power/wakeup accessors for igt_pm:
>=20
> igt_pm_has_wakeup_support()
> igt_pm_set_wakeup_enabled()
> igt_pm_restore_wakeup()
>=20
> These helpers expose whether the device supports wakeup accounting and
> allow tests to enable/restore the power/wakeup sysfs attribute. This is
> needed for PME-based HPD tests, where both device wakeup support and
> the PM wakeup source must be enabled.
>=20
> v3:
> - Keep the kerneldoc generic, drop the xe specific note (Kunal)
> - Document that enabling power/wakeup on a device that had it disabled
>   creates a new wakeup source, so the power/wakeup_* counters restart
>   from 0 and callers need a fresh baseline (Kunal)
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

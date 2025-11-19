Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FB3CF58F1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 20:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09C810E690;
	Wed, 19 Nov 2025 20:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oE2q7Y8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865AE10E68B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 20:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763585604; x=1795121604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=apyb9tIa6ebKXX+ByhzA0rtH0h3PYcuIZl6cS13RAeQ=;
 b=oE2q7Y8q7jGNWFuSxzW1uyzWL5oda/xO6DytXBrdgGGY5/CCAr0qw00g
 mK0w/k2qTz/Ndr4dUAK7Za9HgyoA8/qzoUxwEb6VLQ/32+v7+ooEjT1Gz
 uR9BN9DCOKBNJmz9zw5IIZYkmi5Vk+Aw8FxEfrauiwPD4jO9jEcLzlHJw
 +PVm5x9Catk0WysUgPEHkAY4Mg2rs3Y4JOYt3lcZJ5EZ33HllqkWOxNyH
 jNno/ztDx4P2ssOrBfSeufez7aXPTyijpnAbfzzwgRnjLcdTeFS03mZVS
 EVs5WXsDJS3TxVH+bqISwBEIfdsekXDSFmOFExYbAmbrQbbfPV+HQypH7 Q==;
X-CSE-ConnectionGUID: +aKmNPM+SuqR6vwLwPmj1w==
X-CSE-MsgGUID: y/ikURqSS8231XKtrcERnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83265818"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208,217";a="83265818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:53:24 -0800
X-CSE-ConnectionGUID: K2/9XUneQjWMaJ842a6QuQ==
X-CSE-MsgGUID: h7PGrmOGToWoZMSeWNjCFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
 d="scan'208,217";a="191601711"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:53:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:53:23 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 12:53:23 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:53:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpFv8h+LVEyWB3EsUrOCI3h6N78kLhL8YtYI62YkLdE9jWtJ5gCLcI31Q4WmH47ZD9DXw7I15tUwoMBjGvUbV/0qsbYzt2X9jy2da103RuHj9kLFlQSCppzDXcLP+/7rJgBWrqHJyg+qoOuC9GAacGgKJuIiBrQ1mKPYc8PFBhiK3JMylKJrvHBf6qUhjCxyXzuwqjoFb0bvgzUGVO+6WBsXCzxwH7B8exBlmx74qHhaRZDVhsskrnoUGRMbAqrH6LoYJqe4A7O0H492joFbkSB9TDZtXDFDT7nWRt6iUMd+TPT1cNME8a3yHNWPA4QGCCxPrHVnmb6sIwRscqBOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlXuUgcl8SKxpDlLVG+zX58xmXUqK1Q6o8Ooi9y8HOE=;
 b=xrQoB8XYPYPURbiRan60z4fvBJMjZApgdZN5oCv5y3YLxq/vNmOiJDyxuUFcsyuZrx2Fsh5H/ClaWMKHuZD1442Clz5oTvrzv8vAvtidf8sWHicpkV+5ghRT9gL8/PRYj4VOsuc0MmnosAtfZ086xWbMOKavGAV+uQFhSqdbU5T6SiZ2pNiOG8fh8Kl5nIeUYvNKXjp3mPl7whJhrmFqBNZUV7qlu+pVUcg9N9remFuPJSnsgaJMPbgvITjPamqvzBGdWAiV2fD+/ncT2I/9ILC6ACsACb/g2GxJLttPaJ3eV4F1Dyhck+ry9O7t8DbejkUCCG9bTerPv3mJWVQjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 20:53:21 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:53:21 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Add multi-GT
 support
Thread-Topic: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Add multi-GT
 support
Thread-Index: AQHcSbNGuW3xQfDOY0WO4ONWWvl+/bT40hkAgAHEMGM=
Date: Wed, 19 Nov 2025 20:53:21 +0000
Message-ID: <CH0PR11MB542795443B093F0CEC4A07A098D7A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251030152405.3422044-1-s.sebinraj@intel.com>
 <20251030152405.3422044-3-s.sebinraj@intel.com>
 <20251118174246.4ou7g4fdfcu6kvir@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251118174246.4ou7g4fdfcu6kvir@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DM3PR11MB8672:EE_
x-ms-office365-filtering-correlation-id: b9e37ed0-3175-48b3-c27f-08de27adacb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?YAA9HW7OS8D1J2BZ8vtQlfJNOrpslYoSWQea5jBhhhQkaWcarB4OKhAty0?=
 =?iso-8859-1?Q?fDOm19FwrhdBHGE4ddSggdrduNuDhcl9Cgk0iPpqQtZQPaGPdOJ2L5HHeY?=
 =?iso-8859-1?Q?JdwGXB4bpXX7GQXAMZCbTa5nQrAar63NPQCYeqv/34H6XvQPUI9qG7O/yb?=
 =?iso-8859-1?Q?y1gnJeZ0K3JflVjVmSWwjewe/0C0FN2IoFDVtscmoSnGUGl3m1X6AyRLWs?=
 =?iso-8859-1?Q?yUk26+Z5/KI4iyKMoHdHTKygZjTMUN2h41AYm6qrMcyJFbDw9F6Fh6PfCw?=
 =?iso-8859-1?Q?kX9PgJ+BjkmbDIzuM9E+MGbrUQMwNs1PY9xJZ86mciE0NF+iS6btsRpzoQ?=
 =?iso-8859-1?Q?rWRVBSSiheHI+3cuSgjOFVwCQhl1pRx9cpyEqwZsif8Fu3kjc1yA3380uF?=
 =?iso-8859-1?Q?i2aEmUInLl77HYZ5nnjmY9vhz90pGpinoSq7M3qUdMq7Tx1Z6zzTA/Aupm?=
 =?iso-8859-1?Q?SGwyW7pLcBvZJEd6OrewnQVFVj0UlikTE5TKJngAAFX81EGQJOt01SuwIz?=
 =?iso-8859-1?Q?bpb6/pBwyp56mp9l3S6nwoArC7JvwUc+9AlGKxRMwanx+iAi3DTXmdnV0L?=
 =?iso-8859-1?Q?CeGMVr394DNRcU5FJ9Ih3iIy9qChoxG1k1J6c+4/h2IH0gPr4OM3rtgXjX?=
 =?iso-8859-1?Q?vIPi68345r9JEblOBTMnNTdAW/1BzMziEWNI7ld9bycAxkqegfRe/zZ6SO?=
 =?iso-8859-1?Q?Dn9ArBpvuVAfeK1N8jvXg5UWS+LddtT8FffOBrEG5o2YSgWx4ZXTndf26v?=
 =?iso-8859-1?Q?zvhtR9Y9RGuvIRRBPBlmLqobV7Bg9bM5nhTWnNalXcMol3BuV44bD6eERP?=
 =?iso-8859-1?Q?bWrnMA8Hvx9kGCw0QXEmNa35C2iDSFgdA9BIXUPy3gC4QkqJHRc7TA9ur7?=
 =?iso-8859-1?Q?zHwXt38FMVz/lLZhiGkfTWqssavXfuD1+iCv1kPvJIT4eYbhV5NxqYSFS+?=
 =?iso-8859-1?Q?lCM5GB9knWyF5esgNlQtlfJYVl7RGolEDzFwBWj0IK5sUfBLz7GMqxo9CK?=
 =?iso-8859-1?Q?SwFnXLxNTgkWgtVSlGPgRG+sKdVFPMTD2vN+taBCvT6IEvupbjOyMtGMEj?=
 =?iso-8859-1?Q?UWZiVh3ueAmDlxkeBSMph7pWwTU4a31UR9lv3MERZc8n7gtvzX481FK7nL?=
 =?iso-8859-1?Q?JSlB5g2C2A2NzgWGflM3LoYJ7NPcWniBXk1Xs78PZc7F+47bXfpRevq6zV?=
 =?iso-8859-1?Q?IXt44NTYJqQiRcKYxsH3G/AEYh+QKUn8BZfXgJhrlCHVmq1Ev2rWM+B94V?=
 =?iso-8859-1?Q?z6fFLfhQP8W8amqpA6AVOLMJBZnGiFnuenCTmaYZkp+XqGJ+2bq5ZUACgA?=
 =?iso-8859-1?Q?XlMoIL+48b2k3AbMbPcNfDXEqT5tWLz8l+2tsm/Gy8zyfHfJGWoKzNEdQJ?=
 =?iso-8859-1?Q?fJp2de/Kt3rxgz4/ieGCXzD+1Fol204xUEQERdEkNKjAfaKBx3Sn7ih84C?=
 =?iso-8859-1?Q?r2DRVup+XsLr0mKn54HiXKpksBYqQFApZSk0s/WnMCQP10ucmhuSbAXvRm?=
 =?iso-8859-1?Q?YKH77fbjlIkCJ5mf8nE71JFgEbQYPokuxBsu9dqG9KfQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oNIyxIq6gw30WpF9enTJe+8ZvTauBLQd1Nnd3nYHmZO5jTbw4DMSYEysBw?=
 =?iso-8859-1?Q?JuWYB0L/dmRIwuiM45XXQpzhXB2MD7+eXVnBlniInU+tEtcO0azzVY4oFl?=
 =?iso-8859-1?Q?5kVKtjyi9kcv10oWKG0gZbwQJYLNG36eFP9ZLVQS0ulmgxGoHd0Jr/dyq3?=
 =?iso-8859-1?Q?XNRZhznBNbgWZjfN6LsShKCn1xSBnmWypDhcy7fNcN4qaN79D03OQ49dhA?=
 =?iso-8859-1?Q?7DK6gFjwNK9hdzhSXRnB9e1n2Z/Rty/bN6a+aTmotALZBWkA+/zjDW3C4h?=
 =?iso-8859-1?Q?ftTVqBFXb0jshuoGRv8ORHf4FsfxgS6Ibhpzv9NyNKXIxfDFyqhrGRDnUN?=
 =?iso-8859-1?Q?fz336m2ZCHBrOZLlmZbiPwAqC5bIXeGK+IeIIH1aGUqzI4j4wOUmlvCyIc?=
 =?iso-8859-1?Q?d1IEYJDG0RWd+5NM9o/IIdzWHP+A7li4wssk/AuMXAy7r1Hz6Qd5W/DKz9?=
 =?iso-8859-1?Q?mR1QCIT+ZoOlgyHmxQhvh5wtrKZGiVta+TzgRW1z0Y9bX2gRVkF6pmhUqn?=
 =?iso-8859-1?Q?eamUWNw/iAIq/i43vrC0md/c/dmbsv1lxgEWQrOwwFLqoKjsaJbyhl1KZy?=
 =?iso-8859-1?Q?gq98Czp/YtrS9yaxWpICGtxyIgnaNvIbwwE7GfqyNiBDRsRwweu4HYNwiQ?=
 =?iso-8859-1?Q?j8vQwZTf3YV+LzZAYqqs2UIwhkTGJ8r/zZSIlrioSzL0I5zyb8BlN5ypcm?=
 =?iso-8859-1?Q?NUnYcTPx6PyL8K1OhGZbKVcGELfNmU4opY92o6sCFA4kohHGn2Gz4oZCtQ?=
 =?iso-8859-1?Q?/wF42J57BWTWH+tJQwxCZLhmM3arKiX4rj7/UFDZiYvZx/VfKFL9O+klv5?=
 =?iso-8859-1?Q?xb+t7uZGkD3BwfACxq7zFAfSYzV2gR7UC8CzeSc8srI6xpS4PjdsD9ocgb?=
 =?iso-8859-1?Q?u3LGlBqBAkv6G3sR5y9MXjY6qbpcAVKERN5OKLQtEcBlDX/aqvcGppf0X9?=
 =?iso-8859-1?Q?SXeFrj5C6mKdeDnJcgyPYUIxdvMsyOW7wbaqJmSN9xIbPn+TozLeT322RD?=
 =?iso-8859-1?Q?I5PBJTfTnPOd9NVFy9jYKlmzofRO8ePte3AVLYiyf6kaZM1d7bq0h5YIa0?=
 =?iso-8859-1?Q?NgC8nmO3uIhr1VfvbWDGtRE+7MbIYxFYwXd5xCPmwDX+9uBV2DVdGrSFgQ?=
 =?iso-8859-1?Q?KqI5gWWUqrU1+9pzji4XDhydCnXINNm/bhS7w6eE/NPxIblBMdSHCaFfXR?=
 =?iso-8859-1?Q?ffdSwHRQGnRJ0JGhZeis+JRpKlGglNIZ1kEEzmv9/MtELv4dUZWRZD8yeS?=
 =?iso-8859-1?Q?BxVTF12qvn1HII4SEcFSTX9vXVQA/b6Z0VJLlZmzNkPV7qcMfju2oIf1he?=
 =?iso-8859-1?Q?YOqSYoBfi4XdpBe1UL/EVmfXgdyS303ritCMlgEC+Lcs4iCwakCSH2sJ4V?=
 =?iso-8859-1?Q?GgQpZAHXLjxTd+azi+nj5ESoYdaxLAJsgb+6nH8JqRyaLOiYkrsqZ42y1y?=
 =?iso-8859-1?Q?xP49GeMdfhMVoXL0lK871NRi8ffJZnygBe6SBdr6sHP6s4rgr7Y2mryIMK?=
 =?iso-8859-1?Q?BbP0VHVgWZDtt8+UkMQw0pxIO2jHKnSYdnMLoapJr1NyCK8q+5MayefbgK?=
 =?iso-8859-1?Q?JhMJ4UDzs0ImQcXUaCS0F+qv+B5F0jhv2rbXJexE/w/muim6i3+N73v0p9?=
 =?iso-8859-1?Q?q2njGoPlrmbhANNzCWZjWYf9v5qKtRDaP9?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB542795443B093F0CEC4A07A098D7ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e37ed0-3175-48b3-c27f-08de27adacb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 20:53:21.2842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6j6AKjJawZ6skiia4gA8UpJUlH/r3ANEp8ZEW17riOyjr++zNKKnFD9RWCTvG5oFP4auzh4MEnzZUxTgm1Gxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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

--_000_CH0PR11MB542795443B093F0CEC4A07A098D7ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Tuesday, November 18, 2025 11:12 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Badrappa=
n, Jeevaka <jeevaka.badrappan@intel.com>; Kempczynski, Zbigniew <zbigniew.k=
empczynski@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Add multi-GT s=
upport

Hi S,
On 2025-10-30 at 20:54:04 +0530, S Sebinraj wrote:
> This change enhances intel_gpu_frequency to support Intel GPUs
> with multiple Graphics Technology (GT) units.
>
> Key improvements:
> - Add runtime GT detection using igt_sysfs_get_num_gt()
> - New --gt/-t option to specify target GT (defaults to GT0)
> - New --list-gts/-l option to display available GTs

> When there is a new option, man page also needs an update.
> Also imho please use --list only, because it could be later
> extended into tiles + GTs.

Okay I'll add that.

> - Update sysfs path generation to use igt_sysfs_gt_path()
> - As simulataneous read and write is not allowed, the same goes
>   vice versa, fix for the same is added.

> Simultanous is not allowed but you could do it one after another,
> so imho it should work unless user has no rigths to write, when
> she/he is not a root nor sudo.

Hi, when I checked the same, get, set inorder or vice-versa, it
doesn't seem to work and it throws assertion error. I did find
a solution for the same and will share the same in v3

>
> Usage examples:
>   intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
>   intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
>   intel_gpu_frequency --list-gts       # List available GTs
>
> The tool now dynamically detects available GTs at runtime and provides
> error messages when invalid GT numbers are specified. Also by default
> for set / get operations it acts upon all available GTs unless
> specified.

> Can it keep old behaviour and only for new option give more info?
> Also consider adding a little more, what about a table with
> freq in columns, and GTs/other info in raw? Like:

> card BDF:         min  curr RP   max (MHz)
> 0    0000:02:00.0 100  350  350  1300

Hi, imho keeping this old behaviour would make the new changes
a bit vary, as in the new changes the -t option to specify individual gts f=
or "get or set" does the same behaviour, and if I keep the old behaviour, i=
t would
render this new changes a bit meaning less. I was thinking of something lik=
e

"
intel_gpu_frequency
card/tile/GT    BDF                min   curr    RP1    max    RP0    RPn (=
MHz)
------------    ------------      ----   ----   ----   ----   ----   ----
0/t0/GT0        0000:00:02.0      1000   1000    400   1000   1800    100
0/t0/GT1        0000:00:02.0       800    800    400    800   1000    100

intel_gpu_frequency -g -s 1000 -t 0
card/tile/GT    BDF                min   curr    RP1    max    RP0    RPn (=
MHz)
------------    ------------      ----   ----   ----   ----   ----   ----
0/t0/GT0        0000:00:02.0      1000   1000    400   1000   1800    100

"

I'll share the next revision with these changes, Please have look and let m=
e
know if that works for you, If not I'll change accordinly.

Regards,
Sebin

> So with tile + GT it would be:

> card/tile/GT   BDF:    min  curr RP   max (MHz)
> 0/t0/GT0  0000:02:00.0 100  350  350  1300
>0/t0/GT1  0000:02:00.0 100  350  350  400

>What you think?

>Regards,
>Kamil

> PS. old one:
> Opened device: /dev/dri/card1
> cur: 350 MHz
> min: 100 MHz
> RP1: 350 MHz
> max: 1300 MHz

>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> Signed-off-by: Jeevaka Badrappan <jeevaka.badrappan@intel.com>
> ---
>  tools/intel_gpu_frequency.c | 255 ++++++++++++++++++++++++++----------
>  1 file changed, 188 insertions(+), 67 deletions(-)
>
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index 3378f3927..5c8c4d57e 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -24,14 +24,17 @@
>  #include <assert.h>
>  #include <getopt.h>
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <time.h>
>  #include <unistd.h>
>
>  #include "drmtest.h"
>  #include "igt_device.h"
> +#include "igt_sysfs.h"
>  #include "intel_chipset.h"
>
>  #define VERSION "1.0"
> +#define SYSFS_PATH_MAX 96
>
>  static int device, devid;
>
> @@ -61,29 +64,51 @@ static struct freq_info info[] =3D {
>  };
>
>  static char *
> -get_sysfs_path(const char *which)
> +get_sysfs_path(int fd, int gt_id, const char *which)
>  {
> -     static const char fmt[] =3D "/sys/class/drm/card%1d/gt_%3s_freq_mhz=
";
> -     char *path;
> -     int ret;
> +     static char path[SYSFS_PATH_MAX];
> +     char *gt_path;
> +     int path_len, ret;
> +
> +     gt_path =3D igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));
> +     if (gt_path =3D=3D NULL) {
> +             fprintf(stderr, "igt_sysfs_gt_path returned NULL for GT%d\n=
", gt_id);
> +             return NULL;
> +     }
> +     path_len =3D strlen(gt_path);
> +     ret =3D snprintf(path + path_len, sizeof(path) - path_len,
> +                    "/rps_%s_freq_mhz", which);
>
> -#define STATIC_STRLEN(string) (sizeof(string) / sizeof(string [0]))
> -     ret =3D asprintf(&path, fmt, device, which);
> -     assert(ret =3D=3D (STATIC_STRLEN(fmt) - 3));
> -#undef STATIC_STRLEN
> +     if (ret >=3D sizeof(path) - path_len) {
> +             fprintf(stderr, "Path truncated\n");
> +             return NULL;
> +     }
>
>        return path;
>  }
>
>  static void
> -initialize_freq_info(struct freq_info *freq_info)
> +initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id)
>  {
> -     if (freq_info->filp)
> -             return;
> +     /* Always close existing file handle and reopen for correct GT */
> +     if (freq_info->filp) {
> +             fclose(freq_info->filp);
> +             freq_info->filp =3D NULL;
> +     }
>
> -     freq_info->path =3D get_sysfs_path(freq_info->name);
> +     if (freq_info->path)
> +             free(freq_info->path);
> +
> +     freq_info->path =3D strdup(get_sysfs_path(fd, gt_id, freq_info->nam=
e));
> +     if (!freq_info->path) {
> +             fprintf(stderr, "Failed to get sysfs path for %s on GT%d\n"=
,
> +                     freq_info->name, gt_id);
> +     }
>        assert(freq_info->path);
> +
>        freq_info->filp =3D fopen(freq_info->path, freq_info->mode);
> +     if (!freq_info->filp)
> +             fprintf(stderr, "Failed to open %s\n", freq_info->path);
>        assert(freq_info->filp);
>  }
>
> @@ -97,31 +122,75 @@ static void wait_freq_settle(void)
>        clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
>  }
>
> -static void set_frequency(struct freq_info *freq_info, int val)
> +static void set_frequency(struct freq_info *freq_info, int fd, int gt_id=
, int val)
>  {
> -     initialize_freq_info(freq_info);
> +     initialize_freq_info(freq_info, fd, gt_id);
>        rewind(freq_info->filp);
>        assert(fprintf(freq_info->filp, "%d", val) > 0);
>
>        wait_freq_settle();
>  }
>
> -static int get_frequency(struct freq_info *freq_info)
> +static int get_frequency(struct freq_info *freq_info, int fd, int gt_id)
>  {
>        int val;
>
> -     initialize_freq_info(freq_info);
> +     initialize_freq_info(freq_info, fd, gt_id);
>        rewind(freq_info->filp);
>        assert(fscanf(freq_info->filp, "%d", &val)=3D=3D1);
>
>        return val;
>  }
>
> +static void process_gt_frequencies(int fd, int gt_id, bool write, bool *=
targets, int *set_freq)
> +{
> +     int i, try =3D 1;
> +     bool fail =3D write;
> +
> +     if (igt_sysfs_get_num_gt(fd) > 1)
> +             printf("\n--- GT%d ---\n", gt_id);
> +
> +     /* If we've previously locked the frequency, we need to make sure t=
o set things
> +      * in the correct order, or else the operation will fail (ie. min =
=3D max =3D 200,
> +      * and we set min to 300, we fail because it would try to set min >
> +      * max). This can be accomplished be going either forward or revers=
e
> +      * through the loop. MIN is always before MAX.
> +      *
> +      * XXX: Since only min and max are at play, the super lazy way is t=
o do this
> +      * 3 times and if we still fail after 3, it's for real.
> +      */
> +again:
> +     if (try > 2) {
> +             fprintf(stderr, "Did not achieve desired freq on GT%d.\n", =
gt_id);
> +             exit(EXIT_FAILURE);
> +     }
> +     for (i =3D 0; i < ARRAY_SIZE(info); i++) {
> +             if (targets[i] =3D=3D false)
> +                     continue;
> +
> +             if (write) {
> +                     set_frequency(&info[i], fd, gt_id, set_freq[i]);
> +                     if (get_frequency(&info[i], fd, gt_id) !=3D set_fre=
q[i])
> +                             fail =3D true;
> +                     else
> +                             fail =3D false;
> +             } else {
> +                     printf("%s: %d MHz\n", info[i].name, get_frequency(=
&info[i], fd, gt_id));
> +             }
> +     }
> +
> +     if (fail) {
> +             try++;
> +             goto again;
> +     }
> +}
> +
>  static void __attribute__((noreturn))
>  usage(const char *prog)
>  {
>        printf("%s A program to manipulate Intel GPU frequencies.\n\n", pr=
og);
> -     printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz=
]\n\n", prog);
> +     printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz=
] ", prog);
> +     printf("[--gt gt_number]\n\n");
>        printf("Options: \n");
>        printf("  -e            Lock frequency to the most efficient frequ=
ency\n");
>        printf("  -g, --get     Get all the frequency settings\n");
> @@ -130,13 +199,18 @@ usage(const char *prog)
>        printf("  -m  --max     Lock frequency to max frequency\n");
>        printf("  -i  --min     Lock frequency to min (never a good idea, =
DEBUG ONLY)\n");
>        printf("  -d  --defaults  Return the system to hardware defaults\n=
");
> +     printf("  -t  --gt      Specify GT number (0, 1, 2, etc.). Default:=
 0\n");
> +     printf("  -l  --list-gts List available GTs\n");
>        printf("  -h  --help    Returns this\n");
>        printf("  -v  --version Version\n");
>        printf("\n");
>        printf("Examples:\n");
> -     printf("   intel_gpu_frequency --get\t\tGet the current and minimum=
 frequency\n");
> -     printf("   intel_gpu_frequency --set 400\tLock frequency to 400Mhz\=
n");
> -     printf("   intel_gpu_frequency --custom max=3D750\tSet the max freq=
uency to 750MHz\n");
> +     printf("   intel_gpu_frequency --get\t\t\tGet frequency settings fo=
r all GTs\n");
> +     printf("   intel_gpu_frequency --get --gt 1\t\tGet frequency settin=
gs for GT1 only\n");
> +     printf("   intel_gpu_frequency --set 400\t\t\tLock all GTs frequenc=
y to 400Mhz\n");
> +     printf("   intel_gpu_frequency --set 400 --gt 1\tLock GT1 frequency=
 to 400Mhz\n");
> +     printf("   intel_gpu_frequency --custom max=3D750 --gt 0\tSet GT0 m=
ax frequency to 750MHz\n");
> +     printf("   intel_gpu_frequency --list-gts\t\tList all available GTs=
\n");
>        printf("\n");
>        printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-=
tools/-/issues\n");
>        exit(EXIT_FAILURE);
> @@ -151,11 +225,13 @@ version(const char *prog)
>
>  /* Returns read or write operation */
>  static bool
> -parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *ne=
w_freq)
> +parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon_n,
> +     int *new_freq, bool *list_gts, int *specified_gt)
>  {
>        int c, tmp;
>        bool write =3D false;
>        bool reader =3D false;
> +     bool gtt_specified =3D false;
>
>        /* No args means -g" */
>        if (argc =3D=3D 1) {
> @@ -173,11 +249,13 @@ parse(int argc, char *argv[], bool *act_upon, size_=
t act_upon_n, int *new_freq)
>                        { "max", no_argument, NULL, 'm' },
>                        { "defaults", no_argument, NULL, 'd' },
>                        { "help", no_argument, NULL, 'h' },
> +                     { "gt", required_argument, NULL, 't' },
> +                     { "list-gts", no_argument, NULL, 'l' },
>                        { "version", no_argument, NULL, 'v' },
>                        { NULL, 0, NULL, 0}
>                };
>
> -             c =3D getopt_long(argc, argv, "egs:c:midh", long_options, &=
option_index);
> +             c =3D getopt_long(argc, argv, "egs:c:midht:lv", long_option=
s, &option_index);
>                if (c =3D=3D -1)
>                        break;
>
> @@ -245,7 +323,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq)
>                                        "FIXME: Warning efficient frequenc=
y information is incorrect.\n");
>                                exit(EXIT_FAILURE);
>                        }
> -                     tmp =3D get_frequency(&info[EFF]);
> +                     tmp =3D get_frequency(&info[EFF], fd, *specified_gt=
 >=3D 0 ? *specified_gt : 0);
>                        new_freq[MIN] =3D tmp;
>                        new_freq[MAX] =3D tmp;
>                        act_upon[MIN] =3D true;
> @@ -253,7 +331,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq)
>                        write =3D true;
>                        break;
>                case 'i': /* mIn */
> -                     tmp =3D get_frequency(&info[RPn]);
> +                     tmp =3D get_frequency(&info[RPn], fd,
> +                                         *specified_gt >=3D 0 ? *specifi=
ed_gt : 0);
>                        new_freq[MIN] =3D tmp;
>                        new_freq[MAX] =3D tmp;
>                        act_upon[MIN] =3D true;
> @@ -261,7 +340,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq)
>                        write =3D true;
>                        break;
>                case 'm': /* max */
> -                     tmp =3D get_frequency(&info[RP0]);
> +                     tmp =3D get_frequency(&info[RP0], fd,
> +                                         *specified_gt >=3D 0 ? *specifi=
ed_gt : 0);
>                        new_freq[MIN] =3D tmp;
>                        new_freq[MAX] =3D tmp;
>                        act_upon[MIN] =3D true;
> @@ -269,12 +349,32 @@ parse(int argc, char *argv[], bool *act_upon, size_=
t act_upon_n, int *new_freq)
>                        write =3D true;
>                        break;
>                case 'd': /* defaults */
> -                     new_freq[MIN] =3D get_frequency(&info[RPn]);
> -                     new_freq[MAX] =3D get_frequency(&info[RP0]);
> +                     new_freq[MIN] =3D get_frequency(&info[RPn], fd,
> +                                                   *specified_gt >=3D 0 =
? *specified_gt : 0);
> +                     new_freq[MAX] =3D get_frequency(&info[RP0], fd,
> +                                                   *specified_gt >=3D 0 =
? *specified_gt : 0);
>                        act_upon[MIN] =3D true;
>                        act_upon[MAX] =3D true;
>                        write =3D true;
>                        break;
> +             case 't': /* gt */
> +                     if (!optarg)
> +                             usage(argv[0]);
> +
> +                     if (gtt_specified) {
> +                             fprintf(stderr, "Only one GT may be specifi=
ed at a time\n");
> +                             exit(EXIT_FAILURE);
> +                     }
> +                     *specified_gt =3D atoi(optarg);
> +                     if (*specified_gt < 0) {
> +                             fprintf(stderr, "Invalid GT number: %d\n", =
*specified_gt);
> +                             exit(EXIT_FAILURE);
> +                     }
> +                     gtt_specified =3D true;
> +                     break;
> +             case 'l': /* list-gts */
> +                     *list_gts =3D true;
> +                     break;
>                case 'v':
>                        version(argv[0]);
>                        exit(0);
> @@ -288,60 +388,81 @@ done:
>        return write;
>  }
>
> -int main(int argc, char *argv[])
> +static void list_available_gts(int fd, int num_gts)
>  {
> +     int i;
> +
> +     printf("Available GTs: %d\n", num_gts);
> +     for (i =3D 0; i < num_gts; i++) {
> +             char path[SYSFS_PATH_MAX];
>
> -     bool write, fail, targets[MAX+1] =3D {false};
> -     int i, fd, try =3D 1, set_freq[MAX+1] =3D {0};
> +             if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
> +                     printf("  GT%d: %s\n", i, path);
> +     }
> +}
> +
> +static void validate_specified_gt(int fd, int specified_gt, int num_gts)
> +{
> +     if (specified_gt >=3D 0) {
> +             if (specified_gt >=3D num_gts) {
> +                     fprintf(stderr, "Error: GT%d does not exist. Availa=
ble GTs: 0-%d\n",
> +                             specified_gt, num_gts - 1);
> +                     close(fd);
> +                     exit(EXIT_FAILURE);
> +             }
> +             printf("Operating on GT%d (Total GTs: %d)\n", specified_gt,=
 num_gts);
> +     } else {
> +             printf("Operating on all GTs (Total GTs: %d)\n", num_gts);
> +     }
> +}
> +
> +static void execute_frequency_operations(int fd, int specified_gt, bool =
write,
> +                                      bool *targets, int *set_freq)
> +{
> +     int target_gt;
> +
> +     if (specified_gt >=3D 0) {
> +             /* Process single specified GT */
> +             process_gt_frequencies(fd, specified_gt, write, targets, se=
t_freq);
> +     } else {
> +             /* Process all GTs using for_each_gt pattern */
> +             int gt_dir;
> +
> +             i915_for_each_gt(fd, gt_dir, target_gt) {
> +                     process_gt_frequencies(fd, target_gt, write, target=
s, set_freq);
> +             }
> +     }
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +     bool write, targets[MAX+1] =3D {false}, list_gts =3D false;
> +     int i, fd, set_freq[MAX+1] =3D {0}, num_gts;
> +     int specified_gt =3D -1;
>
>        fd =3D __drm_open_driver(DRIVER_INTEL);
>        devid =3D intel_get_drm_devid(fd);
>        device =3D igt_device_get_card_index(fd);
> -     close(fd);
> +     num_gts =3D igt_sysfs_get_num_gt(fd);
>
> -     write =3D parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq)=
;
> -     fail =3D write;
> +     write =3D parse(argc, argv, fd, targets, ARRAY_SIZE(targets), set_f=
req,
> +                   &list_gts, &specified_gt);
>
> -     /* If we've previously locked the frequency, we need to make sure t=
o set things
> -      * in the correct order, or else the operation will fail (ie. min =
=3D max =3D 200,
> -      * and we set min to 300, we fail because it would try to set min >
> -      * max). This can be accomplished be going either forward or revers=
e
> -      * through the loop. MIN is always before MAX.
> -      *
> -      * XXX: Since only min and max are at play, the super lazy way is t=
o do this
> -      * 3 times and if we still fail after 3, it's for real.
> -      */
> -again:
> -     if (try > 2) {
> -             fprintf(stderr, "Did not achieve desired freq.\n");
> -             exit(EXIT_FAILURE);
> -     }
> -     for (i =3D 0; i < ARRAY_SIZE(targets); i++) {
> -             if (targets[i] =3D=3D false)
> -                     continue;
> +     /* Handle --list-gts option */
> +     if (list_gts)
> +             list_available_gts(fd, num_gts);
>
> -             if (write) {
> -                     set_frequency(&info[i], set_freq[i]);
> -                     if (get_frequency(&info[i]) !=3D set_freq[i])
> -                             fail =3D true;
> -                     else
> -                             fail =3D false;
> -             } else {
> -                     printf("%s: %d MHz\n", info[i].name, get_frequency(=
&info[i]));
> -             }
> -     }
> +     /* Validate specified GT */
> +     validate_specified_gt(fd, specified_gt, num_gts);
>
> -     if (fail) {
> -             try++;
> -             goto again;
> -     }
> +     /* Process frequencies for specified GT or all GTs */
> +     execute_frequency_operations(fd, specified_gt, write, targets, set_=
freq);
>
>        for (i =3D 0; i < ARRAY_SIZE(targets); i++) {
> -             if (info[i].filp) {
> +             if (info[i].filp)
>                        fclose(info[i].filp);
> -                     free(info[i].path);
> -             }
>        }
>
> +     close(fd);
>        return EXIT_SUCCESS;
>  }
> --
> 2.43.0
>

--_000_CH0PR11MB542795443B093F0CEC4A07A098D7ACH0PR11MB5427namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
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
<b>Sent:</b>&nbsp;Tuesday, November 18, 2025 11:12 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel.com&gt;; Kempczyns=
ki, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;; Konieczny, Kamil &lt;k=
amil.konieczny@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Ad=
d multi-GT support
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S,<br>
On 2025-10-30 at 20:54:04 +0530, S Sebinraj wrote:<br>
&gt; This change enhances intel_gpu_frequency to support Intel GPUs<br>
&gt; with multiple Graphics Technology (GT) units.<br>
&gt;<br>
&gt; Key improvements:<br>
&gt; - Add runtime GT detection using igt_sysfs_get_num_gt()<br>
&gt; - New --gt/-t option to specify target GT (defaults to GT0)<br>
&gt; - New --list-gts/-l option to display available GTs<br>
<br>
&gt; When there is a new option, man page also needs an update.<br>
&gt; Also imho please use --list only, because it could be later<br>
&gt; extended into tiles + GTs.<br>
<br>
Okay I'll add that.<br>
<br>
&gt; - Update sysfs path generation to use igt_sysfs_gt_path()<br>
&gt; - As simulataneous read and write is not allowed, the same goes<br>
&gt;&nbsp;&nbsp; vice versa, fix for the same is added.<br>
<br>
&gt; Simultanous is not allowed but you could do it one after another,<br>
&gt; so imho it should work unless user has no rigths to write, when<br>
&gt; she/he is not a root nor sudo.<br>
<br>
Hi, when I checked the same, get, set inorder or vice-versa, it</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">doesn't seem to wo=
rk and it throws assertion&nbsp;error. I did find</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">a solution for the=
 same and will share the same in v3<br>
<br>
&gt;<br>
&gt; Usage examples:<br>
&gt;&nbsp;&nbsp; intel_gpu_frequency --get --gt 1&nbsp;&nbsp;&nbsp;&nbsp; #=
 Get GT1 frequencies<br>
&gt;&nbsp;&nbsp; intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency<b=
r>
&gt;&nbsp;&nbsp; intel_gpu_frequency --list-gts&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; # List available GTs<br>
&gt;<br>
&gt; The tool now dynamically detects available GTs at runtime and provides=
<br>
&gt; error messages when invalid GT numbers are specified. Also by default<=
br>
&gt; for set / get operations it acts upon all available GTs unless<br>
&gt; specified.<br>
<br>
&gt; Can it keep old behaviour and only for new option give more info?<br>
&gt; Also consider adding a little more, what about a table with<br>
&gt; freq in columns, and GTs/other info in raw? Like:<br>
<br>
&gt; card BDF:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min&nbsp; cu=
rr RP&nbsp;&nbsp; max (MHz)<br>
&gt; 0&nbsp;&nbsp;&nbsp; 0000:02:00.0 100&nbsp; 350&nbsp; 350&nbsp; 1300<br=
>
<br>
Hi, imho keeping this old behaviour would make the new changes</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">a bit vary, as in =
the new changes the -t option to specify individual gts for &quot;get or se=
t&quot;
<span style=3D"color: rgb(0, 0, 0);">does the same behaviour, and if I keep=
 the old behaviour, it would&nbsp;</span></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">render this new changes a bit meaning less. I was thinking of something =
like</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">&quot;</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>intel_gpu_frequency</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>card/tile/GT &nbsp; &nbsp;BDF &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;min &nbsp; curr &nbsp; &nbsp;RP1 &nbsp; &nbsp;max &nbsp; &n=
bsp;RP0 &nbsp; &nbsp;RPn (MHz)</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>------------ &nbsp; &nbsp;------------ &nbsp; &nbsp; &nbsp;---- &nbsp=
; ---- &nbsp; ---- &nbsp; ---- &nbsp; ---- &nbsp; ----</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>0/t0/GT0 &nbsp; &nbsp; &nbsp; &nbsp;0000:00:02.0 &nbsp; &nbsp; &nbsp;=
1000 &nbsp; 1000 &nbsp; &nbsp;400 &nbsp; 1000 &nbsp; 1800 &nbsp; &nbsp;100<=
/i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>0/t0/GT1 &nbsp; &nbsp; &nbsp; &nbsp;0000:00:02.0 &nbsp; &nbsp; &nbsp;=
 800 &nbsp; &nbsp;800 &nbsp; &nbsp;400 &nbsp; &nbsp;800 &nbsp; 1000 &nbsp; =
&nbsp;100</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i><br>
</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>intel_gpu_frequency -g -s 1000 -t 0</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>card/tile/GT &nbsp; &nbsp;BDF &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;min &nbsp; curr &nbsp; &nbsp;RP1 &nbsp; &nbsp;max &nbsp; &n=
bsp;RP0 &nbsp; &nbsp;RPn (MHz)</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>------------ &nbsp; &nbsp;------------ &nbsp; &nbsp; &nbsp;---- &nbsp=
; ---- &nbsp; ---- &nbsp; ---- &nbsp; ---- &nbsp; ----</i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i>0/t0/GT0 &nbsp; &nbsp; &nbsp; &nbsp;0000:00:02.0 &nbsp; &nbsp; &nbsp;=
1000 &nbsp; 1000 &nbsp; &nbsp;400 &nbsp; 1000 &nbsp; 1800 &nbsp; &nbsp;100<=
/i></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><i><br>
</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I'll share the next revision with these changes, Please have look and let m=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
know if that works for you, If not I'll change accordinly.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Regards,</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Sebin</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; So with tile + GT it would be:<br>
<br>
&gt; card/tile/GT&nbsp;&nbsp; BDF:&nbsp;&nbsp;&nbsp; min&nbsp; curr RP&nbsp=
;&nbsp; max (MHz)<br>
&gt; 0/t0/GT0&nbsp; 0000:02:00.0 100&nbsp; 350&nbsp; 350&nbsp; 1300<br>
&gt;0/t0/GT1&nbsp; 0000:02:00.0 100&nbsp; 350&nbsp; 350&nbsp; 400<br>
<br>
&gt;What you think?<br>
<br>
&gt;Regards,<br>
&gt;Kamil<br>
<br>
&gt; PS. old one:<br>
&gt; Opened device: /dev/dri/card1<br>
&gt; cur: 350 MHz<br>
&gt; min: 100 MHz<br>
&gt; RP1: 350 MHz<br>
&gt; max: 1300 MHz<br>
<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; Signed-off-by: Jeevaka Badrappan &lt;jeevaka.badrappan@intel.com&gt;<b=
r>
&gt; ---<br>
&gt;&nbsp; tools/intel_gpu_frequency.c | 255 ++++++++++++++++++++++++++----=
------<br>
&gt;&nbsp; 1 file changed, 188 insertions(+), 67 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c=
<br>
&gt; index 3378f3927..5c8c4d57e 100644<br>
&gt; --- a/tools/intel_gpu_frequency.c<br>
&gt; +++ b/tools/intel_gpu_frequency.c<br>
&gt; @@ -24,14 +24,17 @@<br>
&gt;&nbsp; #include &lt;assert.h&gt;<br>
&gt;&nbsp; #include &lt;getopt.h&gt;<br>
&gt;&nbsp; #include &lt;stdio.h&gt;<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt;&nbsp; #include &lt;time.h&gt;<br>
&gt;&nbsp; #include &lt;unistd.h&gt;<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &quot;drmtest.h&quot;<br>
&gt;&nbsp; #include &quot;igt_device.h&quot;<br>
&gt; +#include &quot;igt_sysfs.h&quot;<br>
&gt;&nbsp; #include &quot;intel_chipset.h&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; #define VERSION &quot;1.0&quot;<br>
&gt; +#define SYSFS_PATH_MAX 96<br>
&gt;&nbsp;<br>
&gt;&nbsp; static int device, devid;<br>
&gt;&nbsp;<br>
&gt; @@ -61,29 +64,51 @@ static struct freq_info info[] =3D {<br>
&gt;&nbsp; };<br>
&gt;&nbsp;<br>
&gt;&nbsp; static char *<br>
&gt; -get_sysfs_path(const char *which)<br>
&gt; +get_sysfs_path(int fd, int gt_id, const char *which)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; static const char fmt[] =3D &quot;/sys/class=
/drm/card%1d/gt_%3s_freq_mhz&quot;;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; char *path;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; static char path[SYSFS_PATH_MAX];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *gt_path;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int path_len, ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gt_path =3D igt_sysfs_gt_path(fd, gt_id, pat=
h, sizeof(path));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (gt_path =3D=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;igt_sysfs_gt_path returned NULL for GT%d\n&quot;,=
 gt_id);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; path_len =3D strlen(gt_path);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D snprintf(path + path_len, sizeof(pat=
h) - path_len,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/rps_%s_freq_mhz&quot;,=
 which);<br>
&gt;&nbsp;<br>
&gt; -#define STATIC_STRLEN(string) (sizeof(string) / sizeof(string [0]))<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D asprintf(&amp;path, fmt, device, whi=
ch);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; assert(ret =3D=3D (STATIC_STRLEN(fmt) - 3));=
<br>
&gt; -#undef STATIC_STRLEN<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret &gt;=3D sizeof(path) - path_len) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Path truncated\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return path;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; static void<br>
&gt; -initialize_freq_info(struct freq_info *freq_info)<br>
&gt; +initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id)<=
br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info-&gt;filp)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Always close existing file handle and reo=
pen for correct GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info-&gt;filp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fclose(freq_info-&gt;filp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; freq_info-&gt;filp =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;path =3D get_sysfs_path(freq_i=
nfo-&gt;name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info-&gt;path)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; free(freq_info-&gt;path);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;path =3D strdup(get_sysfs_path=
(fd, gt_id, freq_info-&gt;name));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!freq_info-&gt;path) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Failed to get sysfs path for %s on GT%d\n&quot;,<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;name, gt_=
id);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(freq_info-&gt;path);<=
br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;filp =3D fopen=
(freq_info-&gt;path, freq_info-&gt;mode);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!freq_info-&gt;filp)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Failed to open %s\n&quot;, freq_info-&gt;path);<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(freq_info-&gt;filp);<=
br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; @@ -97,31 +122,75 @@ static void wait_freq_settle(void)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock_nanosleep(CLOCK_MONOTO=
NIC, 0, &amp;ts, NULL);<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -static void set_frequency(struct freq_info *freq_info, int val)<br>
&gt; +static void set_frequency(struct freq_info *freq_info, int fd, int gt=
_id, int val)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info, fd, gt_id);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rewind(freq_info-&gt;filp);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fprintf(freq_info-&gt=
;filp, &quot;%d&quot;, val) &gt; 0);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wait_freq_settle();<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -static int get_frequency(struct freq_info *freq_info)<br>
&gt; +static int get_frequency(struct freq_info *freq_info, int fd, int gt_=
id)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int val;<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info, fd, gt_id);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rewind(freq_info-&gt;filp);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fscanf(freq_info-&gt;=
filp, &quot;%d&quot;, &amp;val)=3D=3D1);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return val;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +static void process_gt_frequencies(int fd, int gt_id, bool write, boo=
l *targets, int *set_freq)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i, try =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool fail =3D write;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (igt_sysfs_get_num_gt(fd) &gt; 1)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; printf(&quot;\n--- GT%d ---\n&quot;, gt_id);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* If we've previously locked the frequency,=
 we need to make sure to set things<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * in the correct order, or else the op=
eration will fail (ie. min =3D max =3D 200,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and we set min to 300, we fail becau=
se it would try to set min &gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * max). This can be accomplished be go=
ing either forward or reverse<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * through the loop. MIN is always befo=
re MAX.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * XXX: Since only min and max are at p=
lay, the super lazy way is to do this<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 3 times and if we still fail after 3=
, it's for real.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +again:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (try &gt; 2) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Did not achieve desired freq on GT%d.\n&quot;, gt=
_id);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; exit(EXIT_FAILURE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(info); i++) =
{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (targets[i] =3D=3D false)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (write) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_frequency(&amp;info=
[i], fd, gt_id, set_freq[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (get_frequency(&amp;=
info[i], fd, gt_id) !=3D set_freq[i])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fail =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fail =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%s: %d MHz=
\n&quot;, info[i].name, get_frequency(&amp;info[i], fd, gt_id));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (fail) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; try++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto again;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static void __attribute__((noreturn))<br>
&gt;&nbsp; usage(const char *prog)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%s A program to=
 manipulate Intel GPU frequencies.\n\n&quot;, prog);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Usage: %s [-e] [--min | --max] =
[--get] [--set frequency_mhz]\n\n&quot;, prog);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Usage: %s [-e] [--min | --max] =
[--get] [--set frequency_mhz] &quot;, prog);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;[--gt gt_number]\n\n&quot;);<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Options: \n&quo=
t;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -e&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lock frequency=
 to the most efficient frequency\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -g, --ge=
t&nbsp;&nbsp;&nbsp;&nbsp; Get all the frequency settings\n&quot;);<br>
&gt; @@ -130,13 +199,18 @@ usage(const char *prog)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -m&nbsp;=
 --max&nbsp;&nbsp;&nbsp;&nbsp; Lock frequency to max frequency\n&quot;);<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -i&nbsp;=
 --min&nbsp;&nbsp;&nbsp;&nbsp; Lock frequency to min (never a good idea, DE=
BUG ONLY)\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -d&nbsp;=
 --defaults&nbsp; Return the system to hardware defaults\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -t&nbsp; --gt&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Specify GT number (0, 1, 2, etc.). Default: 0\n&quot;);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -l&nbsp; --list-gts List=
 available GTs\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -h&nbsp;=
 --help&nbsp;&nbsp;&nbsp; Returns this\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -v&nbsp;=
 --version Version\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Examples:\n&quo=
t;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --get\t\tGet the current and minimum frequency\n&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --set 400\tLock frequency to 400Mhz\n&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --custom max=3D750\tSet the max frequency to 750MHz\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --get\t\t\tGet frequency settings for all GTs\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --get --gt 1\t\tGet frequency settings for GT1 only\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --set 400\t\t\tLock all GTs frequency to 400Mhz\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --set 400 --gt 1\tLock GT1 frequency to 400Mhz\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --custom max=3D750 --gt 0\tSet GT0 max frequency to 750MHz\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_frequenc=
y --list-gts\t\tList all available GTs\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Report bugs to =
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAdee99f14-5491=
-8b9c-4edb-383d7da62554" href=3D"https://gitlab.freedesktop.org/drm/igt-gpu=
-tools/-/issues\n&quot;)">
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n&quot;)</a>;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt; @@ -151,11 +225,13 @@ version(const char *prog)<br>
&gt;&nbsp;<br>
&gt;&nbsp; /* Returns read or write operation */<br>
&gt;&nbsp; static bool<br>
&gt; -parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int =
*new_freq)<br>
&gt; +parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon=
_n,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int *new_freq, bool *list_gts, int *specifie=
d_gt)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int c, tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool write =3D false;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool reader =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool gtt_specified =3D false;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* No args means -g&quot; */=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (argc =3D=3D 1) {<br>
&gt; @@ -173,11 +249,13 @@ parse(int argc, char *argv[], bool *act_upon, si=
ze_t act_upon_n, int *new_freq)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot=
;max&quot;, no_argument, NULL, 'm' },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot=
;defaults&quot;, no_argument, NULL, 'd' },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot=
;help&quot;, no_argument, NULL, 'h' },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;gt&quot;, requi=
red_argument, NULL, 't' },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;list-gts&quot;,=
 no_argument, NULL, 'l' },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot=
;version&quot;, no_argument, NULL, 'v' },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL,=
 0, NULL, 0}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; };<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; c =3D getopt_long(argc, argv, &quot;egs:c:midh&quot;, long_options, &am=
p;option_index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; c =3D getopt_long(argc, argv, &quot;egs:c:midht:lv&quot;, long_options,=
 &amp;option_index);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (c =3D=3D -1)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp;<br>
&gt; @@ -245,7 +323,7 @@ parse(int argc, char *argv[], bool *act_upon, size=
_t act_upon_n, int *new_freq)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;FIXME: Warning efficient frequency information is incor=
rect.\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_frequency(&=
amp;info[EFF]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_frequency(&=
amp;info[EFF], fd, *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_fre=
q[MIN] =3D tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_fre=
q[MAX] =3D tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_upo=
n[MIN] =3D true;<br>
&gt; @@ -253,7 +331,8 @@ parse(int argc, char *argv[], bool *act_upon, size=
_t act_upon_n, int *new_freq)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write =
=3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case 'i': /* mIn */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_frequency(&=
amp;info[RPn]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_frequency(&=
amp;info[RPn], fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_fre=
q[MIN] =3D tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_fre=
q[MAX] =3D tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_upo=
n[MIN] =3D true;<br>
&gt; @@ -261,7 +340,8 @@ parse(int argc, char *argv[], bool *act_upon, size=
_t act_upon_n, int *new_freq)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write =
=3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case 'm': /* max */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_frequency(&=
amp;info[RP0]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_frequency(&=
amp;info[RP0], fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_fre=
q[MIN] =3D tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_fre=
q[MAX] =3D tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_upo=
n[MIN] =3D true;<br>
&gt; @@ -269,12 +349,32 @@ parse(int argc, char *argv[], bool *act_upon, si=
ze_t act_upon_n, int *new_freq)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write =
=3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case 'd': /* defaults */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MIN] =3D get_f=
requency(&amp;info[RPn]);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MAX] =3D get_f=
requency(&amp;info[RP0]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MIN] =3D get_f=
requency(&amp;info[RPn], fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MAX] =3D get_f=
requency(&amp;info[RP0], fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_upo=
n[MIN] =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_upo=
n[MAX] =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write =
=3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 't': /* gt */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!optarg)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; usage(argv[0]);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gtt_specified) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;Only one GT may be specified=
 at a time\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *specified_gt =3D atoi(=
optarg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*specified_gt &lt; =
0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;Invalid GT number: %d\n&quot=
;, *specified_gt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gtt_specified =3D true;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 'l': /* list-gts */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *list_gts =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case 'v':<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version=
(argv[0]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(0)=
;<br>
&gt; @@ -288,60 +388,81 @@ done:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return write;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -int main(int argc, char *argv[])<br>
&gt; +static void list_available_gts(int fd, int num_gts)<br>
&gt;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Available GTs: %d\n&quot;, num_=
gts);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; num_gts; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char path[SYSFS_PATH_MAX];<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; bool write, fail, targets[MAX+1] =3D {false}=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int i, fd, try =3D 1, set_freq[MAX+1] =3D {0=
};<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; GT%=
d: %s\n&quot;, i, path);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void validate_specified_gt(int fd, int specified_gt, int num_g=
ts)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (specified_gt &gt;=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (specified_gt &gt;=3D num_gts) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;E=
rror: GT%d does not exist. Available GTs: 0-%d\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; specified_gt, num_gts - 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; printf(&quot;Operating on GT%d (Total GTs: %d)\n&quot;, specified_gt, n=
um_gts);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; printf(&quot;Operating on all GTs (Total GTs: %d)\n&quot;, num_gts);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void execute_frequency_operations(int fd, int specified_gt, bo=
ol write,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool *targets, int *set_freq)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int target_gt;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (specified_gt &gt;=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Process single specified GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; process_gt_frequencies(fd, specified_gt, write, targets, set_freq);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Process all GTs using for_each_gt pattern */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int gt_dir;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; i915_for_each_gt(fd, gt_dir, target_gt) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_gt_frequencies(=
fd, target_gt, write, targets, set_freq);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +int main(int argc, char *argv[])<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool write, targets[MAX+1] =3D {false}, list=
_gts =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i, fd, set_freq[MAX+1] =3D {0}, num_gts;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int specified_gt =3D -1;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D __drm_open_driver(DRI=
VER_INTEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devid =3D intel_get_drm_devi=
d(fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device =3D igt_device_get_ca=
rd_index(fd);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; num_gts =3D igt_sysfs_get_num_gt(fd);<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; write =3D parse(argc, argv, targets, ARRAY_S=
IZE(targets), set_freq);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; fail =3D write;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; write =3D parse(argc, argv, fd, targets, ARR=
AY_SIZE(targets), set_freq,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;list_gts, &amp;specified_gt);<=
br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* If we've previously locked the frequency,=
 we need to make sure to set things<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * in the correct order, or else the op=
eration will fail (ie. min =3D max =3D 200,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and we set min to 300, we fail becau=
se it would try to set min &gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * max). This can be accomplished be go=
ing either forward or reverse<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * through the loop. MIN is always befo=
re MAX.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * XXX: Since only min and max are at p=
lay, the super lazy way is to do this<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 3 times and if we still fail after 3=
, it's for real.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -again:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (try &gt; 2) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Did not achieve desired freq.\n&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; exit(EXIT_FAILURE);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(targets); i+=
+) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (targets[i] =3D=3D false)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Handle --list-gts option */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (list_gts)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; list_available_gts(fd, num_gts);<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (write) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_frequency(&amp;info=
[i], set_freq[i]);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (get_frequency(&amp;=
info[i]) !=3D set_freq[i])<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fail =3D true;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fail =3D false;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%s: %d MHz=
\n&quot;, info[i].name, get_frequency(&amp;info[i]));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Validate specified GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; validate_specified_gt(fd, specified_gt, num_=
gts);<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (fail) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; try++;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto again;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Process frequencies for specified GT or a=
ll GTs */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; execute_frequency_operations(fd, specified_g=
t, write, targets, set_freq);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_S=
IZE(targets); i++) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (info[i].filp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (info[i].filp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose(=
info[i].filp);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(info[i].path);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return EXIT_SUCCESS;<br>
&gt;&nbsp; }<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB542795443B093F0CEC4A07A098D7ACH0PR11MB5427namp_--

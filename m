Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA5DCA6C92
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 08:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ABD10E4DB;
	Tue, 27 Jan 2026 08:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOkbJGzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6AF10E4DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769502169; x=1801038169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xg7KYN3sDPRfYqzGavVOFL6ZEKLYsKYM/3o/8vhiGhM=;
 b=hOkbJGzzn9dj2IoXyBIvFbGCPayB+nznK4iIOJ1WqHWoqDkAzxmwQcl2
 rp7pEj13eVByQrslGQrXLERBLV3rh4QBXqNZwY9YZJlcAI7e0kGzeJHCH
 /WsUz+/G8AxbdbNf1KyTlI5bOxc6f4GLZ+8m66vdStIOx7bj7iqJsagUQ
 uvgK1leSDtRWnwufwAo/YgvPEMI9n5u0Lf4kZf+u1eG5+vjYXC6Ir1vav
 1T7z8MK0+cKLFx1uR/huE+vllxt523TEWjf4AouxJNh868kQIT9z4akl7
 +j5WXmu0E1hTGUrguDaazzNpDmBrR9aSUo4wVEp34Ib9Fgpnw7+osRNNQ w==;
X-CSE-ConnectionGUID: datpFj+zQ/KYmZqlZplKCw==
X-CSE-MsgGUID: 8Iz5GVtvQxGI6UAYjA5olA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82058713"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="82058713"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:22:48 -0800
X-CSE-ConnectionGUID: sz4aJI4iTYKDNEWEP9YJzA==
X-CSE-MsgGUID: +GUjojj4QpqgzjUKJTgGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207969750"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:22:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:22:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 00:22:46 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:22:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnGl2vOgvwGhcNAzSVpiIXbOeceJ3E5jtHtYHowka0W6qSDHtJIfO6To9pY37wJPZyaFoQIkhV72GtNy70Hvlts6tMcSR9YinQO75b6sK5Pf+fdXhahG2T6XAMZppeOwTzJ2cNNbd9avtFHBUU6fPMsKrvoPcKeWiJGn2FsgUbX9DA9JmbtpBEuoTy6pem8ckEDT2FIm/pBKHx/eD9htd+5N/JKYe22RWLfiW3meOM33c0BZlrVqmjvREm0Olwlp40EFTvS3tlDRDf29lG4vp3DWj6jmNIE0DN6k4DrIuEFBKy7ibHrGvoOeWh/o8gHEcQP1Ol56bLVhbG8pDxSxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USID2L8L+jy4EIXqU8NzR8P0YhlSUtKOedBePU3qZ0I=;
 b=d/ju9B+yAhh6jKWNDz8rGPOL/FF8jWtxMv2FU4xIxgMnQjJpFxKWLCuaGPGPcJKpmPbJfGkgNL5Mm75LUkVqZXOXYE4mdFKovX3iURjCDqeJ6W9EF7dTMDUqq6a8Jxr+u49IBUsR2hrx09cDQJR6xyOgLx2G57B4XSnflkL0UWbT1zK2RN+lko6YcXGh3vpRTO2fKFhAW4JLknGszw6MiVcwVScAirFmKCddFiYT/+oC3PcMw6hc/6P39iZzCSHArv/aDWZ91FXk6qmfV/6sqW1b3LRK6epje5G3H6XVDIUTyup7xXfcskaKmowQ/sVOSgLS79OeAxuxRyRN5N6QwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6196.namprd11.prod.outlook.com
 (2603:10b6:208:3e8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:22:43 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:22:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcj0MoSBvGPftozUarcvwWXZXNAbVlrZOQ
Date: Tue, 27 Jan 2026 08:22:43 +0000
Message-ID: <DM3PPF208195D8D25825E2855CFA8184D8EE390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-7-sowmiya.s@intel.com>
In-Reply-To: <20260127043233.254107-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6196:EE_
x-ms-office365-filtering-correlation-id: 5d76db04-9758-4bc0-33f7-08de5d7d3ec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?B/VMfcTUQUhsReEL6V+wM8RIaBw6otlzOLoaxjEZ5nxyW4zpEEVXoyOtLg9T?=
 =?us-ascii?Q?GqhOvQf9m8tZbv1D4suCP/4p/RwFlxWUoRwny0pxotEN+AEJ7yEXC4qAWG92?=
 =?us-ascii?Q?k/Hew5pSWf8iuq63UaTqRItBn8FClVRuXkxLf2Msjkzu1XQXMpBvTEsW1AiH?=
 =?us-ascii?Q?tTt8J1pga6uuMQ/9WNgJrZS7IqYVCKAAs5dgfvfu9HVJhkghspQBDjpBwc98?=
 =?us-ascii?Q?YjGM0LEH0GCutVvJH/2bPxXxOAJ5FdKA5eVa7kOnL/ZLHjUnrSzTo7xzRh3t?=
 =?us-ascii?Q?ZMre7IFNhYrgDuYaLmf11GYDm5bt+oeA9Dzb/uomWmGWxiJ9sCRqHAS2lwag?=
 =?us-ascii?Q?201AOM3n9UuWYAiN1tZf4RalpPb84s44bLNcNUUEmX9BadFzxyuIetSWU0kF?=
 =?us-ascii?Q?Nqyd257vqhnBDEX5m+mAXeWLp52boOxfH2DYg4Oj7D/ign+aB/E21iPvLso9?=
 =?us-ascii?Q?g8BMlweNeKFx0v0+OHQpMVJcBdCcSXBxMDfT9g2kQPmZ88OYXLxfqpRJ6Ppz?=
 =?us-ascii?Q?rj2dnMLZYkWVrR59wEzQ79AIBahP15zqHOTowYGb41D8SOZ+o57B/NrYGrKD?=
 =?us-ascii?Q?a+mAhllzJSUHpVXwFt94hvHvpagQHzJpXd3ITnDui4OsQb+l/Ywyzfil24jX?=
 =?us-ascii?Q?wJok5Bk0dd8FwjhY1emduVxMz3nDybQPkOWmjzNmOX80mavDhuXm1UEHMiqJ?=
 =?us-ascii?Q?VtoqdB9/bT40hk1XgKelC1OLek8ybY82Ogrn3Xep/NZvgtpWCS+cZSDfq76a?=
 =?us-ascii?Q?37qRvbQlBRuLQh9Iajg8SpjYp9ASIgycMkwI2LDti6voT8w0WsEtRTQ26IlA?=
 =?us-ascii?Q?0N2jFcKCefCW8XQEJn++t+lReaKxh7KpkZCU8D/bnJPLFUlEZ87Nu18PPw+J?=
 =?us-ascii?Q?iLUkyQWM2qDocAVIirNpn69W1jI3wd9DJhF9PrO0CnMixsr7bhQYytFMMljP?=
 =?us-ascii?Q?9xzuE4iwBzl9wFLkKPyST0cItKpDTpm+Xr0wNlpLh2Bnj6Zacl8KVts6CT+J?=
 =?us-ascii?Q?6n/IFd8GqgdUe3qpOvjl/oaR1lfAyHla9KBTBdXp8t1hsHY06/0pPnc4sLZH?=
 =?us-ascii?Q?sBZGg6UTVQ+v0g1BUVGqCdLO5t3kKjml83NCgjr1MOUVIxGW/BJK4oIMJrH2?=
 =?us-ascii?Q?u+1bbGQAacy0SPDfBvQaRh8FRqaWKko1BxWhRuz2VU03KBXt5yhpU59G9HFu?=
 =?us-ascii?Q?qjyLwBS2M3U3q1WCUjHesiaA06N2Wk2e+aRYqoYClLAq2igVRr3cHCpVSgeg?=
 =?us-ascii?Q?TmGnwNRPPPUHYqz+35cnD57HCb4zlvdRUwTsKgqpMcEz6xoEr89aj7lt49SV?=
 =?us-ascii?Q?4ri0Xp0bQ/aameO6lhPOLZfWG0c8QqmFo2spPt/ZC6GCQWMXX2sZaL+IqWlt?=
 =?us-ascii?Q?ITgtqmgpNl5y5QHD4yjqt5DypMP+u+9KyiDwp7ZH/ftS56/bpLJka7EMUR1P?=
 =?us-ascii?Q?S62Ht0CLYXOQcbWrb+gCm27gpQt23nsizXziU/iorwTwW+V6hxRqMQ2ZG3Kj?=
 =?us-ascii?Q?0wqrvHMkRomgwpATX+tPbNbLXLnYxVNco5OJI5ZT8t9MFK0k9n1hCGVicTo1?=
 =?us-ascii?Q?pnQGNdJ5q0lZdkQsiVNa4miii/RdjCqeGYaousCDPbz3XAb2cgUPzEuWqYP4?=
 =?us-ascii?Q?yYx+od0VeOibaRVqt5jiKgM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KoCMvDigmfEEFO0/5nsvd4xDpcI6eIYeDYF+dca0WzaJOsu1zTT+axObMDJf?=
 =?us-ascii?Q?gCOZeDp3BueT0kecAboMSV7rytTRKspvZpmPUSVSh2FXqKpaWyj2edSst+ch?=
 =?us-ascii?Q?K45Qfo6UdSEMnCyyCYKOg3LJI6yBX9xqu5qD17N5UW9H2RL4kPnRtciIrYjR?=
 =?us-ascii?Q?3c6Cps/TEOfA8gIENuKh+xWD8HwXmRCUK4aGrlxom5IbvEHMhu9D2b/WEgAF?=
 =?us-ascii?Q?0YYq3CgvBS4344XEayQR/PuVfcLr9ASkTNt9mmryuG5/sCCx6zQUsmtUHwBi?=
 =?us-ascii?Q?3LE32YcYq9nx1xj9D9XYeNYHooWRNeV7Y0BsWPNhbAq0Dy9svAhqCzUaVmLf?=
 =?us-ascii?Q?kHN+ZacVJ1d3A+TaeAdxyuxmQ7gU5MO01eTQqAl7Wgg9Q23IruO2j+8hMRYg?=
 =?us-ascii?Q?6LPsGu5iNuhYN7WEgZBgh0Ljn0XRk/aq53vCccImyQto6LIo+8U8/SSLn/sI?=
 =?us-ascii?Q?wyrIEKqXWaKDpQ8Xv6jp1RudSN1Od8UjwCPjOUPM5WPSF6PBJCIgTjFGL3GM?=
 =?us-ascii?Q?gAqpZr9ALvgu2cfC4dnZJ0U7Q41GQ1QRPiCwO+j1c1ExJm/2WdFxClwxs7s5?=
 =?us-ascii?Q?FDgnWYdllTpA/k09f6sjsQYdKaW/C7ntlCf1tQ0xJQ7BnET+JagQH0JzCwee?=
 =?us-ascii?Q?UXsr9mBFn8Iw06iL3C9G3xvmDyys3RtgAvOryOXQSfEILa78Oxb9RlR18tcK?=
 =?us-ascii?Q?1QpxhfGxDDoQPaYPgAnktFH83qBo62hCQEnEInIdfZY7wmU7KHVtGCm7gfoM?=
 =?us-ascii?Q?Pcc8F7hjh2FEO6rOiswa8Ktji6p1mF12N89bjzmnWZSeiM71q67mxn7c+gCm?=
 =?us-ascii?Q?bjAc16sxoc48viBOjI1aPP9DGRH4jA/UmWc2z0t5YzTOJHptqcbI/2m06Xe0?=
 =?us-ascii?Q?+nghXtj+TngysSiOP9sn/AYacu+5oGDI+d7jBCCFHqj/d2PzD846d5PyQ0tT?=
 =?us-ascii?Q?27H6l2mGDPg/rXrYjdH4mYJ6lN7757VcIKzHGsRYFDCjw63KyiHtF8GufqxA?=
 =?us-ascii?Q?2ZHNHuobGlCOx2Kd5XoPYXHdj03wEZSyMlOg+xwBQuiwrVrhWEQL/LQe3rgv?=
 =?us-ascii?Q?r6x0JB7D0OGYeBd/pVy26P6UDAvr5IBgH/1EpGZxaZIMrcTVNITXRVsxTKiN?=
 =?us-ascii?Q?1FQTde1lVN5QoAnuk/hsY2MYFOIH3F13OD8Pzsr2QXoMebgllUHYoI+72xAo?=
 =?us-ascii?Q?SZImCBxn/wjYjl9RKFSPe1QQFgi7FLFcR+qBJ0FqRFQ7IXSSQxR9KZrA/LtR?=
 =?us-ascii?Q?qknMLGEJrTuxpG9Q69lFD9i6uj6I3fluJE0UoVIn6bqsbjFNcA1jegWiHjXG?=
 =?us-ascii?Q?HXU5lalddTGAinr3vrReikSreHYTwOcAHKJprjRpcgaRAWfosKlCSdjyYJEg?=
 =?us-ascii?Q?rSjlJTQLq65l/KVauijSZcJyZekPR+8ggq/lEmB4R4T/kbFn45gHUDdZM7OE?=
 =?us-ascii?Q?W0YgiN/hn5BoGTuLZA9/VB6N4wrtwnSqUWg9NW4OPdP00Yt9DmuzkjuyImDa?=
 =?us-ascii?Q?wNC1siu12w4FEPa4YlVlWB03bhFm6hJkpD/ajIhpLZRaVBD4qgrXFJKmiYCp?=
 =?us-ascii?Q?4VrN5q1m59dxUGkh4W43LeiwMslsOBsuXDyD7++6Tdk/OuI2RxYZUP36/eMQ?=
 =?us-ascii?Q?JXxOJ+KVjnhbu8+ljGcrh+yZJ0bOmynnPXTgL25A9mpawNalZcm397zhEtTa?=
 =?us-ascii?Q?kmBXAzQuN+UncHAneuTAKxiK9FvkTIkIiIxQp+VAh8k0AS+mi4F3EqnXic+k?=
 =?us-ascii?Q?qmBK27ORvA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d76db04-9758-4bc0-33f7-08de5d7d3ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 08:22:43.7862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cL4Oi4O/f0cPzTjK7OKh3SfwCo6tEZxDY7gau247G4Ks4SJ9HjCyuG5JZ4kknIwPQgalvf7yFWHR7he7hlWCqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
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

> Subject: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor writeback-fb-=
id
> subtest
>=20
> Remove individual tests for each format for the test writeback-fb-id and
> introduce dynamic subtest generation based on the formats supported.
> Framebuffer creation was now part of the subtest level based on format.
>=20
> v4: squashed the FB creation function with this commit (Suraj)
> v5: -Update dynamic subtest documentation (Suraj)
>     -Rename input_fb to in_fb
>     -Set plane to in_fb and remove unused input_fb as an arg to
>      writeback-fb-id function.
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
> v7: -Join nested if conditions (Suraj)
>=20

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 56 ++++++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 63917bf4f..58118b8da 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options, help_st=
r,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
> +			int bpc =3D igt_drm_format_get_bpc(test_format);
>=20
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> and invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +			if (is_intel_device(display.drm_fd) &&
> +			    (!strstr(igt_format_str(test_format), "BGR")))
> +				continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
> +
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				writeback_fb_id(output, &input_fb,
> &output_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0


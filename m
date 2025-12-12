Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CB4D43371
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 07:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395D610E075;
	Fri, 12 Dec 2025 07:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2bt5vHq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C8410E075
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765524950; x=1797060950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jo91xKjAKATgUpybgeUMOPQMlBT7hxPrbAJ19fqU/Lc=;
 b=W2bt5vHq/rIx4Rnf5Zzz1lOg+hQK07bYXv+/a6i4yj5VK7bKv+JORpcW
 rqVqxDtN84NfuROoDRly2kmHuUjO+Kg2TvkevP7K/w5JyQtblAJXl4l/M
 2MsIBIspcAHmHLENumzGwraOBNhkKLg3Hyqbh73C5Qt/MxOTcisivlDvR
 o5wwaRw6aDF400qhe4V0DFV+nKyb/k+lf0yk5iLm5RtHZXf/HIWBCpNzJ
 /pojdLiDyqgksCAPtH2Nl5GbSkZm04SgfP7qs2XvleMplZtPPWf8NINJF
 kAKql+KoVPadC20B8XiXgPyl6JSk+b1tpvrNu6ieNNLasra6Vn+SdaFSd w==;
X-CSE-ConnectionGUID: VCmiLsg/TJisp1eS+iTupw==
X-CSE-MsgGUID: jBjrsStRRciKioxp48BUYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71357908"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="71357908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:35:50 -0800
X-CSE-ConnectionGUID: uvARs0+ESOmgvErVqTmUWw==
X-CSE-MsgGUID: vZ71fnf0Rz6SY+yNIJ3cOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196615901"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:35:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 23:35:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 23:35:49 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 23:35:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHYjovh3BfuUoOdjs9ZOA0BW+0MIFqsW3F3HET+pQceJ98KcHkb2I08MLJqdKR5JiyffJpn6yyVY2QNdZJsz/cgzj9wzpXDirGpx4Yd2JN7ggGorHi/9nNefl8Rrulh96foLMsLcJU2mtoJmHqPg6VaMeMmVUlDMr22MiLHVttZ0Rdo6Mk2oZwzXy4OAfxucoJ3jzbW0KuO5gOtIX6DYs/SJS014eGpA/AdoI5ZSejpDbUaIZrWlpV1joRNorPDJm/EzcE09CoV+GwZo9aIXCOPSa6CZzwxS9wjarQ8aO1Zp35cNGJiie4WW130Z5PY1NWWwqBSaGeDoz7wzzncyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUJ2QL6gsLVoCeB3Y6hoKaTzn0BEHgCJ+/3Mq8VXfJE=;
 b=nnNJUnbMpOnIJ0VAj3fifYZOtc8srceD4yKngMRQFhwKknL0h/Yd0jWl44FiLxMkaKGBv72W9dwzwrnKmH7k6q3SYFiso7YEresWFRrPJ4EehhEThbPnyR7zwKcCkirtgwdwjkL1rYt8DEaP366m09ziNvUzrUU5DFdDiVGdcekRPbuVCPFK80VGSzT2R5m7XGqewfFEzm2CmILSlm0gS3QqGXM5zoBazUQWSSeWFmRq6ihpqDaAOkO8lXZD096oj0Eh35WykdSaUpSsJrGlc6PnH+1wFRnifT4vYhzTN2ed53RCU5TlJ0peb5Hj4greWk+X7EJlpdUugosejFGCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 07:35:34 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 07:35:34 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>, "Maslak, Jan" <jan.maslak@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 3/3] lib/xe/xe_eudebug: Avoid matching if event is
 filtered
Thread-Topic: [PATCH i-g-t 3/3] lib/xe/xe_eudebug: Avoid matching if event is
 filtered
Thread-Index: AQHcarzm0tIFPY9oLUyWUVVk5BOaQrUdnkjg
Date: Fri, 12 Dec 2025 07:35:34 +0000
Message-ID: <DS0PR11MB72645FDD4504392D4E156C65D9AEA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
 <20251211164020.1065880-3-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251211164020.1065880-3-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SA2PR11MB5132:EE_
x-ms-office365-filtering-correlation-id: 63664a74-a194-4c79-6fe5-08de39510953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?N8zRfOCFkP9SDFpWMYvkdNEtLEZB24z00QmqE38/L/G28IO0Ec0zyPePSF?=
 =?iso-8859-2?Q?AgyYteSE1ipgGfYJ9OgQPUdST2yeqV2Rqw2TooKI1iGPQ0sKRhN+PhpAkD?=
 =?iso-8859-2?Q?9oOyKqodwOGSskgFXPy2GrBcnLLLW3S+Bdy1xI6Fz2+5vXup+1ZZCulPIq?=
 =?iso-8859-2?Q?8Cx4ITiK/9ircHOtzzTnQWDDBlYqdvBGn1TX/jZz0T2HvRTC9BuRCl5WQi?=
 =?iso-8859-2?Q?SerfmJwPfq84UjQtTza+/tEkLr7dy9QxbMlrwgeko6AQBk5T5CQJbxNN/X?=
 =?iso-8859-2?Q?5tjDhX3IUs8kCwAiIu8O8EoOM6XnRmA/MRZvS8kpOoYrRqOf9DS49jCC3h?=
 =?iso-8859-2?Q?vmz0P4P9bgmfu0q8KqLKTIy1OHmbsJ6F9ZNiIPa41S9lmgudL7nZkhWQ+6?=
 =?iso-8859-2?Q?1j/i8wNQdk+8p65rX7l9x5HGWSuul7Hi5gt/nJrv42SeHH0XkDpatsDn6q?=
 =?iso-8859-2?Q?5Tea4RnlfAd9l4W5TeV26VG2AuBlx8bf3YdyQnnClGTAwDxYOXWtjf8Co8?=
 =?iso-8859-2?Q?2TgCfJy/Oa5gLqvSvwD9E0WNokanAEViNPPwCfNQjJb5qdyArrxgti0NzL?=
 =?iso-8859-2?Q?S5C+eaXvhjGsYl9PlZWiAs8sTY2T3oHc4YE1Qz3BgFF6PUyeSAWPUWIRB4?=
 =?iso-8859-2?Q?oIrZe0JIjyojnxNJZeV3U8jSIhHVTrybbvA3RwR03B0M2uU6WRaKzQLTZ1?=
 =?iso-8859-2?Q?Epd6qPWfVSaoBP8tSRpbniF++5EtBvcbPGBtzHNBbaCM6iuUpaSyPZJhK5?=
 =?iso-8859-2?Q?S0CejoUy3FaUfxGPXUye25VndtzLB4Q7yV3sqKPPaNONuLOSeponJs5lmU?=
 =?iso-8859-2?Q?YbU//YC7CQh0Z+2t4tDUNPahxDHCDyb/H6ChaklPUaqpWv90TGW6MKQQo9?=
 =?iso-8859-2?Q?KwFBZaRC5j6QveI2b5gzO1dxpV8+qUR2iw9sLSOXHzSvckgl6q32exwSXh?=
 =?iso-8859-2?Q?Ea5VxsnrdtzUZQQcFbgNvQK8xgf9IwXAtfS7aY5vujwlzDHEe2O5izZKaP?=
 =?iso-8859-2?Q?LHFhrtY9IXe9Z1Hhx0jhdIFQh1CNRjhP9OVwqDQX6UMuCGaoxT17e2rqTq?=
 =?iso-8859-2?Q?IJEJW0oJdoQ/6i4PBwwyt0eyP8uoOR0Y7N2Sl9AvuEfXs2M+jvCDfKY25E?=
 =?iso-8859-2?Q?wZh05NHmVpTY009UNwo4DT2dAW80myE7YD991LN+KTzNaV5Wh7BTpEhxJ8?=
 =?iso-8859-2?Q?sYx4Xs78gH5IoTFL1aaR888kJ0HKVqxXStHiBwPSiwAl9JwChvFyKLLQGC?=
 =?iso-8859-2?Q?K3YfcZWojnf0VWmqDCkO2RVcXrN2khaE/VUAcSIW222oiwNFzkDWwcEOP8?=
 =?iso-8859-2?Q?10pEFL7XsDyMZUs+G8GVPFKXcdL2oj2dYCSVABz+ynPaO5gZXOIZXZhNmv?=
 =?iso-8859-2?Q?XoEqXTxJAzkeDIj9ooLwyOcWaFUJhY0LIN12DiIHjnbUQSuTpLJcBhCl6W?=
 =?iso-8859-2?Q?e0oqIpUeQfPF/rE85365c/qu551iR+3BxA/lJLj/0EaCNqzYrWG7MVNMtt?=
 =?iso-8859-2?Q?SuKYx+nJ3xXwmWy+8b1srTMu0Xlb1dflmKl0FX9NElsOq5W/wiDGYkYPth?=
 =?iso-8859-2?Q?eQy7K7/9aEPhUCeYLQsk364p8tv4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?GUQ52Upf9wnC5mhjIlHz92safIlPwNULLDJ0OaLx8KV7Haxt6Nbb6Gjpqp?=
 =?iso-8859-2?Q?XyYvwRItAtUAbrQEM0Rs7ZFRHlURtwN6MCMxk3RstBrJQB5kbW4s+xpppW?=
 =?iso-8859-2?Q?LtxoFww5yqinRVcldibjBewmIjhmcdolevpW5gLdJhTvLJtO8HJcclt8Oo?=
 =?iso-8859-2?Q?qQdKewKAlSxJKc09oV6xJILTJAn9fp6m5d0xwFXvyArfBtIqoRaMxRh/wN?=
 =?iso-8859-2?Q?7wF5EbpbcT57CWLMzEnpyphcEH8TqQzCwhm805K5IhbbfvINvbzmVRvLEm?=
 =?iso-8859-2?Q?yVDkxJJZQibM5up7eZc5F66dsrEHBCmFyDDbBEoxPacG5eNiFIi80bUuG4?=
 =?iso-8859-2?Q?JolcDRkdASc6/PhWy920u/dgVu/v4fxztwLqwTJ6zUBZdLS7OOWfHFuwCQ?=
 =?iso-8859-2?Q?0jPZx0P56Yto8Xe+y3qkREUTRcfdY9SFKmqsjbXrhZnjQmHXaB2BQWtOXX?=
 =?iso-8859-2?Q?nxw5zZb7jjZTs+nmX/TiZuK+Sg7MSwc/v4eYCOQEoedSW7PX80Jzdrxdg/?=
 =?iso-8859-2?Q?C0YfUA5O2GA7WN1gSj/VOYNvJFhC/lBTB7PKnrecRYt1v8i5vafvIc9f9a?=
 =?iso-8859-2?Q?sGfeScXbo6Xp6KMMVPIohno0/hfZYdJ9BdTuEdlVexfAx4GUgKWI3uripW?=
 =?iso-8859-2?Q?VlPfoT/lsJeM5hl07v9jQBu0fXX3JtVFpP1XZyfhQ8vKJ6eWummnqybn8s?=
 =?iso-8859-2?Q?YR+oiHw6++JQpxSuzHGfkXQC3rrfdts3YQpxCS1PgLyZPJIkc5zT7OJ+w2?=
 =?iso-8859-2?Q?u9XBVkOjW4aA1UFwwg0kG4bPPZGjhgVvUSpOFLMcrjS5rFM5+no7X3ijdP?=
 =?iso-8859-2?Q?eCfX84JQdUBrL+AaCEzwWk2Lba55dyriFoH/BM7Ttlf6IHZ+2TAR/Q4jyA?=
 =?iso-8859-2?Q?km6XZLVfxu4gf5cjy4OCiTnc70lOJvXbzQvFwpJDYq7rEuYtGKmBCnPp+p?=
 =?iso-8859-2?Q?KrzTTaAw0OyfBM7WTHHxIL+IG8GfG3A2v9wbESU/tYufDVZHVNmr9l1stm?=
 =?iso-8859-2?Q?MG4jHllvnrdR7vCpdNGgmNj9cjD8SG3wN9louilGG5lOsOcNqu45cK1wn+?=
 =?iso-8859-2?Q?zvXqsuSPpH+eIOdWeuqBxgQrAdlhHv1xNrEPJqP4iBWEPao1Wj+KY60+5t?=
 =?iso-8859-2?Q?na9pZmTBrt0nt9vvXhh2iydVOUUUCpvsuGMwj5u3ge5WFNEpuOZkEIxgKU?=
 =?iso-8859-2?Q?wAwkaIe6wfAhLFGJvci0DNHQ4RZtCy4weYWrXdEMgORynIN3LFEocP+kaT?=
 =?iso-8859-2?Q?IF2Z/6FfIPQogLOTGBEQuykq1U5AwAI3DPDvLOwTYXFmoRAJ1532Hq+jzW?=
 =?iso-8859-2?Q?nhrTa5zjSCXejJUeasrGjPg1tEzJoyqx0YFgP1vVVKmfcEGRz4e1JqX9V3?=
 =?iso-8859-2?Q?lZ3j0tvDrbdBTm7XitnfI9QaDRJQCocdZAULi2Vz4/Z0FnnLPqAAQDQqtM?=
 =?iso-8859-2?Q?OsLjdrvRumu99RoMoHx7J4vohp5K9XFVZw5jt1CfMsvwctgWbU1OZ83GFD?=
 =?iso-8859-2?Q?Ir2qXS3DxROuQPWqYVYTN8St1JerMBFMgaRxe7NzD/pSjse9yWCLVT2Ym8?=
 =?iso-8859-2?Q?6rqICtal3HHEK13Ocnv/jhtKO76qwcWDFjTmFXIz0OWu3ciboYDLxo/3r/?=
 =?iso-8859-2?Q?/IiJ4Qlq7L5epUZaj/RtSY9GphjyxFW3Q/hyjhuhRRwuE5erUQ1QbeyA?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63664a74-a194-4c79-6fe5-08de39510953
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 07:35:34.4511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTVbW67Fl1crD/7CHM6wYVX+B0T2ulhEUVESrh3FfxhXVkBVEgqyDcTJWiHvxgRtQUc1QvhLGZR6Ra42XCNDB03rHI0o8yOR1ao9ldhfQsR5za1KAZ3urKmZcKCPeeDh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
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

LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Sent: Thursday, December 11, 2025 5:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Manszewski, Christoph <christoph.manszewski@intel.com>; Piatkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Maslak, Jan <jan.maslak@intel.com>;
> Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Mika Kuoppala
> <mika.kuoppala@linux.intel.com>
> Subject: [PATCH i-g-t 3/3] lib/xe/xe_eudebug: Avoid matching if event is
> filtered
>=20
> Bail out early if event is filtered instead of hitting
> assert of not finding it.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  lib/xe/xe_eudebug.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 7c2c9505d..31e4f9c48 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1027,9 +1027,17 @@ void xe_eudebug_event_log_compare(struct
> xe_eudebug_event_log *log1,
>  	}
>=20
>  	xe_eudebug_for_each_event(ev1, log1) {
> +		if (XE_EUDEBUG_EVENT_IS_FILTERED(ev1->type, filter))
> +			continue;
> +
>  		if (ev1->type =3D=3D DRM_XE_EUDEBUG_EVENT_OPEN &&
>  		    ev1->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
>  			ev2 =3D event_type_match(log2, ev1, ev2);
> +			if (!ev2)
> +				igt_debug("match failed to find type %d,
> seqno %llu\n",
> +					  ev1->type, ev1->seqno);
> +
> +			igt_assert(ev2);
>=20
>  			compare_client(log1, ev1, log2, ev2, filter);
>  			compare_client(log2, ev2, log1, ev1, filter);
> --
> 2.43.0


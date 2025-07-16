Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B600C83F27
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 12:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522F810E393;
	Wed, 16 Jul 2025 12:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amw1ixvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BFF10E393
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 12:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752668477; x=1784204477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k7jz9KLqDDdbmoVHINAm7d1sz03GFXUSsW+Qi2eQq4A=;
 b=amw1ixvp9VAFb+2B96+fRZr3YiVUc67rbqjt7yWPLNg620tDcvX09TBv
 CKJS/FptgauqMgwGrT7gW585WjpCdNIWz0PdhdCltP0bdhClgpkFDyiDA
 uCADfBPKN5MYPRSldQRwg3Oy9/slNF7+pGFE4RgAf4mJXRhqLCk1xnEps
 q56xJD3IH1j2NmF3FQneIy1ufBKqWXgIZdl/ft3X8imj7Y8gr9lmKtUbH
 nJjyYuaRXfOvcOo+CeLb/ZJ6XqgfdO7BmtKCtdOXYJL1ZCulDU1VE7wNt
 QJafW7HGsBrCKkJ/67COoLysWe2KOtytqQ5Mp4bvgjsOCiAK+bSXjVxKl Q==;
X-CSE-ConnectionGUID: uSq6r7AcTf+fqlCxDcbIrQ==
X-CSE-MsgGUID: /fdGKASgSA6SGGsvv3e1/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72483386"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="72483386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 05:21:17 -0700
X-CSE-ConnectionGUID: 3xNOXm2+SoaYvtyYVHj+Dg==
X-CSE-MsgGUID: XmOqg6ElSFWSZkenmV3cHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="163032816"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 05:21:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 05:21:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 05:21:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 05:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXoayrI9dqfe7HXDWZLYNH+9COg9ETBEgacEw5CsGu50J8mUGgGAKEdkx7wS4CkRwFWIz7AYVVFtLJzx76tj3x8Mi/jN1GHo/LJD7tFpYuNzMIhou+SMQUyhK4fuO2VlptPUO4QkS6tj+HVtsFmcHH/oUC6qXw1VXNUuHCl0pD4CHcQKeG9ImJspPJhHHU5qHSpaLQ+C8uNT6lQpKBdQ2FWMf0qJjNHtFmfM3OGMI29/X7OIoSRbwrTPHpYrss/cqprs8s3nzDwXXalglv9d5pWIYmfWi0zr7LofiirI7MqvmcPMihH3E7BscYid4rYbdNwwQwZMDLhqKCnPdZ1/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7jz9KLqDDdbmoVHINAm7d1sz03GFXUSsW+Qi2eQq4A=;
 b=gHlsHIBVhE4peOTEuzii22hNMJe630PYNYl2SAr0E17S2anKcQqK/4hI4TRXPsROPtLYu+qAtxd0kOnEimdj8Toy7kpJ9ieL4Cj2C958hnJVr8yJQcS9GPdAwoVkgZk2A1ywWji8H3jBQYQzJpmIc+791MnioRyyWs0Z3OhMmXjztLite2wmOuHNMmvzjqKEPK0hbs1hLg2XLbFyXysqQyTzyuQa6Gkr3b8vYYBbIWn4oE6hqt02FlofRd7YaoV/YtmvJvF0SmmmNZQbprppqBetPntetn6j7kYRDYzNH3yI9m/ETDTtbxLO0jz0rMs+5SPOjeopFLGQO/6pi9XH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 12:20:30 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 12:20:30 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] scripts/igt_doc: fix a deprecation warning
Thread-Topic: [PATCH] scripts/igt_doc: fix a deprecation warning
Thread-Index: AQHb9aT/vVh7uO94/UaMrIM2Vt6p/bQ0o+OAgAAHmUA=
Date: Wed, 16 Jul 2025 12:20:30 +0000
Message-ID: <IA1PR11MB6418EC31B0DCF739EA0CFE9FC156A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250715162436.130710-1-michael.j.ruhl@intel.com>
 <20250716114847.duqdf32rsxdepbea@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250716114847.duqdf32rsxdepbea@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB4893:EE_
x-ms-office365-filtering-correlation-id: 35dd525d-eed7-4969-e873-08ddc46327da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SWJuMjBCWDlvVmErRzFwM1E1ai8zYWgwQTZqb1AxdjJ1SUZieVJLdXQrWDl5?=
 =?utf-8?B?MWl5bkJnTmU5ZU1qejZGd0lyOVFsd2k1a3hUV0JLV29PdG84M0Q2U01pMG5F?=
 =?utf-8?B?WHBMWXZSKzdhQ3BVa1M0TkxtRGFXSlFXTlNESDV5MHY4REI3RFFsdy9FazBz?=
 =?utf-8?B?NTZCdEF0emQyVWVoUnFKTGZLY1ZYVng4c1JKVzJycXYrQ3FNcFBvc3Z4dlN6?=
 =?utf-8?B?N216VmRCZUordmlPTENyTnRxcW5wcWJwb1E0ZjRDZ20rdkFEdmpMWTlPa29V?=
 =?utf-8?B?NmlDR1lVbm85QnlsWFFMQXRtcVFSL0ZQUUx4T2RwVmtHUTRNcm16b2tYTEhZ?=
 =?utf-8?B?d2QyZmlHWWhvMlNGeVNPU2FkSkFrZzczenloOVRhSTZHY2tmQTI1VXI4cTUw?=
 =?utf-8?B?NTFwaGpGSzBQVm5YQU9YQThqRVZoNmFNeWZldmZqZjZsWk0yeDNCRVhXdkx4?=
 =?utf-8?B?OSsvM1d5WXlSNEY1aVA1L2pjeXBJU0pxaWlxNWVObGVGYlZ6aDJEamd3L01m?=
 =?utf-8?B?NlV0RXZQcEJ2QlduSE1hRkZEaENFMGt1dEM5blh4TkhLMy9QeEdIYjgzNjdj?=
 =?utf-8?B?ek9mQms3blR5aDFQVjJ3VGYwUU80Qm1YY0VlR0RjaFZ2cFpSRERKQXQ1M2Q1?=
 =?utf-8?B?QTJadFFoVktZU0dDWU5rRG5XUjkzOTVBYVA5VUFmejF0UXhyOU5LSkMvYklt?=
 =?utf-8?B?dGdGNzNQaDU3ZVhxVGg3RWRLU0swY3h4WTZwOXRoZEc2OFp3K2xKcWdKTEx1?=
 =?utf-8?B?dTZLRnlhYTdYaTRvYy95UjRHdGJzZUVzVUk3MnUzVDAxNlI5V2lCbmR4dGlE?=
 =?utf-8?B?RWRZUnhOQ28xTHE2N0JqTDg0NDNoczZ0azVkYXhCWWVWRkVzYys0Y3FTa2Zq?=
 =?utf-8?B?SXNXRnZFY3R2RFYwWkhBSW84T1h2emxhbm5yVjVWUThUcnRPaGNDMmh1VEJs?=
 =?utf-8?B?V1lQV0htVkQ3LzhJOFlSMkljVkR4cUhkQ3ZlTnZGb1A1cHhpZm95b0ZpMlRM?=
 =?utf-8?B?RzZXZFRaZEF5R2Nja1BLV0I4eXlwWGk2UkRMQ1M4N1JUd1hYSjNLZXg5ZUZI?=
 =?utf-8?B?TGpUOW5tTVUvQzRCUXBUMlM1YmxOU1lieXhNaElzaFBkNGhQemdKcy9hWWli?=
 =?utf-8?B?SnR1aHlWWlpmd3dkSUovaXdQVWU4enY1dHRNMzhXYXVYdDEreXNnUmlOOWU3?=
 =?utf-8?B?dmx6YldiRmdRNG1DN0FDaHdRdGhGVnRrQUs5U09SaUp6eGY1dk1xVzBlOUNk?=
 =?utf-8?B?MjRpSC8xcEtPaHZnV1BaWVJvaXpXSFVETW1ZZms0TkpVTWtlbW5oU1JvZmUy?=
 =?utf-8?B?SUc3cERMdGJwK2MzdGpVKzdidUs5Ulk4Wi9tUWtPdkE1T0FQZEpPQnlpYUZD?=
 =?utf-8?B?RE1JZzYzYkc0Z2IxRjhBU2hScmZSd2lwUE5hREV6OUJLR0I2bTNrSUdMWlU0?=
 =?utf-8?B?RU1pM0g2SmFhc0VXV2twTU5pc3ROREdEK0NmVHdNZ3d6c25NSkxWNGVvZlBS?=
 =?utf-8?B?dVBIQmlkYnVyNUl1UVE1T0MrOGY2RE9DN05JZ0Z3WEZ0UllGcGpEc2QyVTE3?=
 =?utf-8?B?SXgyRkt4T0tuSU9EWVNHd0t3d1pkS2pGNFIrQjlTSExidDkzZ1JUSHBUakNU?=
 =?utf-8?B?VVN4SFUrOGRmRGs5M3FBa1VvdzFHOVNIMW1oVk9QNGc0V1AwSWhkQU41WTA3?=
 =?utf-8?B?Tkp5cEl5TDZWVjMxdlgwUmRRU0lyYVBORWdXTkR4cmJRdHgrU2dURmpoY0g0?=
 =?utf-8?B?RGdXalpSVG9Ebzk3S2hqYXhjUW9vUWduMktBYkJjN1hFYlg4R2pjbk43azNI?=
 =?utf-8?B?L0xZd1N6QkE0SDhmK1hyL0Q1czlRMXdtcVBiOXNrdWUzQkk2dFlpNmI0VG5E?=
 =?utf-8?B?K0xFRjh6NnBYaEdieWZCREUySDV2bUpqLzhybnFzKzYwV2sxM21vd0Nlalkr?=
 =?utf-8?Q?zxC+UcmzNq0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUo2bjAxbFFhUmRyblhyNnhRZUZWTVoxWUx3UGRQbEVxSGFLaWRBL3FGVkhI?=
 =?utf-8?B?ejl4bExoQzFzZHFWRjZyTHkrWGpCN3poeHFUM3hLSnhkNXVhdTY2SHFWamIr?=
 =?utf-8?B?cEJuaWRMNERIL0Q4U0RtWFNQRGhWQithRUd2UWdRWHdaZW5vaVFTSGhPWkZ5?=
 =?utf-8?B?QlBhRzRUdkpqMm44RVZzSDIwZjREeGo2N0NiTVpaKzd5MDV4OHcxUnRGU2RW?=
 =?utf-8?B?V1pHVnY0UG9mNGFRWUdWQU41K0FxTnhtUDc1NjdWNWJYaTlTbUVhYTRNYStJ?=
 =?utf-8?B?TkZXRXZITkFpTm53bjFOZ2lDZFpZNnZTM2t6dEpDN3RRaS82dWFXY1RRMFR5?=
 =?utf-8?B?YlQxR1lFS2hhMlAwRVVFM3NHVWVydU45VWtGNk51N2pHemZjeTdsSWpvbndY?=
 =?utf-8?B?QkZYY1p4ZFh4REZKUVRCTTdLbG1uaE5SdDlBQ2c5dysray93Sk16T0lmQVFU?=
 =?utf-8?B?cUZJQkN3TnNzMloxcDU0ak1YaFdzNVhrSkk1RlRKRjJ2byszeUQ3MmpsbGdC?=
 =?utf-8?B?SDhDRGR1TDBaYlRCeXBDZXhlUy82QXF0WWtmcHFiUHFZTjErdzNlNWFTYWw0?=
 =?utf-8?B?SUthQnFlcnFZeEoxOE9tWkZrWlM2VjJGRmgvOWlWNEJGd2ZlOE9Td1FYK3Bo?=
 =?utf-8?B?clIxYkZ4aFJTVEFrMjNXSW10T1JtR3VtTXhHck5hRE03UUZnczFQaUFuOE94?=
 =?utf-8?B?dkh4NlkyZHZMWDRaRmU4UnRLTWVDMlZNdHFqaS9TMjZwV3drWXhwNDlaT0Y1?=
 =?utf-8?B?aFJuczVXWDFGR2lROEl1VURMUmdoZFZjOEMvdkxzQW44UWF6WUlHSUxtU2tj?=
 =?utf-8?B?NWRWb0FKUTg2SDUwMFVBKzlCTkRjMCtidTNEMnJkM2NjamppM1dUVXVRc0hM?=
 =?utf-8?B?RDBoY1pKRXpRR0wxYkxaMzBnSjNIcTM3L0FvSWdqeE03bitBeHZ0YVVja29Y?=
 =?utf-8?B?MEJmb0VNNHdMMm1zYnc4R1QyOFluc29nQkFqOTY2aklFR1VHdDcxL29yVjR4?=
 =?utf-8?B?M2pMTFh6NGMvR09SWGFia0VOKzJNM2RFcUdXMHNza0I5V3BXSWpiQlh3TlJt?=
 =?utf-8?B?V1BjUU5SRTBoeHczcS85Wm1ZTUREdStFdUZ5VE9hNEMwdEdDMjVsZ21IOVYw?=
 =?utf-8?B?RWhIZmZLaDJVVXZhbmZzL1ZrMFlJcmxmTWVuS094ZWpiSmZsSXo0RXhoUi80?=
 =?utf-8?B?R3hNNFZGQWF3QmN4em8wanprM01uemxOeDJDdy9FWUlOK2huT0d5U1RGZGdz?=
 =?utf-8?B?ZUpycnM4N3dmaUVCQi9JOHp4Y1V6K1pOR2pWb0l0c1U1UFFUTXVpcUpOOXRV?=
 =?utf-8?B?UG5mYVdkZUZLTHZNZUZkNGdNamprcGV1Z1ZCNWhKOERrRXRPU0lUelJsQk9x?=
 =?utf-8?B?NWIrQ05ZMjc5czM2U3Rqb1RiT1V4Q1pBNTVtcFBMb21qV0V0T3BTdkRjTDZk?=
 =?utf-8?B?L0g5QUFPQ05kRUNSeDhBOG9GM1RkMW1MbmtQaWVwZk42NHIzVGtLYzE3R3ZR?=
 =?utf-8?B?aHpTSlRySjZ0aCtkUHdXK25lMzl1eTREVkdJenBCT0xaTSt5RjIwc1h5L1Rm?=
 =?utf-8?B?WGFtN1BFTkhIVlJ1ek9pRUZxVzVyMXZiV05tL3pJZnk0ekFWSzJpclNiWUJx?=
 =?utf-8?B?WmZTYllOY0dMQllrdUwxc3huUkEraS9ienU5VFlpS0NBRlNSV0lxTkN6aTdF?=
 =?utf-8?B?OVhRenNORUZzLzBYYWVySUF3WjZFaHE0RmdoTEhyTk5ldWxHekx2MjlpWGtL?=
 =?utf-8?B?cG1oV21zNUkraGs0Mk9TdWtYWDFndGh2aUxPSGd2K2V0RjBQdXdPNExFcHF4?=
 =?utf-8?B?NEkzeG5wbDd2NEpkYXVQWjBHWmhkMklvSzRHcUF6NWEzbFcyQmtEZGp1eThP?=
 =?utf-8?B?QUhpWVpqUVFEZ3FyWG5HSWh1TTR6azR6WnArWkZxTTJzd2RJTExzeERWKzUr?=
 =?utf-8?B?MlRDNlBoRTJhUUpUV04xbXdlQmJhQU9sQmRLbWdTQjZaMloxbU5TQys2dHhC?=
 =?utf-8?B?RnNkOXVMeTY0ZkNnVFRGcE1tQVRPU2hWc2tOZFpwS25RTE5VVzBZZEc0eXcx?=
 =?utf-8?B?aTZYZEFERWp6Z3hEWitQWWt2dGtFc1o5NHY3amxpc29HOGRyMWd6NmtaWFpF?=
 =?utf-8?Q?8lr9sbwqpTG40SCyR6ZgObHd6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dd525d-eed7-4969-e873-08ddc46327da
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 12:20:30.5892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4V2uNW4vATv2dbOtH+QzDRqTpWoxIjHP4aaFa1gM4o+XcY0k91fEW9QScOZ2O/0zf071brDSgBUvQkUcZQoMWXCSkdJ8OE3xHibldk2P/vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPlNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNiwg
MjAyNSA3OjQ5IEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPg0KPkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGUgTWFyY2hpLCBMdWNh
cw0KPjxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0hdIHNjcmlwdHMvaWd0X2RvYzogZml4
IGEgZGVwcmVjYXRpb24gd2FybmluZw0KPg0KPkhpIE1pY2hhZWwsDQo+T24gMjAyNS0wNy0xNSBh
dCAxMjoyNDozNiAtMDQwMCwgTWljaGFlbCBKLiBSdWhsIHdyb3RlOg0KPj4gVGhlIHJlZ3VsYXIg
ZXhwcmVzc2lvbiB1c2FnZSBoYXMgY291bnQgYXMgdGhlIHRoaXJkIHBhcmFtZXRlciwNCj4+IHdo
aWNoIHJlc3VsdHMgaW4gdGhpcyBlcnJvciBtZXNzYWdlOg0KPj4NCj4+IERlcHJlY2F0aW9uV2Fy
bmluZzogJ2NvdW50JyBpcyBwYXNzZWQgYXMgcG9zaXRpb25hbCBhcmd1bWVudA0KPj4NCj4+IFNv
IHRoZSBjdXJyZW50IHVzYWdlIGluY29ycmVjdGx5IHVzZXMgdGhlIGZsYWcgdmFsdWUgYXMgYSBj
b3VudC4NCj4+DQo+PiBTcGVjaWZ5IHRoZSBwYXJhbWV0ZXIgbmFtZSB0byBnZXQgdGhlIGNvcnJl
Y3QgdXNhZ2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVs
LmoucnVobEBpbnRlbC5jb20+DQo+DQo+VGhhbmsgeW91LCBJIGFscmVhZHkgbWVyZ2VkIGl0IGJ1
dCBwbGVhc2Ugc2VlIG9uZSBuaXQgYmVsb3cuDQo+DQo+PiAtLS0NCj4+ICBzY3JpcHRzL2lndF9k
b2MucHkgfCAyICstDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvaWd0X2RvYy5weSBiL3NjcmlwdHMv
aWd0X2RvYy5weQ0KPj4gaW5kZXggZmEyYzJjN2NhLi4zYTM3YTk3MDEgMTAwNzU1DQo+PiAtLS0g
YS9zY3JpcHRzL2lndF9kb2MucHkNCj4+ICsrKyBiL3NjcmlwdHMvaWd0X2RvYy5weQ0KPj4gQEAg
LTM3LDcgKzM3LDcgQEAgY2xhc3MgSWd0VGVzdExpc3QoVGVzdExpc3QpOg0KPj4gICAgICAgICAg
ICAgICAgICBydW5fdHlwZSA9ICJvdGhlciINCj4+ICAgICAgICAgICAgICBlbHNlOg0KPj4gICAg
ICAgICAgICAgICAgICBmb3IgZHJpdmVyIGluIHNlbGYuZHJpdmVyczoNCj4+IC0gICAgICAgICAg
ICAgICAgICAgIHJlc3VsdCA9IHJlLnN1YihyIl4iICsgZHJpdmVyICsgciJbXFdfXSoiLCAiIiwg
cnVuX3R5cGUsDQo+cmUuSUdOT1JFQ0FTRSkNCj4+ICsgICAgICAgICAgICAgICAgICAgIHJlc3Vs
dCA9IHJlLnN1YihyIl4iICsgZHJpdmVyICsgciJbXFdfXSoiLCAiIiwgcnVuX3R5cGUsIGZsYWdz
ID0NCj5yZS5JR05PUkVDQVNFKQ0KPg0KPkFjY29yZGluZyB0byBQeXRob24gZG9jLCB0aGVyZSBz
aG91bGQgYmUgYWxzbyBjb3VudD0wOg0KPg0KPnJlc3VsdCA9IHJlLnN1YihyIl4iICsgZHJpdmVy
ICsgciJbXFdfXSoiLCAiIiwgcnVuX3R5cGUsIGNvdW50ID0gMCwgZmxhZ3MgPQ0KPnJlLklHTk9S
RUNBU0UpDQo+DQo+UGxlYXNlIHNlZTogaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy9saWJyYXJ5
L3JlLmh0bWwjcmUuc3ViDQoNCkhpIEthbWlsLA0KDQpNeSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0
IHRoYXQgaW5kaWNhdGVkIHRoYXQgdGhlIGRlZmF1bHQgdmFsdWUgb2YgY291bnQvZmxhZ3MgaWYg
dGhleQ0Kd2hlcmUgbm90IGV4cGxpY2l0bHkgc2V0Li4uLiAgTG9va2luZyBhdCB0aGUgZXhhbXBs
ZXMsIEkgc2VlIHRoZXkgYXJlIHNldHRpbmcgZmxhZ3MsIGJ1dCBub3QNCmNvdW50Lg0KDQpJIGNh
biBwcm92aWRlIGFuIHVwZGF0ZSB3aXRoIGNvdW50ID0gMCwgYnV0IGl0IGlzIG5vdCBjbGVhciB0
byBtZSB0aGF0IHRoYXQgaXMgcmVxdWlyZWQuDQoNClRob3VnaHRzPw0KDQpNaWtlDQoNCj5SZWdh
cmRzLA0KPkthbWlsDQo+DQo+PiAgICAgICAgICAgICAgICAgICAgICBpZiByZXN1bHQgIT0gcnVu
X3R5cGU6DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZHJpdmVyX3NldCA9IHNldChbZHJp
dmVyXSkNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBydW5fdHlwZSA9IHJlc3VsdA0KPj4g
LS0NCj4+IDIuNTAuMA0KPj4NCg==

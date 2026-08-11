Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723CCC5AD55
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 05:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DFC10E29D;
	Tue, 11 Aug 2026 05:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkrdgykG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9B110E29D
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 05:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786426291; x=1817962291;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jxi1sq+WFjRXc7ta5QkV8d4udXF2eElKsj0PMWJl/Ss=;
 b=gkrdgykGXdv/A7HyxXeiMDr3pTyx8BM3MxzFTPACdPXP2uZNBjcT6PhO
 +4xQ9OTp2zdo+TYI9kFdnJZDD8GfDlJQPe33W7bKX3tFee5vV425e+Xn4
 XtEup/+71GwG/QWHEb6+ApxVtPGzv/MDaIhyxVNOt+sEoRm97vrUXt9Cr
 NVzEOybbq3m5NOrWIuSiUOVShL7KO4NJSbX1MO4eiFlf56t4Ebx5ulgCi
 XGzxl/diNcfBgKku7tGULcLl/RA2DiwCqPNnKxG66t1e/T3Rf8YPZQqH0
 NB96z11vlqBsQhR0jxtQWX50gIAGFCE1ZNDsY3hgeBcftnH+fItvxnXXX w==;
X-CSE-ConnectionGUID: vSamqdVTTbyJh4h+TwSY1Q==
X-CSE-MsgGUID: DmM3iT1bRtmq1CoQxL6mEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="74483751"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="74483751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 22:31:30 -0700
X-CSE-ConnectionGUID: 1KwAXcQjRr6yFYAibGKzMQ==
X-CSE-MsgGUID: oK8ev1BHQUObzK9wbFYHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="287945268"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 22:31:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 22:31:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 22:31:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 22:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vxj1Skza+VNzgX2b2CeqOB6Qx+ruSYt7o0U4m59MqOrshzCLuRAxhUZ8x2IUPjk0tppbJYQceQ7jtFCnaewYgBNOQ7cX3qjTw4qQyk1xkufkn1XKpQxez+weayX+UsRuq2Leg3tVMnTLQF5PJWWC02fs9694KNYNIkIIi7qyNb4+XqFKBDxfzkmDMUjm5LzUNTHs6PSosX7BhHSiYyQ+ZK/FOA5rQSu9jYHhXJrnX/y3wajFAf45Xu1pKnJq3q7O+8MJuJ4/t9D/pgMo8luWt/1CoQLjFeqEeaEhJ/wzCgLPPaMdl2gHk6HfSoNC+Cx12W6gSn4bOL6BDR/0ikBIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxi1sq+WFjRXc7ta5QkV8d4udXF2eElKsj0PMWJl/Ss=;
 b=kOLA8W7GKsGI9pz8u/MYLjNrSOx8os8NjY9JMnAbYtsQ+Fp1YOzoiYWJLFp8bM+mfUpd+zH8nRWF9kirGdtz9uV8FHB+yRwZcovXFGn08D1S1R6HqEd13gK1MbVenWDzly10IDsdxp+UWVxo6HBS6+lSqQBoPL3TnvyV9jieIed6lVH+AnrZFfb5DfmPBRmfEhysKaQZRRILwFTGXrhEc/cbrAqiAJ7PeWVw0v0hs3ja+MyuwPThPfT00tRaoklSeNoK5RU4ki7/t9av73RmmVU/3qy1B1kyTofwjEpTdFzaOeto21aA5M7Hcatfo6CAMOgVGIbsP0Z8crlVPsfIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 05:31:26 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 05:31:26 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
Thread-Topic: [PATCH i-g-t v2 1/2] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
Thread-Index: AQHdKPz3fTz/O3HZqU659ceo/YmfhraYSAcw
Date: Tue, 11 Aug 2026 05:31:25 +0000
Message-ID: <IA1PR11MB63488312022E8E0B51A69DEDB2DD2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260810191800.1076781-1-ramanaidu.naladala@intel.com>
 <20260810191800.1076781-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20260810191800.1076781-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|CH3PR11MB7369:EE_
x-ms-office365-filtering-correlation-id: c82a8e1b-0620-4d7d-3644-08def769c994
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|23010399003|1800799024|366016|38070700021|6133799003|3023799007|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 9u/ML0wge23JDV2/BJRho7Ai6Pv2gNvL7KvmWxidmuacbiomWdvlX2ed1bp1sOy6Vq6qHfCo6xxw1dnFBgNgOquZVVO+Q2W/6zOJlo7bb/aYPoKdNz/tbXvDEa8nYntDb23CLfIBQ7HcFOEh4mrU/9lRDbXD61MrHdWlZaq+2zRF4Hl/q0BRdXmcXzLiUsijcnyo3v5T+6zQejIoJjswQlJdiLmv93aa9W9zYo1LCQjtEySUvCNJ7cuZlgzXXBc6GcZc4ePY3Uddws1EQFcOk/1x2jF2YgVahwtj5SXGwSu0T9v+yCr8g3bzfpwc1Y1RBR1MvWhJQxxvEfwKSSUx1cdWbEYjowP5vHwmfH/jphGXiM7KPPVg8PAFX9s5tSUrZ/695NywBKwnf5AygfSmzmkZn5sejFlRujCSMSCy4jitwHvgN0PFXJTJjr9lYQWysyLW46uRqlhIDSO2cQucoZjKtNzbc/t+F7jfI510nnnTJn6JR5/IhUXKxMoCxalPzXOB/rcASBXtU7LiIwUV0u+gjC4xTk9O/OOOe8LrwUQQw7BXtYUTHj6O4rRbOKWBFEVFo0a3PQEmOekZl/DNHJnAp70j6vuN292UWTlrGQCmzAwGuAYDZ/aopZ9SyrDZwB/enJzNdPt7CkkKwU2lF+BT9FS3uU2PP02AZw7x+UYmKZLaS75EUX3BB9pF9Je/WeZbPtNj/+X83kg8kBp9cRYv33wxJFoNeTbEcdVCfrw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHZvRHFOQ1BkaFlMc3dRdVl3WjR6TTlrWlVabktqUzFzbUxTQTI3MklLSVdi?=
 =?utf-8?B?amo3dXZ5M1Zzc28zR0tRSlZsTkRZd1NPT2g5MENGK3dVeHhSQ0VhVnUveklY?=
 =?utf-8?B?YkZXVTRuUHVBckNuMkxiSDMzUU93NzExUmxzK0Vydm5NZnhORnlpTWNISzFo?=
 =?utf-8?B?SzlLZEJRbGhPajVzOUlFSGhFT2FmMG1NbXl1YU1KUkdSMGNrNkswbXlOSURp?=
 =?utf-8?B?ZDkydVdvM3VtVlhxdjhhMnZGZmR3aTlhNVFtTmQ2SWdpUUJDSFA4WTFjSkNK?=
 =?utf-8?B?S1JZUnNNZzN3RmlDUVJlRnBSd05SSGxaWERzNmFBcElMSWJvMFhMVFUydmJ3?=
 =?utf-8?B?M08veGpJNkcyajh0NmRaUVRuckZFZmc1eEp5LzduejVzRHdQd1JJMys0ZlBQ?=
 =?utf-8?B?a05tQ05BRDI1eGNTWkVLUFN6KzFLOXF0RVM2YkRBclF5WjNzWlNVaGYwNUZw?=
 =?utf-8?B?OWRFeHV6U2lNbld6SWszSFZRYlVUN2dLZVB3Yi9PNXFiVWh6S1ZHWVpINEVW?=
 =?utf-8?B?bkJCWm9PZjRVTUdaWW1Bb1lmYVdaYURJaUVGMzBBcFdQZ2xIcStFKyt6TStu?=
 =?utf-8?B?Qlp2ZE01UityNTNsUVlqTFc3cnBVQ0RjYzJHOXgvS0paT3VBcTU3c2JsMmNi?=
 =?utf-8?B?ZHR5dko0U3V4N1daSEMrVFdhbVZQbGs2V3F6SGlsL09hTWVVMXc0OTRnWmVy?=
 =?utf-8?B?SGFLRklPOFowODJLb3ZvNCtsdDQya1JRaDFtcVAxa1dyMjZQQ0xmcHhRbTll?=
 =?utf-8?B?UmhRVG93MENkUXJSTmVQVVVIczlqMUVINWplM1lSVUlxRVlla2dKK2tBZ0x6?=
 =?utf-8?B?NUtYeEIzaHB5NzFtVzBLRldoWGQ0UjhRQ2FGNnVjQ1F5N2ZKbUtDTlluTUdP?=
 =?utf-8?B?VG9BeEZBOFh1c2s4Mzc1bUR1c3IxSFdjVDNyMUtzcmZCbUtibzg5UC9zVjBN?=
 =?utf-8?B?YzhCN1ArZFphRWtqZ1JyNndBNmp0VzEyZGpwZ2kvdHBoeUlXUUNGbDFyMHRr?=
 =?utf-8?B?anUySnB4b0poZVZibC9seEU4YmZhNEg3emdxdUtXM09kK3NsMDBldmE4YitX?=
 =?utf-8?B?a0dCc2ZoanYzWXdVaExnL09HOWhOYkRRci9sYXVINE1BaU12blVuR21WS1Na?=
 =?utf-8?B?RUg1SGtYR0U5OTdRVGdoUmkyOGVhTHF1SE10RzNUdjhaT2lMSFN3d290NExm?=
 =?utf-8?B?ZWEvb2YvMWhXTGRnUWNVNEtiTzczRmRJVEk0ZkdiemNQOE8vSFNlSEhHalJ5?=
 =?utf-8?B?VVE4SUE3cmZFREFaQzcwcHEvQzA2bWtCeDV6b0tCLy8vSU9wU0RHQXdRS1Qr?=
 =?utf-8?B?c0xDc0hhSXQwVzNLdDFvWVdueEJLclYxaVM4S0FzRzZnTkJmK25CeEhIYU1k?=
 =?utf-8?B?NnZMUkJEU2VlTTVrSm80KzJXU3I0eVMya0xwV1o2bWd5NHRHVkpuWGVrN1NF?=
 =?utf-8?B?ckpjeHRyR014KzE5eUhzb2loeW9MNkpQb3UwZkFCZFJJRVFlOHcvSlFpOUYy?=
 =?utf-8?B?dTkxOFBocURlNU5HSHYvTHU1KzhhMjBPdGxOUzlHSW5sT2syRFN2S3dTek9t?=
 =?utf-8?B?a0VWQ1N1NDVjcFgvbFF5Sk9mNUJCZTBQa09uZ0trcmk5VXJkM2ZlNUFxQmZQ?=
 =?utf-8?B?TmtLR2lvUzZhcXcxWXcrVGY1eVAzVy9HdHBqRTJFTzFEUlduSS93MHdDMkRh?=
 =?utf-8?B?eVFqV1F0Qy9NL0k2QlVWd0VqQmlBT1E3S2xDcXpSZkNIOTVoTUxqR1dmWWtB?=
 =?utf-8?B?OFg0eHNUckhaUmFDQ3FjUHR2RldJa2ppaEk0djJKdDFWa1Y0VW92WWx2YXQv?=
 =?utf-8?B?YTd3MXF3SzhqbXVndmtnd21oWVZXSmV4d0NqM25mVHdBSE1RRnpFQ2lyK1Np?=
 =?utf-8?B?VjJMMDJiczAwZEs3UVY4ckIrOXZDN1RMS2JseHB2b2liNXhYVDJmanhYUnU5?=
 =?utf-8?B?WWMwZ0FFb1N4N1RCMDdhM2lRZUlVUC82dG5CVXkzT0ZrR1ErMGpnNXlGVS9N?=
 =?utf-8?B?OFpyM0o5c3hnUWNFMFNZUTZYZVhSMGd1WTd5QUIzVUdqdFpPZHJHQUU1NS9G?=
 =?utf-8?B?a0RldFJTVmJxYldPRnVybmoxL0RuQ1dIWm8rdW03NXlSN3lKVHJHN3Arb2tQ?=
 =?utf-8?B?ZHYrKzBjbGYwV0t6OWptcUhUZnp3Wk9GTVB6OUtobDZCZ09OS2FMQ00vVzI3?=
 =?utf-8?B?cXFtU0hFc1pPdG1pSm41aFJKQnVIbW5GTlJYY1l2NUxSbXlnUHlxOFc2MFRE?=
 =?utf-8?B?VE52MmtOclFZTk9HYTB0VmRGWmx4VXkzMkYwL1JNcmI3blYvMVBIZTNrbkRw?=
 =?utf-8?B?bzlzNlJ1K3RLOHQ2dW1BOE00K2ZIbkZyazdORitaUENNSlo2SHo2N1p3NTE2?=
 =?utf-8?Q?ZTVG8chatVUlfnOVLxIZBCoArnNgnushCCR5Nu3nDReYk?=
x-ms-exchange-antispam-messagedata-1: rBOnWYiBLw7mW+aviAXzuLooTti+M3rlQaaDTdwzHJt1/HlSufueJpo0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: snYKya8PCruUoUcZd9hR8uikj8lsK+HyvwkUzwCcbkvx1jBFTQDdxci98wLidy/EJcsj3sEV7jvvKWs53TZlIUxlVmezX9ixrfxxHYhP+ur10FduPTUJj3lt0dkVAU+IE2jDDns1ypRKiShU0DKe9uur4xMkKBK+86GS4QAC1oBcXiLMvhF9CqI0+ArOj/3sykqtJwjvner9wUZKUyiYPtYMxsB+SqSesycGeboWK+wtTQ56AEIXPIQyDg6lgmZn1JE8UI+3rPKLsPlCuDFXIve6dDfJb4Z+k4hwPn9kVCO5ROHbF45fLquN62NfzsGygz5/Xcp6aO8/ZAhVOyG6kg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82a8e1b-0620-4d7d-3644-08def769c994
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 05:31:25.8497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffk3XPtceDFWVtAV8chw0mnTnzFmgHEpNUFO/fBzgxSoSDMgZ2cwjSXjFH3ll9VYVls8N7MeVmg6w7oMtkKiz34dIM6mBDKYQVqkol0ldldDrZYt11Kv7iijYOwOYpdg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmFsYWRhbGEsIFJhbWFu
YWlkdSA8cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT4NCj4gU2VudDogMTEgQXVndXN0IDIw
MjYgMDA6NDgNCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCb3Jh
aCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPjsgR29s
YW5pLA0KPiBNaXR1bGt1bWFyIEFqaXRrdW1hciA8bWl0dWxrdW1hci5haml0a3VtYXIuZ29sYW5p
QGludGVsLmNvbT47IE5hbGFkYWxhLA0KPiBSYW1hbmFpZHUgPHJhbWFuYWlkdS5uYWxhZGFsYUBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MiAxLzJdIGxpYi9pZ3RfdnJyOkFk
ZCBWUlIgaGVscGVyIGxpYnJhcnkgZm9yIGRpc3BsYXkNCj4gcmVmcmVzaCByYXRlIHRlc3RpbmcN
Cj4gDQo+IEludHJvZHVjZSBhIG5ldyBoZWxwZXIgbGlicmFyeSBmb3IgVmFyaWFibGUgUmVmcmVz
aCBSYXRlIChWUlIpLg0KPiANCj4gQWRkIGhlbHBlcnMgdG8gdmFsaWRhdGUgdGFyZ2V0ZWQgcmVm
cmVzaC1yYXRlIHRlc3RpbmcuDQo+IA0KPiB2MjogTW9kaWZ5IGRlYnVnZnMgd2l0aCBoZWxwZXJz
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxyYW1hbmFpZHUubmFs
YWRhbGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfdnJyLmMgICB8IDExOA0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGxpYi9pZ3Rf
dnJyLmggICB8ICA0NiArKysrKysrKysrKysrKysrKysrDQo+ICBsaWIvbWVzb24uYnVpbGQgfCAg
IDEgKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNjUgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGxpYi9pZ3RfdnJyLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaWd0X3Zy
ci5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF92cnIuYyBiL2xpYi9pZ3RfdnJyLmMgbmV3
IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4gMDAwMDAwMDAwLi4wOWIwMDg5MzMNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9saWIvaWd0X3Zyci5jDQo+IEBAIC0wLDAgKzEsMTE4IEBADQo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKp
IDIwMjYgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8aW50dHlw
ZXMuaD4NCj4gKw0KPiArI2luY2x1ZGUgImlndF92cnIuaCINCj4gKyNpbmNsdWRlICJpZ3Rfc3lz
ZnMuaCINCj4gKw0KPiArLyoqDQo+ICsgKiBpZ3RfdGFyZ2V0X3JyX2RlYnVnZnNfd3JpdGU6DQo+
ICsgKiBAZmQ6IERSTSBmaWxlIGRlc2NyaXB0b3IuDQo+ICsgKiBAY3J0Y19pbmRleDogSW5kZXgg
b2YgdGhlIENSVEMuDQo+ICsgKiBAdnJlZnJlc2g6IFRhcmdldCByZWZyZXNoIHJhdGUgdG8gcHJv
Z3JhbS4NCj4gKyAqIEBudW1lcmF0b3I6IE51bWVyYXRvciBjb21wb25lbnQgb2YgdGhlIHRhcmdl
dCByZWZyZXNoIHJhdGUgZnJhY3Rpb24uDQo+ICsgKiBAZGVub21pbmF0b3I6IERlbm9taW5hdG9y
IGNvbXBvbmVudCBvZiB0aGUgdGFyZ2V0IHJlZnJlc2ggcmF0ZQ0KPiBmcmFjdGlvbi4NCj4gKyAq
DQo+ICsgKiBXcml0ZSB0aGUgdGFyZ2V0IHJlZnJlc2ggcmF0ZSBjb25maWd1cmF0aW9uIHRvIHRo
ZSBwZXItQ1JUQw0KPiArICogVlJSIGRlYnVnZnMgaW50ZXJmYWNlLg0KPiArICoNCj4gKyAqIFJl
dHVybnM6IE5vbmUuDQo+ICsgKi8NCj4gK3ZvaWQNCj4gK2lndF90YXJnZXRfcnJfZGVidWdmc193
cml0ZShpbnQgZmQsIGludCBjcnRjX2luZGV4LA0KPiArCQkJICAgIHVpbnQzMl90IHZyZWZyZXNo
LA0KPiArCQkJICAgIHVpbnQzMl90IG51bWVyYXRvciwNCj4gKwkJCSAgICB1aW50MzJfdCBkZW5v
bWluYXRvcikNCj4gK3sNCj4gKwljaGFyIGJ1ZlszMl07DQo+ICsJdWludDMyX3QgcmV0LCBkaXI7
DQo+ICsJdWludDY0X3QgdmFsOw0KPiArDQo+ICsJdmFsID0gdnJlZnJlc2ggKiBudW1lcmF0b3I7
DQo+ICsNCj4gKwlzbnByaW50ZihidWYsIHNpemVvZihidWYpLCAiJSIgUFJJdTY0ICIvJXUiLA0K
PiArCQkgdmFsLCBkZW5vbWluYXRvcik7DQo+ICsNCj4gKwlkaXIgPSBpZ3RfZGVidWdmc19jcnRj
X2RpcihmZCwgY3J0Y19pbmRleCk7DQo+ICsJaWd0X3JlcXVpcmVfZmQoZGlyKTsNCj4gKw0KPiAr
CXJldCA9IGlndF9zeXNmc193cml0ZShkaXIsICJpbnRlbF92cnJfdGFyZ2V0X3JlZnJlc2hfcmF0
ZSIsDQo+ICsJCQkgICAgICBidWYsIHNpemVvZihidWYpIC0gMSk7DQo+ICsJIGNsb3NlKGRpcik7
DQo+ICsJIGlndF9hc3NlcnRfZihyZXQgPT0gKHNpemVvZihidWYpIC0gMSksICJkZWJ1Z2ZzX3dy
aXRlIGZhaWxlZCIpOyB9DQoNCk5JVDogTGluZSA0MyB0byA0NSwgY2hlY2sgZm9yIHRhYi9zcGFj
ZSANCg0KPiArDQo+ICsvKioNCj4gKyAqIGlndF9jbXJyX2RlYnVnZnNfcmVhZDoNCj4gKyAqIEBm
ZDogRFJNIGZpbGUgZGVzY3JpcHRvci4NCj4gKyAqIEBjcnRjX2luZGV4OiBJbmRleCBvZiB0aGUg
Q1JUQy4NCj4gKyAqDQo+ICsgKiBSZWFkIHRoZSBjb25maWd1cmVkIHJlZnJlc2ggcmF0ZSBmcm9t
IHRoZSBwZXItQ1JUQyBWUlIgZGVidWdmcyBub2RlLg0KPiArICoNCj4gKyAqIFJldHVybjogTm9u
ZS4NCj4gKyAqLw0KPiArdm9pZA0KPiAraWd0X3RhcmdldF9ycl9kZWJ1Z2ZzX3JlYWQoaW50IGZk
LCBpbnQgY3J0Y19pbmRleCkgew0KPiArCWNoYXIgYnVmWzMyXTsNCj4gKwl1aW50MzJfdCByZXQs
IGRpcjsNCj4gKw0KPiArCWRpciA9IGlndF9kZWJ1Z2ZzX2NydGNfZGlyKGZkLCBjcnRjX2luZGV4
KTsNCj4gKwlpZ3RfcmVxdWlyZV9mZChkaXIpOw0KPiArDQo+ICsJcmV0ID0gaWd0X3N5c2ZzX3Jl
YWQoZGlyLCAiaW50ZWxfdnJyX3RhcmdldF9yZWZyZXNoX3JhdGUiLA0KPiArCQkJICAgICBidWYs
ICBzaXplb2YoYnVmKSAtIDEpOw0KPiArCWlndF9hc3NlcnRfZihyZXQgPj0gMCwNCj4gKwkJICAg
ICAiRmFpbGVkIHRvIHJlYWQgaW50ZWxfdnJyX3RhcmdldF9yZWZyZXNoX3JhdGUuXG4iKTsNCg0K
ZGlyL3JldCBhcmUgdWludDMyX3Q7IGlndF9yZXF1aXJlX2ZkKGRpcikgKGRpciA+PSAwKSBjYW4g
bmV2ZXIgZmFpbCwgYW5kIGlndF9zeXNmc193cml0ZSguLi4sIHNpemVvZihidWYpLTEpIHdyaXRl
cyAzMSB1bmluaXRpYWxpemVkIGJ5dGVzIGFuZCBhc3NlcnRzIHRoZSBoYW5kbGVyIGNvbnN1bWVk
IGV4YWN0bHkgMzEuIFVzZSBpbnQgZm9yIHRoZSBmZC9yZXR1cm4sIGFuZCB3cml0ZSBzdHJsZW4o
YnVmKSBhc3NlcnRpbmcgdGhlIHJldHVybiBlcXVhbHMgdGhhdC4gQWxzbywgZGVhZCByZXQgPj0g
MCBjaGVjayArIE9PQiBidWZbcmV0XQ0KDQo+ICsNCj4gKwlidWZbcmV0XSA9ICdcMCc7DQo+ICsN
Cj4gKwlpZ3RfaW5mbygiJXNcbiIsIGJ1Zik7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogaWd0
X3Zycl9tb2RlX2xpbmVfcmVmcmVzaF9oejoNCj4gKyAqIEBtb2RlOiBEUk0gZGlzcGxheSBtb2Rl
IHVzZWQgZm9yIHRoZSBjYWxjdWxhdGlvbg0KPiArICoNCj4gKyAqIENvbXB1dGUgdGhlIHJlZnJl
c2ggcmF0ZSBkaXJlY3RseSBmcm9tIHRoZSBtb2RlIHRpbWluZyBwYXJhbWV0ZXJzLg0KPiArICoN
Cj4gKyAqIFJldHVybnM6IFJlZnJlc2ggcmF0ZSBpbiBIeiBhcyBhIGZsb2F0aW5nLXBvaW50IHZh
bHVlLg0KPiArICovDQo+ICtkb3VibGUgaWd0X3Zycl9tb2RlX2xpbmVfcmVmcmVzaF9oeihjb25z
dCBkcm1Nb2RlTW9kZUluZm8gKm1vZGUpIHsNCj4gKwlyZXR1cm4gKGRvdWJsZSltb2RlLT5jbG9j
ayAqIDEwMDAuMCAvICgoZG91YmxlKW1vZGUtPmh0b3RhbCAqDQo+ICsoZG91YmxlKW1vZGUtPnZ0
b3RhbCk7IH0NCj4gKw0KPiArLyoqDQo+ICsgKiBpZ3RfdnJyX2dldF9tb2RlX3dpdGhfdmlkZW9f
dGltZWluZzoNCg0KdHlwbyAidGltaW5nIiAtPiAidGltaW5nIg0KDQo+ICsgKiBAb3V0cHV0OiBE
aXNwbGF5IG91dHB1dCBjb250YWluaW5nIGNvbm5lY3RvciBtb2RlIGxpc3QNCj4gKyAqIEBmcHM6
IFJlcXVlc3RlZCBpbnRlZ2VyIHJlZnJlc2ggcmF0ZSBpbiBIeg0KPiArICogQG1hdGNoZWRfbW9k
ZTogUmV0dXJuZWQgbW9kZSB0aGF0IG1hdGNoZXMgQGZwcw0KPiArICoNCj4gKyAqIEZpbmQgYW5k
IHJldHVybiBhIGNvbm5lY3RvciBtb2RlIHRoYXQgbWF0Y2hlcyB0aGUgcmVxdWVzdGVkDQo+ICsg
KiB2aWRlbyB0aW1pbmcgcmVmcmVzaCByYXRlIGluIEh6Lg0KPiArICoNCj4gKyAqIFJldHVybnM6
IHRydWUgd2hlbiBhIG1vZGUgaXMgZm91bmQsIGZhbHNlIG90aGVyd2lzZSAgKi8NCj4gKw0KPiAr
Ym9vbCBpZ3RfdnJyX2dldF9tb2RlX3dpdGhfdmlkZW9fdGltZWluZyhpZ3Rfb3V0cHV0X3QgKm91
dHB1dCwNCj4gKwkJCQkJIHVpbnQzMl90IGZwcywNCj4gKwkJCQkJIGRybU1vZGVNb2RlSW5mbw0K
PiAqbWF0Y2hlZF9tb2RlKQ0KPiArew0KPiArCWRybU1vZGVDb25uZWN0b3JQdHIgY29ubmVjdG9y
Ow0KPiArDQo+ICsJY29ubmVjdG9yID0gb3V0cHV0LT5jb25maWcuY29ubmVjdG9yOw0KPiArCWlm
ICghY29ubmVjdG9yKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwlmb3IgKGludCBpID0g
MDsgaSA8IGNvbm5lY3Rvci0+Y291bnRfbW9kZXM7IGkrKykgew0KPiArCQlpZiAoY29ubmVjdG9y
LT5tb2Rlc1tpXS52cmVmcmVzaCA9PSBmcHMpIHsNCj4gKwkJCSptYXRjaGVkX21vZGUgPSBjb25u
ZWN0b3ItPm1vZGVzW2ldOw0KPiArCQkJcmV0dXJuIHRydWU7DQo+ICsJCX0NCj4gKwl9DQo+ICsJ
cmV0dXJuIGZhbHNlOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF92cnIuaCBiL2xpYi9p
Z3RfdnJyLmggbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4gMDAwMDAwMDAwLi5hYmVhMzJh
MDcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9saWIvaWd0X3Zyci5oDQo+IEBAIC0wLDAgKzEs
NDYgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qDQo+ICsg
KiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNp
Zm5kZWYgSUdUX1ZSUl9IDQo+ICsjZGVmaW5lIElHVF9WUlJfSA0KPiArDQo+ICsjaW5jbHVkZSA8
c3RkYm9vbC5oPg0KPiArI2luY2x1ZGUgPHN0ZGludC5oPg0KPiArI2luY2x1ZGUgImlndC5oIg0K
PiArI2luY2x1ZGUgImlndF9rbXMuaCINCj4gKw0KPiArI2RlZmluZSBDTVJSX05VTUVSQVRPUiAx
MDAwVUxMDQo+ICsjZGVmaW5lIENNUlJfREVOT01JTkFUT1IgMTAwMFVMTA0KPiArI2RlZmluZSBD
TVJSX1ZJREVPX01PREVfREVOT01JTkFUT1IgMTAwMVVMTCAjZGVmaW5lDQo+ICtUQVJHRVRfUlJf
U0FNUF9DT1VOVCAxMDANCj4gKw0KPiArZW51bSB7DQo+ICsJQ01SUl9WSURFT19NT0RFLA0KPiAr
CUNNUlJfTk9OX1ZJREVPX01PREUsDQo+ICsJQ01SUl9ESVNBQkxFLA0KPiArfTsNCj4gKw0KPiAr
Y29uc3QgdWludDMyX3QgaWd0X3Zycl9zdGFuZGFyZF92aWRlb190aW1pbmdfZnBzW10gPSB7DQo+
ICsJMjQsIDI1LCAzMCwgNDgsIDUwLCA2MCwgNzUsIDkwLCA5NiwgMTAwLCAxMjAsIDE0NCwgMTY1
LCAxODAsIDIwMCwgMjQwLA0KPiArfTsNCg0KY29uc3QgdWludDMyX3QgaWd0X3Zycl9zdGFuZGFy
ZF92aWRlb190aW1pbmdfZnBzW10gKGFuZCBpdHMgY291bnQpIGhhdmUgZXh0ZXJuYWwgbGlua2Fn
ZSBhbmQgd2lsbCBjYXVzZSBhIG11bHRpcGxlLWRlZmluaXRpb24gbGluayBlcnJvciBhcyBzb29u
IGFzIGEgc2Vjb25kIC5jIGluY2x1ZGVzIHRoaXMgaGVhZGVyLiBEZWZpbmUgdGhlbSBvbmNlIGlu
IGlndF92cnIuYyBhbmQgZXhwb3NlIGV4dGVybiBkZWNsYXJhdGlvbnMgaGVyZS4NCg0KPiArDQo+
ICtjb25zdCB1aW50MzJfdCBpZ3RfdnJyX3N0YW5kYXJkX3ZpZGVvX3RpbWluZ19mcHNfY291bnQg
PQ0KPiArCUFSUkFZX1NJWkUoaWd0X3Zycl9zdGFuZGFyZF92aWRlb190aW1pbmdfZnBzKTsNCj4g
Kw0KPiArdm9pZA0KPiAraWd0X3RhcmdldF9ycl9kZWJ1Z2ZzX3dyaXRlKGludCBmZCwgaW50IGNy
dGNfaW5kZXgsDQo+ICsJCQkgICAgdWludDMyX3QgdnJlZnJlc2gsDQo+ICsJCQkgICAgdWludDMy
X3QgbnVtZXJhdG9yLA0KPiArCQkJICAgIHVpbnQzMl90IGRlbm9taW5hdG9yKTsNCj4gK3ZvaWQN
Cj4gK2lndF90YXJnZXRfcnJfZGVidWdmc19yZWFkKGludCBmZCwgaW50IGNydGNfaW5kZXgpOw0K
PiArDQo+ICtkb3VibGUgaWd0X3Zycl9tb2RlX2xpbmVfcmVmcmVzaF9oeihjb25zdCBkcm1Nb2Rl
TW9kZUluZm8gKm1vZGUpOw0KPiArDQo+ICtib29sIGlndF92cnJfZ2V0X21vZGVfd2l0aF92aWRl
b190aW1laW5nKGlndF9vdXRwdXRfdCAqb3V0cHV0LA0KPiArCQkJCQkgdWludDMyX3QgZnBzLA0K
PiArCQkJCQkgZHJtTW9kZU1vZGVJbmZvDQo+ICptYXRjaGVkX21vZGUpOw0KPiArDQo+ICsjZW5k
aWYNCj4gZGlmZiAtLWdpdCBhL2xpYi9tZXNvbi5idWlsZCBiL2xpYi9tZXNvbi5idWlsZCBpbmRl
eCAzMDAxYjQ3M2UuLjg2NzViZDRhNg0KPiAxMDA2NDQNCj4gLS0tIGEvbGliL21lc29uLmJ1aWxk
DQo+ICsrKyBiL2xpYi9tZXNvbi5idWlsZA0KPiBAQCAtMjIsNiArMjIsNyBAQCBsaWJfc291cmNl
cyA9IFsNCj4gIAknaWd0X2NvbmZpZ2ZzLmMnLA0KPiAgCSdpZ3RfZmFjdHMuYycsDQo+ICAJJ2ln
dF9jcmMuYycsDQo+ICsgICAgICAgICdpZ3RfdnJyLmMnLA0KPiAgCSdpZ3RfZGVidWdmcy5jJywN
Cj4gIAknaWd0X2RldmljZS5jJywNCj4gIAknaWd0X2RldmljZV9zY2FuLmMnLA0KPiAtLQ0KPiAy
LjQzLjANCg0K

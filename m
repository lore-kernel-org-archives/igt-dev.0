Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987DCCCFA07
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3645810E3A7;
	Mon,  3 Nov 2025 10:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aH0l48t1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F83A10E3A5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165225; x=1793701225;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tk+sS1kKwYo9RIsnpM8LP8JkV1any8Ps2IBXQpTw2l4=;
 b=aH0l48t1PeTbXnz7gm5CfPkAqfun/R0mObFDYfNbXEhGLe7QzClwcZHA
 yK8PzaSNmHqkHmJmQmOAAVnEJZFEAKWhSbNF1qHhwKsmqNCZl65YtgXlq
 SHfOp/DHT77nZly01MpDSM/NWOtBH0NtQ2h8Y4X0NOvNWwDIv9Yx4Mc7O
 UUWUE5avslSer8G05u62KXb3t38PHbaCkn5SqNBSbjeGQffjqdSbsy6n+
 re8bJ+8QQ7PTLq+reFz5nD6Y6Rr/7QXQ0eBvQZeBax8bn9VhMMwD5gOrG
 qLOawej7whiYqpLzlr6d2Dp5GuHPOb4tqMOb+3yLiQDnmr9fU92ySVFhY A==;
X-CSE-ConnectionGUID: UqmktRkWQgCvmm/qo8wEGQ==
X-CSE-MsgGUID: F3HLtVI0TiGlhbfCPPXm0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64387661"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64387661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:25 -0800
X-CSE-ConnectionGUID: tSfVT3rrQUW9d2I9W7pHyQ==
X-CSE-MsgGUID: 0Zte3LFXQ12HwTsE+6ZV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="224070738"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:20:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 02:20:24 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:20:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCQE55wk6Hc0Oi7m4s5t/2X2euFOJ4nKluY1DIctvE/ZfyTei90ptt/XuuXOzsaULzLv5oyT+9pgPTmAgo+UOnjtKfadPt0JvVSofFm2I62OWmfLfzTHfOGNJ+nEP8pEa2l45bX03A61wRGAOV9JH/ZIDVUv6ZzBUhCZ/+ddBL2teRQPJknUGxEoK66FvgAgoCYIPwC/8qvym3oc5+OqQz212eELa4v8rsOjmyebQ3enbnRYa/e0FYog8hFmNpZlVchvpENB8zOLD6V4GYA4NN8htknShkwDVFNPuPt4ku/Nq8mz2yd/3EO66HQxRmsOaRqpJ9RBkXhyKJTetsnlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQIUMixwQ8ZRI18ErTVbyiAUh8iSnKUngBZgv6KSTtA=;
 b=zLTnBuXwHX7arWhvF/h3seTLnbuoTCSTG2uDSL3h/JPlertfHLWQyRvaJiAm8RVQdb1GGH4HHGF2Sv2mD5IReIQsw/TjkrgtgwVj3e1EHf/S9/ThboV8r9AjANfa4oHXExlmK5XW7XOlQyFYBXkhLR6Pgllz8wuMLeRfKuQAkq+lUNDd22/iutxow+m9OvkQ2CEc7kFzg2xZUK5VMU5vmdq0b2VdTN//3SmgseQVqxIw/6nf/h29RNa0IpCJrB7Uz0mx54IZpqJ0YBAat4pa3meZ42Di9/iyIajNVQSXfz3WY51x1+H6ryWwCzNTJUZxDCDFubCRiEu8Hcm5U2w0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:20:05 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:20:05 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Thread-Topic: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Thread-Index: AQHcSpVMRtyK1IsNCUGeCp0+9ih0y7TgwRqAgAAAe6A=
Date: Mon, 3 Nov 2025 10:20:04 +0000
Message-ID: <CH3PR11MB8434D492B61A7BDECA059FE48DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-16-niranjana.vishwanathapura@intel.com>
 <CH3PR11MB8434BD6B791069E1740E89618DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434BD6B791069E1740E89618DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB7205:EE_
x-ms-office365-filtering-correlation-id: 8f292a98-b473-4189-8e9a-08de1ac28e8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3eGH7jB13sWbeeguBriLWn7zvO2uNQDOwlN2UPIsqt081f5cFIcDAPpkYwpD?=
 =?us-ascii?Q?/JyVlEJy7AGVb+i2ABVJdZw5Q4T3/JsQhqQDswnuMMiuQnILrx6RC1wk6zft?=
 =?us-ascii?Q?L/vQEscYQxUGBHpmy3koCLKmMV1Y5IpZNZ4ruWXRZIKcjwC59X/lYGB/epp5?=
 =?us-ascii?Q?7RKf/RvyBCWRu+DPx+NsjeuqI31knmmKE3ZDrsHYwV/zzFe27bNYaeN7U/xR?=
 =?us-ascii?Q?X5SUnNEp471VZF92WN2fyZSqOQtKggJ8LYB8gRyVLyC9lhAav41XNjgCoiE+?=
 =?us-ascii?Q?at+VNcfXSHcqQTsSHS6WryUhaQVDtbTXxNCmq9MPHn7j7jVtEJ3F0BLVT1hz?=
 =?us-ascii?Q?sxZH4PQOOhI8XgSAELDqDSAawDulNzMKg+swtfu/sKQoa/YIQg6fzEAA2QKQ?=
 =?us-ascii?Q?95NhumAaNBP2OE1wlLpD+s/pwLHVj3eCnLgKtoz2ynikyhojbi5iMltX+jvu?=
 =?us-ascii?Q?6tZBpze7bG1jZnja8C8/LgKjM99CFVh/7yv8lZ81vvDA9rGX7RMh3abMoGg1?=
 =?us-ascii?Q?xniS4DhjCxRnD7hj46lW3msu4OxFkAqpNVS1gkqE3lpiltJ1bBhWzurqFy8Z?=
 =?us-ascii?Q?ePX6Tps+n7DKzaAniczlWxVzw/jYSQAb5g0WojSUDUueQPU7m+KQcyseRjSn?=
 =?us-ascii?Q?fYa5DZMXWUkNrAzOmEu5ZOhatxHTWPT0TTgIJWjc6Btgj0XqOzXEBsvBWDVj?=
 =?us-ascii?Q?ilbDAkvRivnLkPoRlp/03v+03ThPfeV2oEOxpLRZzWXfNK/r3SQCRhQt9cI/?=
 =?us-ascii?Q?iGe760v2mrvPHKFYiRn+a3X/0d1lSvHPBey+CNn5+bc0fkq6Ztk8Suockg2V?=
 =?us-ascii?Q?nni13ZA1gczzLq5BACksKiBLG7jEz7L8DBQAnIl988tbfKNQq9gHnroTU0oo?=
 =?us-ascii?Q?sdJh7wUkNo+yWywLbcBtMKUarVuts9fh3vvH6qvLVagceWOSq2l6r61dw3Z3?=
 =?us-ascii?Q?j8ajJYXGgK8I0ThEbMaSCynBFNRkLbGH0jaC0Ucb63ca9K07z4k202jnDmCZ?=
 =?us-ascii?Q?Kesne+r3/A2DpFw/jPAzaqHP1GWYTcZyiP5DlWte+0ktD6zigJQI2+KgS1hG?=
 =?us-ascii?Q?X2a+VWGk3MJVFcsl2lKmejci1HTHY7psqY7BXLDJ5QqoKkO3VRiduo55ETRn?=
 =?us-ascii?Q?Fn2+K5Daxu3rrV4LRi/zgVd41kZzJXizYt8a1jczjwuQwvnC/bmV2iGyeboe?=
 =?us-ascii?Q?uYH9sV9qT4FHpSWl8nmVAfm27RBMqmPl9Qmd0EOmkSI4Z8tdUtspfxfwtEg/?=
 =?us-ascii?Q?ZTSxqmNNE98SpEtLop03rXWggJf644WqmX+08qlMnkqEf5ic+ZOr6w64SmaN?=
 =?us-ascii?Q?Zqv5yJD1HSFCfZog7PxXiABlFsZzoFyOPspO2vqiuHLOxhrE4HcP00wvZrSr?=
 =?us-ascii?Q?fEJtuKOz6OVbJfTT0lUX6q74hR8yvKSCB8qQSKjVhy8gSNEOV5bUNHTH97Wq?=
 =?us-ascii?Q?/9WSZwKwl3UGcbsAZI/uuO0g94M2bVbXFefhCpTXRPjIliriitRlrDREK5rY?=
 =?us-ascii?Q?mjMS2lUc4lMUmsXl1c+Ta0EBERAMeqjqY+3S?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+hfzd0bqEfFA5sObt3MXh7/jm1bgxAGg5IERO5Cr/uBIvdHSmZBBgyohCyf5?=
 =?us-ascii?Q?YIFucjF9CdTFZ9gPeXGimko5joME64HodaJbt4A9JwhE9V38I9bZPRT7veYg?=
 =?us-ascii?Q?TgNDOzrhU+ZLo1JRv9vtlIV5eykRQpLyL5E1gy4H7C/umUXC7k5UIzFAbYNu?=
 =?us-ascii?Q?gDma7od8HD8sFfAC9mSru4g1e62HVpg+fydyZua+2JJ0iC9m1//l28OI8Nor?=
 =?us-ascii?Q?EnGHEO7ixVXN1ZcGtbuE2mw/3kHDo18t1HUqEboIVgL2KAODcbYA1bnRIEiq?=
 =?us-ascii?Q?sO9MhG+LlCIZkMM2H935c3asNxLdZMbMZFjSIATlHZ574ZzOweC+bH3wzHym?=
 =?us-ascii?Q?XQ9qnZnJzweBA44yLFr+3Pvdo9G2I79QlA/QY+X9MElZBphNl5oItz5JWah0?=
 =?us-ascii?Q?+GkTcf3Sitg+IE6J42QzmHS7/RXAsdbbhI/PKfpsaO4Z4NrHUESXo+r0+nzL?=
 =?us-ascii?Q?wRQ6e7tNUVnowGSmp53wAnlCwcphVJFWgO3bEsAT3ZNoRhxoEjku1XenSRK/?=
 =?us-ascii?Q?ImDEu5lEw10Gx9t2HhvpgcabQjvBLy/AxC/ot+EI5eTV1MoT7SPSqlMBiNzM?=
 =?us-ascii?Q?q0RDTFtC5qtXVx/6j3LrRrybTiSbWpWvx3w0KFXxJZ5hPOPAlyhnqv6HUfaI?=
 =?us-ascii?Q?Ka2zRCOmnEf9tuj/H2m1kqy1Vt75ElgNIko/p81apI66uqtzgor/e+riEP/K?=
 =?us-ascii?Q?wr+kTs0TpG1uAhFvVzAxOM+6nfZRFoNvQw3mQjVcCyRAysiSBK8eCJPUcDXW?=
 =?us-ascii?Q?BPJ5GTaaVvVMx0ZFaxNcIAuN8O7RPpuzmMt91ecLn8nGSqZZUIDFivVO87DR?=
 =?us-ascii?Q?IN5b6mtcEfFHQZUExT9tcmpfFPL+8ZmfgsavlFBGDNNLINy6Rz/jY7V97p4u?=
 =?us-ascii?Q?RDjGDbJpL2XQXRfQRYJvGdZSRmqbd6jqte3n+Hu2BdD/IB7B1ly9YP7dJody?=
 =?us-ascii?Q?fE8mrcfbyMZLImZolMmsBK3JVAoaYb2rM7vdERehmTia9YYGYg2aNIfIf5HU?=
 =?us-ascii?Q?xrdf0R0TJnJ+1dl/PjTrTxmciHRVcHXq0eTYFxUFtj93FqfFLmFzNmhtMOye?=
 =?us-ascii?Q?Aon1EXMtJ9dCftQLHMASdb96+L7blFAktY/699TD5c2j8ShPEM2HYcuT0GDM?=
 =?us-ascii?Q?gp4KykRhg20dOASN4cmLzV3869aIuJnUR5eVXeQic1ElWQra7DNY5d2Bkxsm?=
 =?us-ascii?Q?i0HRZJ64M+zOqW2ffNmQ+s9mgnvmC4f0iLyjEJ4eeguzdX9YD8L7QwowCoy6?=
 =?us-ascii?Q?4SXVjKpxqivTqhmgI1Ib9G4/5Me17vydPoCiyGPt8+nGxnsDWlUx/BSa8O+R?=
 =?us-ascii?Q?mUXpOGUAU1TOqzS3AvAYnEg/PH5UPm1DwnqNOHqkcra1YuXYzPQbKwsY4Wmf?=
 =?us-ascii?Q?C4wcCni1uDDg5kYJR6w6cbPTIpz24Hk3ORwGcolorZdOb+6RINyITzGYp6wN?=
 =?us-ascii?Q?Z6UHJptEASM79dAVl4qmFx6EhKP0degZNsVadbCo1nEOs6XY1tOujFwpKWaz?=
 =?us-ascii?Q?03Lnw9UbmioBGN1buiX7ypQpg5UOnqj/gNjvgOVcU33FvC8xW2UnFBo1V8/6?=
 =?us-ascii?Q?My7/D+FE9BI7KOxcPR8szGiqNv91wji1KJ4CA2iaT11B72N3gf11lKsXDidq?=
 =?us-ascii?Q?dYwNPSLTq7r11mrx3hwFZqmHL+rkS4lZXxqIXsWGXflvoUYQ6LxIoVGKaKDf?=
 =?us-ascii?Q?Ju7SfA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f292a98-b473-4189-8e9a-08de1ac28e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:20:05.0102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTfV8EypmN2PgHCfcRenawjIwLz7Ks371mxOY5MB8X8qgNrGo4nNPS9njXsmOloICg7+qpO2YO10s/89mNKJTrXxVC8h9eeyUXSXT0C7ONQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
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
> From: Dandamudi, Priyanka
> Sent: 03 November 2025 03:49 PM
> To: 'Niranjana Vishwanathapura' <niranjana.vishwanathapura@intel.com>;
> igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Niranjana Vishwanathapura
> > Sent: 01 November 2025 12:06 AM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
>=20
Name here need to be changed to xe_exec_multi_queue and same thing
> need to be followed for patch 16.
> >
> > Validate intra queue group priority setting.
> > Validate that a higher priority queue in a queue group can preempt the
> > lower priority queue of the group.
> >
> > During a queue switch, the currently running queue is always switched
> > out without regard to its priority.
> > The priority is only a factor in determining which other queue of the
> > group will be scheduled in.
> >
> > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  tests/intel/xe_exec_multi_queue.c | 212
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 212 insertions(+)
> >
> > diff --git a/tests/intel/xe_exec_multi_queue.c
> > b/tests/intel/xe_exec_multi_queue.c
> > index 7aa5acfdd..9cd4a7a16 100644
> > --- a/tests/intel/xe_exec_multi_queue.c
> > +++ b/tests/intel/xe_exec_multi_queue.c
> > @@ -13,15 +13,20 @@
> >
> >  #include "igt.h"
> >  #include "xe_drm.h"
> > +#include "igt_core.h"
> >  #include "lib/igt_syncobj.h"
> >
> >  #include "xe/xe_ioctl.h"
> >  #include "xe/xe_query.h"
> > +#include "xe/xe_spin.h"
> >
> >  #define SIM_MULTIPLIER	100u
> >
> > +#define XE_EXEC_QUEUE_PRIORITY_LOW	0
> >  #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
> >  #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
> > +#define XE_EXEC_QUEUE_PRIORITY_MAX	3
> > +#define XE_EXEC_QUEUE_PRIORITY_N
> > 	(XE_EXEC_QUEUE_PRIORITY_MAX * 2 + 1)
> >
> >  #define MAX_N_EXEC_QUEUES	64
> >
> > @@ -33,6 +38,7 @@
> >  #define INVALIDATE		(0x1 << 5)
> >  #define FAULT_MODE		(0x1 << 6)
> >  #define SMEM			(0x1 << 7)
> > +#define WAIT_MODE		(0x1 << 8)
> >
> >  #define MAX_INSTANCE 9
> >
> > @@ -210,6 +216,208 @@ test_sanity(int fd, int gt, int class)
> >  	__test_sanity(fd, gt, class, true);
> >  }
> >
> > +static void
> > +__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
> > +		unsigned int flags)
> > +{
> > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > +	struct drm_xe_sync sync =3D {
> > +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > +		.timeline_value =3D USER_FENCE_VALUE,
> > +	};
> > +	struct drm_xe_exec exec =3D {
> > +		.num_batch_buffer =3D 1,
> > +		.num_syncs =3D 1,
> > +		.syncs =3D to_user_pointer(&sync),
> > +	};
> > +	uint64_t vm_sync =3D 0, addr =3D 0x1a0000;
> > +	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
> > +	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
> > +	uint32_t vm, num_queues, queue_priority_max, bo =3D 0;
> > +	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] =3D { 0 };
> > +	int64_t fence_timeout;
> > +	size_t bo_size;
> > +	/*
> > +	 * Q1 - Q6 are used for the priority test.
> > +	 * Q Priority =3D id % 3
> > +	 * 	QID	Q1 Q2 Q3 Q4 Q5 Q6
> > +	 * Priority	 1  2  0  1  2  0
> > +	 * The Priority 1 and 0 are the same priority so hw should pick Q
> > +with
> > priority: Q2, Q5, Q1, Q3, Q4, Q6
> > +	 */
> > +	int expect_order[] =3D {0,2,5,1,3,4,6};
> > +	uint32_t already_in_order =3D 0;		// bitmask to record Q started
> > info
> > +	struct drm_xe_ext_set_property multi_queue =3D {
> > +		.base.name =3D
> > DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > +		.property =3D
> > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> > +		.value =3D DRM_XE_MULTI_GROUP_CREATE,
> > +	};
> > +	uint64_t ext =3D to_user_pointer(&multi_queue);
> > +	int i, j, sleep_duration =3D 1;
> > +	void *bo_map;
> > +
> > +	queue_priority_max =3D XE_EXEC_QUEUE_PRIORITY_MAX;
> > +	num_queues =3D queue_priority_max * 2 + 1;
> > +	igt_assert(num_queues <=3D XE_EXEC_QUEUE_PRIORITY_N);
> > +	igt_assert(num_queues <=3D 31);
> > +
> > +	igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags,
> > eci[0].gt_id,
> > +		 eci[0].engine_class, eci[0].engine_instance);
> > +
> > +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > +	bo_size =3D xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
> > +
> > +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
> > +eci[0].gt_id),
> > +
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	bo_map =3D xe_bo_map(fd, bo, bo_size);
> > +	for (i =3D 0; i < num_queues; i++)
> > +		spin[i] =3D bo_map + i * sizeof(*spin[0]);
> > +
> > +	/* Use the default priority for Q0 because we are explicitly waiting
> > +for
> > it below */
> > +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> > +	multi_queue.value =3D exec_queues[0];
> > +
> > +	if (flags & DYN_PRIORITY) {
> > +		for (i =3D 1; i < num_queues; i++)
> > +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> > ext);
> > +	} else {
> > +		struct drm_xe_ext_set_property mq_priority =3D {
> > +			.base.name =3D
> > DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > +			.property =3D
> > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> > +		};
> > +
> > +		multi_queue.base.next_extension =3D
> > to_user_pointer(&mq_priority);
> > +
> > +		/* Create secondary queues with increasing order of priority
> > */
> > +		for (i =3D 1; i < num_queues; i++) {
> > +			mq_priority.value =3D i % queue_priority_max;
> > +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> > ext);
> > +		}
> > +	}
> > +
> > +	sync.addr =3D to_user_pointer(&vm_sync);
> > +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> > +
> > +	fence_timeout =3D NSEC_PER_SEC * (igt_run_in_simulation() ?
> > SIM_MULTIPLIER : 1);
> > +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> > fence_timeout);
> > +	vm_sync =3D 0;
> > +
> > +	for (i =3D 0; i < num_queues; i++) {
> > +		uint64_t spin_addr =3D addr + i * sizeof(struct xe_spin);
> > +
> > +		xe_spin_init_opts(spin[i], .addr =3D spin_addr, .preempt =3D
> > true);
> > +		sync.addr =3D spin_addr + (char *)&spin[i]->exec_sync - (char
> > *)spin[i];
> > +		exec.exec_queue_id =3D exec_queues[i];
> > +		exec.address =3D spin_addr;
> > +		xe_exec(fd, &exec);
> > +
> > +		/* Wait for job on Q0 to start, allow other queues to run to
> > completion */
> > +		if (!i)
> > +			xe_spin_wait_started(spin[i]);
> > +	}
> > +
> > +	/*
> > +	 * Wait for jobs to get submitted to hardware.
> > +	 * On simulation environment, we need longer wait
> > +	 */
> > +	if (igt_run_in_simulation())
> > +		sleep_duration =3D 4;
> > +	sleep(sleep_duration);
> > +
> > +	/*
> > +	 * Expect the job on other queue to not get scheduled while the
> > spinner
> > +	 * on q0 is not waiting on preempt condition.
> > +	 */
> > +	for (i =3D 1; i < num_queues; i++)
> > +		igt_assert(!xe_spin_started(spin[i]));
> > +
> > +	if (flags & DYN_PRIORITY) {
> > +		/* Assign increasing order of priority for secondary queues */
> > +		for (i =3D 1; i < num_queues; i++)
> > +			xe_exec_queue_set_property(fd, exec_queues[i],
> > +
> > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> > +						   i % queue_priority_max);
> > +
> > +		/* Wait for priorities to take effect */
> > +		sleep(sleep_duration);
> > +	}
> > +
> > +	/*
> > +	 * Trigger a queue switch by making the spinner on q0 to wait on
> > preempt
> > +	 * condition, allowing job on q1 to get scheduled and finish. When
> > we end
> > +	 * the spin[0], it triggers the CFEG to perform a queue priority
> > arbitration
> > +	 * rather than a full context switch out. Consequently, in both
> > semaphore
> > +	 * (WAIT_MODE) and non-semaphore scenarios, a priority check will
> > occur.
> > +	 */
> > +	if (flags & WAIT_MODE)
> > +		xe_spin_preempt_wait(spin[0]);
> > +	else
> > +		xe_spin_end(spin[0]);
> > +
> > +	/* Wait for jobs to get scheduled */
> > +	i =3D 1;
> > +	while (i < num_queues) {
> > +		for (j =3D 1; j < num_queues; j++) {
> > +			if (xe_spin_started(spin[j]) && ((already_in_order &
> > (1 << j)) =3D=3D 0)) {
> > +				start_order[i] =3D j;
> > +				xe_spin_end(spin[j]);
> > +				xe_wait_ufence(fd, &spin[j]->exec_sync,
> > USER_FENCE_VALUE,
> > +					       exec_queues[j], fence_timeout);
> > +				already_in_order |=3D (1 << j);
> > +				i++;
> > +			}
> > +		}
> > +	}
> > +
> > +	/* While ending spinner on q0, bring it out of preempt wait */
> > +	if (flags & WAIT_MODE) {
> > +		xe_spin_end(spin[0]);
> > +		xe_spin_preempt_nowait(spin[0]);
> > +	}
> > +	xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE,
> > +exec_queues[0], fence_timeout);
> > +
> > +	igt_debug("Order\t Actual\t Expect\n");
> > +	for (i =3D 1, j =3D 0; i < num_queues; i++) {
> > +		igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i, start_order[i],
> > start_order[i] % queue_priority_max,
> > +                         expect_order[i], expect_order[i] %
> > +queue_priority_max);
> > +
> > +		/* The priority 0, 1 are the same, so we can skip the
> > comparison */
> > +		if (expect_order[i] % queue_priority_max <
> > XE_EXEC_QUEUE_PRIORITY_HIGH &&
> > +		    start_order[i] % queue_priority_max <
> > XE_EXEC_QUEUE_PRIORITY_HIGH)
> > +			continue;
> > +
> > +		if (start_order[i] % queue_priority_max !=3D expect_order[i] %
> > queue_priority_max)
> > +			j++;
> > +	}
> > +	igt_assert(j =3D=3D 0);
> > +
> > +	sync.addr =3D to_user_pointer(&vm_sync);
> > +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
> > +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> > fence_timeout);
> > +
> > +	for (i =3D 0; i < num_queues; i++)
> > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > +
> > +	munmap(bo_map, bo_size);
> > +	gem_close(fd, bo);
> > +
> > +	xe_vm_destroy(fd, vm);
> > +}
> > +
> > +/**
> > + * SUBTEST: priority
> > + * Description: Validate queue priority setting
> > + * Test category: functionality test
> > + */
> > +static void
> > +test_priority(int fd, struct drm_xe_engine_class_instance *eci) {
> > +	__test_priority(fd, eci, 0);
> > +	__test_priority(fd, eci, WAIT_MODE);
> > +	__test_priority(fd, eci, DYN_PRIORITY);
> > +	__test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE); }
> > +
> >  static void
> >  test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > int num_placement,
> >  		  int n_exec_queues, int n_execs, unsigned int flags) @@ -
> > 708,6 +916,10 @@ igt_main
> >  			xe_for_each_multi_queue_engine_class(class)
> >  				test_exec_virtual(fd, gt, class);
> >
> > +	igt_subtest_f("priority")
> > +		xe_for_each_multi_queue_engine(fd, hwe)
> > +			test_priority(fd, hwe);
> > +
> >  	for (const struct section *s =3D sections; s->name; s++) {
> >  		igt_subtest_f("one-queue-%s", s->name)
> >  			xe_for_each_multi_queue_engine(fd, hwe)
> > --
> > 2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141E2CC6B00
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 05:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A926110F096;
	Thu,  2 Apr 2026 05:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIVDQmRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4D310F096
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 05:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775107647; x=1806643647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lkEj5nBEtfF+TRaurVf3KfdXHRXxUK7c7HfPiSCGrmY=;
 b=GIVDQmRXoGhHlBL/MRuXMISKqnDdl3dUDa/66TgVJ4Wi8wx9ePAzv29C
 z6OqFXY3qLeceWdlIPOD5w9rfhdFfWfgV9Qwn8a2jwZDFC1tW6UxNGhjk
 wT8xihf+GieqXMkzORdmP1xBdZMdWRtW9SPXuv+M7PGeU2XxU4xxwgGJX
 yitsVywBxZ1brZ7D5RIYaaAXCl6uMVzGPZDqClA/qPamLHaJ93YChMDv2
 2fAwGTS4+TG7qyjFJrtZdk5/gL3t55HPnccq4dtlICeBkhb2PPWWYUsG8
 c3I6gSAUVShagVl9Nd6R4QyRzm6wPS40R9JpWNP4kp3Zv6DCAPzs/5bFL Q==;
X-CSE-ConnectionGUID: /wkCrJxETHG9ETtVrnT0Bw==
X-CSE-MsgGUID: QmAc8mOyRsCZ5Yb8N8k3ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86858692"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="86858692"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:27:26 -0700
X-CSE-ConnectionGUID: tF8uJD3LSWanI9KqTnq25Q==
X-CSE-MsgGUID: t7P/18zHT5CIWHToYfLDrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226745518"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:27:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:27:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 22:27:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH8PecSFcecLkjY1Joex27wrPbgwMc1f0HhSPA2+XTRz674WbXjLGqJ1nP9U8tHxKajdxz7LQgf3b9nLRMxkM+DrJVywsNNHpdVMo/wbzz+ieVMwFcivNl5SnHCietIX4BEgZtHphhvgyBhBTOYgQiK1ct569S5qRTgnXhpi+5W5+Ehbv3F+oItJDkKb3JT3ZX6utWyP5m3Im1PwaZYwR1rw61dHyNkiPrtGkITnviui/klPA9UvLR/740gnu4HURCFlHREqy0Ga2XHZit7/5iXP6Twr5USivhw2f/WvVbhQNKs3pBdqtsWH/vA+bWRk10+k3/xXI2dWWGa87rhZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKsM6Dw71M2zhqNq7udMVqDZI5wskkpxJfobH+IP7h8=;
 b=LPCqsNUzAxIldwJN9pAJb2IM6YdXsXoVpvs0T7I0lkWGBpvnuV2gi1QNa8NbEXcbsFrNXrQLwAr2P6pAgYguf6NDk7fe8xOo84K9N9c3Fj2QnZIHHelbBscgW55/oGFQad5wLiq/+EbT4MQc3STMbo6VXbiK5TWtDWuRJH8cfVTT/5IVIO2iCMRa7DidsKmlod8K5bIJ8e1+0qNZxfYp6qtM2vSu5DQmZXBtF+nqE7nFkKepH3rySoPz8C33yCxcU3f4hcQvFNGdLT/DZjFaDlnR2e38H8+f1sSzVZW4p9XDbn/A6AESuC9q/XbwbmUxNVivq5k0edmLdp+cFauD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) by SN7PR11MB6604.namprd11.prod.outlook.com
 (2603:10b6:806:270::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 05:27:22 +0000
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22]) by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22%4]) with mapi id 15.20.9769.009; Thu, 2 Apr 2026
 05:27:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 6/7] tests/intel/kms_joiner: Require boundary mode
 for basic-max-non-joiner
Thread-Topic: [PATCH i-g-t 6/7] tests/intel/kms_joiner: Require boundary mode
 for basic-max-non-joiner
Thread-Index: AQHcwe6h8/1fcCFLqEuB6IT9mJVhrLXLPjfg
Date: Thu, 2 Apr 2026 05:27:21 +0000
Message-ID: <SJ5PPF1611BC49E9EDF11F0EF18C8BD4E1BE351A@SJ5PPF1611BC49E.namprd11.prod.outlook.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-7-kunal1.joshi@intel.com>
In-Reply-To: <20260401160627.1338526-7-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF1611BC49E:EE_|SN7PR11MB6604:EE_
x-ms-office365-filtering-correlation-id: 5540d389-9300-494f-bc93-08de90788411
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: BSt0dvkuT0bPFR6RwE5YHx+MirPTq0pOKgBrAOvaPgRy6AC2LCA18fV6MJs2X2nbM9rvSVvch/J4b+zt9wtaqcxap8PyqS41nMluP+nigQ2Vh/fMqWr953niuaCrZ9kqFq5gV7RdwtY/x1ujpw3caHjxcIhuj1AlI06a/uXwyaOFOwRIpPOIpvC5xi8GgWxIM/GcFErRiDy6XEOILDPV41M8cstE9V1Uf1lglJmfYJ1Z2a1ITNCOecx6QGa0I18hoXwZzyrF4hkh7JAGmMULrjNHjpT1IQae2hQV7xuG/UUVe106rccsIR8ia2COnFa3n7p6d4mthSRQTrTFFOqtLt11oNHM+afGGin+cEM1WcDd5hI0At0ROKOqajSjuROCf0KjkcJgucH61Tu2A26Ffn0rgRg6IzvpxNfkCcfw4b5wD/IQoa3bpQ0JS9J+gHL2TDJdwIbsDPWZyyxkxgeXzvq0grsdgMADMZQUuzMPowxf6ExTLJCMR9v9HVKkyvjdxPd3Tcm5VX4m5EtXspOPmoDAg4KKhP1ZRmzSVzMzzNVSCtykNqCtZSJFCS5iSOk5sos0aSXZkzD3tRcV1RYWpCEoeSCROzOal3AlLv5ZUHOUTCEIevTi2rlcnP1fsUmJB4fxoE6RLHbP/eplQZOCP+ML05LD0ZPtltt5xuwL1Blhbe/U2BrkA9H1+LxWhPpVJ+CJWSsbvpUfhMK7ZtHzGief5sN6AHopPKmlkPs3ROe4JzXfiB7bIdz+uefgCNtt8svrs8KAJNSgGxLBdF6ragb0nOCJqzDYWRu/2C7NhNQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF1611BC49E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mBM5lylxbWErsaCbgmPEMtRKzmdkN5wiPIXFo6xgi0BcnQpwnmRz28+Xjbhx?=
 =?us-ascii?Q?QVvHn1nq5inXYhzEIkv3P1Zj9hEMUqsuVY2hnBgUToRrVPkopphiY2iNaKfv?=
 =?us-ascii?Q?prBydaeXsofR+Iqls0UH+FdHgFWrF6gIqV9GU8HskbOqT1mAy0Oj6TqNMUZs?=
 =?us-ascii?Q?EcJ2CIDH1eNdJFNoED/no0+cJR02wqoKaw8n7tUb2wjQzEY0d9OOQTx7o1wN?=
 =?us-ascii?Q?Cnd0B2+yXMqdkLgFDx0RIhqVYZWsIxJabvQfIfr+vBqEzhZD5FSflsWTXfbc?=
 =?us-ascii?Q?beERhctCy6tP0hjwXkLY8THLB0oCPSrdlPQ/9EYCUAQ/WJ4zJub4uMHC3kMa?=
 =?us-ascii?Q?7JRUM1mLOTu/9ud/ThVh0BspzZWLOABsYmjWodcwkEBXcvc0oDp1xUYUPChd?=
 =?us-ascii?Q?GAiNJf0/D2JzDEWiYGpfb8ZPNFvBc653AOqmqdJpl6JQHA1zOI1BbzenBDKC?=
 =?us-ascii?Q?85UKT63iWw1ax8LBfctVnaMAZgYkDi46WnLxyORvzQf9655XbyNl8aj50ovd?=
 =?us-ascii?Q?Th/tgO5b1Z2S75Be/giAU4cpwBOJE6xRIKWHN7T1C7nUAI7zPa/irgfUuxpl?=
 =?us-ascii?Q?GwSL5t0GmALf9t1J0qI8tbjsdKT9THnB9LJmvfQEp5QznTsmpc5S/hkDHYPe?=
 =?us-ascii?Q?1BBdVV1kR72s5y2g5K36LwasrOd7hpMr8C0bLtV4KRKcNkoSDm/QevmTwZYe?=
 =?us-ascii?Q?la9et1h9HQWs1TqG2zPtD4LfJy/ZM+EblihMqySXHwOvPwgx0J75hgx1SPxU?=
 =?us-ascii?Q?UjkStnQMlWTP88gNT7FSX98k2W+GMez57ye3oyk/LxEzdr3s0NHLu0/gL6pN?=
 =?us-ascii?Q?tDl1BkdDslCtmh/TCSY3FhgaFxQH7kwPXzGMvpPs3qqU7xVXpDRB8JkWrhw2?=
 =?us-ascii?Q?XzO/JFiNS4yEg7ae7g9IvEQYyoVIVWyQk/I/ZewPcACVFpPnHbQIpLnOaVHQ?=
 =?us-ascii?Q?aBBZhuXRZqNmgJeI5dg2jEDdFStKxw5q2AUeE13gQ6kExNuQmGrfHaPNS2zD?=
 =?us-ascii?Q?2D/NS27/CY4/jGi6ompxl8HKMKXKcJb0EP+w8W356jAet4WzI5nEc3BwqpIJ?=
 =?us-ascii?Q?8wzZwoeUs+EiZYO6zWoZKkOJ+wKiLkw9+OnsPyLgRQjEBi7vZQc9rL5seIOS?=
 =?us-ascii?Q?i8SmM8mY70h2DoLNFtewVnHZjLOKbqdv2+gm+1tj8VA1d1fNIUinQKDnqe2r?=
 =?us-ascii?Q?eP8eLjCa5AmRuzsv+iptGFdl7Mejdry3VTYfw/vgeJOnnj0C9owMZ9oLw7rA?=
 =?us-ascii?Q?HsFJAhQwAAWHPp4m3cve9B4ynZnX5ZCtoNV/X7wVXi/oMBf2nYlO5FszNtwj?=
 =?us-ascii?Q?xLC7SzEEGB4SAvjZ1OqnAvzge4sy3DfK/YB6trpD1Uf1sPwtJtsSmjZknO0R?=
 =?us-ascii?Q?RzlhHTnbDWEHOdnv9qywfaF8xSYmfksTliCSHbIKqZikhxmMJUq0wlsMCvo4?=
 =?us-ascii?Q?E6qN73k/wfpicHeQwDpJP/QwhzUTs3YKQbnocK4F9SSx8kRRT8ef0aabrpw7?=
 =?us-ascii?Q?uBhO57z26wCKFObnNOtTnyhMwRpzxeSI+AFkJuehfadk/nfZdb+Y5b3YqCiD?=
 =?us-ascii?Q?34Fyaz+J1pHlHnyMbmMu0QZtN2c2fJe3XIO8R/Vg/hyDAXQWpanKflbz51bJ?=
 =?us-ascii?Q?jBJGV9aSuMAQGm1uLy+YgM0ICvXfl3LHmrhTmvltKZQ0Gks2ATS5zA2lzejC?=
 =?us-ascii?Q?XCWuhA3BYGr14dLll6mwTw+OF/5D+hhKPIzcgL+Xr59SUQKZLmCCqZ0rMu2f?=
 =?us-ascii?Q?TgRAXjFgLA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sg/KVaTrEcTqP59sqfwEJxUdlvhnBiw5iKqCRAhCYgOrpqRD62Az+qlvnu6bFF5fPyZbh5l1kzcw40mjlnsKaXWtns0m9zo1xeVyrQQ3zKHhB/A63FhJVZYxLfuMSZPzurDXZTUqcqCu1ue+rqr4E8giz+JJvoxY41VJvsFECzoawgvLC0ufTt3LydMrvB5UacXEC1cwad30ZROmNPhNRdr2gLod5+yW0XxQQCtWXMmwVeQ3fNi1yXAo3ASK3mV++KtZAFjpFJavTtaB/Bamqg8JbTSwHIrxpEgbJvPLTDb7Nyh5qiWU9iRT0mN/vsKJFJUV6z+8S02UucuxgeWq7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF1611BC49E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5540d389-9300-494f-bc93-08de90788411
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 05:27:21.9065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcT5bRrAlDsP6Wf+8nw2P+lHX6cDfC4O4U+n3eIZzY3tT1HsORtfovKSM0prLUSPbDNDP02sNE27Tpoi2LOaIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
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

> Subject: [PATCH i-g-t 6/7] tests/intel/kms_joiner: Require boundary mode =
for
> basic-max-non-joiner
>=20
> Skip when the returned mode's hdisplay is below the platform's single-pip=
e
> limit.

Add the why? Towards the problem this patch is solving. Makes life a little=
 easier for the reviewer.
What happens if we don't skip ? How was it working previously ?

Other wise I don't see any issue with patch as such

Regards,
Suraj Kandpal

>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_joiner.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> 86226a3ba..765572d98 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -572,6 +572,7 @@ static void test_ultra_joiner(data_t *data, bool
> invalid_pipe, bool two_display,  static void test_basic_max_non_joiner(da=
ta_t
> *data)  {
>  	igt_display_t *display =3D &data->display;
> +	int max_hdisplay =3D intel_get_max_pipe_hdisplay(data->drm_fd);
>  	int count;
>  	enum pipe pipe;
>  	igt_output_t **outputs, *output;
> @@ -597,6 +598,9 @@ static void test_basic_max_non_joiner(data_t *data)
>=20
> 	igt_require(max_non_joiner_mode_found(data->drm_fd,
>  								      output-
> >config.connector,
>=20
> max_dotclock, &mode));
> +				igt_require_f(mode.hdisplay >=3D max_hdisplay,
> +					      "Max non-joiner mode %dx%d
> below single-pipe limit %d\n",
> +					      mode.hdisplay, mode.vdisplay,
> max_hdisplay);
>  				igt_output_override_mode(output, &mode);
>  				igt_info("Appplying mode =3D %dx%d@%d\n",
> mode.hdisplay,
>  					 mode.vdisplay, mode.vrefresh);
> --
> 2.25.1


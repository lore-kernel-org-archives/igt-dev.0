Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E7CFB452
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 18:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071010E3FD;
	Mon,  7 Oct 2024 18:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVffpKIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A335010E3FD
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728326020; x=1759862020;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oDx969w+UJCgNVH7ueojZXKo2BJGNS84scX3C63gcWk=;
 b=YVffpKIE3JOJNJd19S22835yVrQJ5EE+D+JUULlZtijJNufAg96U5zZh
 /F1VQnjNttVsEqUG7Vjcrkb42vG8gdoXUZYMXXrczk+n/7XPZxfrm2tjD
 lOh79arDLAzgYe0vHl4ItN0qbtzOTuQO6mIhwdleFJYol6OL3u9FYKMAD
 4garNMxDKwUAxhdhLTEryEvM91q95IwIL9heU761XvULcxRrCP/xkkP9+
 xLbpZK02I0DGpurdbZSHfi8dthGjWOwkqyo11PrvJnkQ9Obw9isJWyRVd
 sv3VK9sEggc01s4q/B+Sp+UDEnWmzE7IpTj8dXqiKZP53zbueXpMSfPXa g==;
X-CSE-ConnectionGUID: PTbGUH7kTPuOjUk19GWfEw==
X-CSE-MsgGUID: j4bEhaIsR5m/k5J3msKZ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="26984239"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="26984239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 11:33:40 -0700
X-CSE-ConnectionGUID: j4JEKAVkQz6WOccz+s+eQg==
X-CSE-MsgGUID: vg2U6e9PQF6H2jtMVB7uPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75522300"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 11:33:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 11:33:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 11:33:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 11:33:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 11:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbpIXvptlwJy9F3bM1jYcXS8OJMtcH4JGMUAM+WNgVzZmnND0GpviVVV8Rb8QeKaGej2b1AlV8G6SMKGY+UoBntBP17ulnFRNSALa7VfmvtJiImWyJxJmhPyweZ9uljJmkFkuhl5ffcN8ALCHZgQYKlqDJK/B3EQnd5Y1IQJJGJhiUKKms2VBxTFeG2/wftqKzvFgSK+o7twJ255N3OQMOvv6iuYT1un5b9QSoV1oOG0461rOfo1l41UrAGAcK2jSLT8Em8QGa4K5Uj+ks5tLLRJ3rnIbg3ummRqOsjR9RtMRSazU6BgBGAAm+CT7UHJzROUnZ5rqV38KOXPmmvM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpx2UIChrCvhbGOvSeoe9ky3nc0YUfVWisKsFm2gJ1k=;
 b=Y4DjcOat7lzVXO2U1dmMWExXBDdqtrebeppkjEn18aOn2aQ413/LXNjRyV+mLM60tnmFvk1qhPdwyZEH0jI1ibPYnhsgDEP3rIadf8OhiCsjzXGHkto8wJx9vF2cwmr0HuTRNfkE+fKPYNzSkbgeUBtqYw5uD+Rj8bsc0XLqq61QfbXVf8nwQdXg2QuHljL6oXn1SbseX81Fp7JOaQuUWDx5Ld9eit2yo6vFjev04tkpFpbTYxPcIhZrYt1FOksCK+PjENXaw0v6/Tehy0z5Avrjrw+DTwvBt9zF5l9QHs/evaZ3e41/SJ1GDQ7NWkayRsCMDid5rxiNT0OjaTiAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Mon, 7 Oct
 2024 18:33:28 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 18:33:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Print engine name
 on error
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Print engine
 name on error
Thread-Index: AQHbGLvrExMOGaQY30qixYPvPMUckbJ7WF2Q
Date: Mon, 7 Oct 2024 18:33:27 +0000
Message-ID: <BL1PR11MB54455F001BD2C2A034EF454CE57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241007123208.3441829-1-nirmoy.das@intel.com>
In-Reply-To: <20241007123208.3441829-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|PH7PR11MB7986:EE_
x-ms-office365-filtering-correlation-id: 2069e9b9-177e-4619-6e5f-08dce6fe8922
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?542ka94ncoWFujJNPthMQDm2FzXa/ap5SD9o5OqWBTfnLzGGH6gKFR2C9Yfx?=
 =?us-ascii?Q?aWggJPMiQLseeAhgyj6qJdnZXCskyar4XsF0NHgPONtYMRhsCzLhZJf6aWka?=
 =?us-ascii?Q?a+eoJWMypXpEXBOfqFbSGaFYpYQKlbB8sK81J3Jq17YgzR2Pzf9LEEnKeGnt?=
 =?us-ascii?Q?C1KRqGZt4PAlt1Ql+c9W3UHOBfIWYW/j/doImr1xCjEsnJYPWd/QYfxF4Suc?=
 =?us-ascii?Q?tbiSpUs8r5tqsBNg4bYb+24MRRQlgc7KO8tAYQlAQ89vfYYPCngjxtYNJUcU?=
 =?us-ascii?Q?7yOXfmv+l/7V9MuGQ8iSKW1hEM1iE8twB3jqQnGNk54G4zEFsyrVtS2WQOjl?=
 =?us-ascii?Q?OWbdgvEpfP+rgtH+GRSveNjIQDiHB2uQb72sMSZP/xB8ziB1vyDAtkLtzEiV?=
 =?us-ascii?Q?7DImhIbY6p2rLsXRkQetGVebVRordFIRINb5lwCxvU7QS/aF3o6G5LJm+AB9?=
 =?us-ascii?Q?OzT2VNQ1Jz3MagFw4xSiHkMx6XwCS5DVWQE/z1UbuPJxyb6W7U0+xAHXY3SD?=
 =?us-ascii?Q?Iq8aUeQl21wVOOj/OMfq6JKrMDVA9aMH9gyGSYwYCbfe+9LYKhIrrGzwpKx4?=
 =?us-ascii?Q?MrK5SOU6fxiOiwPwJGVw7QfHoX7/v0UdFmljP63AoHF08Fb7ku04lPv0hlDO?=
 =?us-ascii?Q?wQHa1Q4x2RpRkYwPInZ2JH1JrOAsV8L8i8EjGWN6gA+1nb5Hhc6uFZ086fCH?=
 =?us-ascii?Q?J+nAh2ADvF9CJYdcRIP9Pqf8assJPFwhwEAsYPTKRTM1oRR+SgCdl4BsjZOy?=
 =?us-ascii?Q?YaNNERurCi1YSklnXG4y5uthwJcpjnQ6OhZa+rGY+cyxmiRTGTYB5+G1t6N1?=
 =?us-ascii?Q?3vuojwtNkfjz6py9swqBkeKI1j+liKbHwkbaDOsPYS5eMjC4zeo7NHj7eK+I?=
 =?us-ascii?Q?P3zNqGiIjyowzsgYTbI+hy/CPPU5nUftp/6zjymC0dvZ+x10Plo7CCFxhvn2?=
 =?us-ascii?Q?EXAUAdwNNIg/Gzf3OFhbKU7ZNAMa9ayazHbvtKUqacAkAmE3lj7G1h9o/ue5?=
 =?us-ascii?Q?yKlS0Rha7SN5FRorVheMeh1Z1ZYcmxf6Hln9ppaYmnFPqNwxZkyOUcGrJvLA?=
 =?us-ascii?Q?pzgpq5ua2m94KK67tTSjz9tXEKLTrpwYXXJ9rsd2jJ444cL3sSeJtearGF9P?=
 =?us-ascii?Q?vWkKZZ8pAwKGed7SAM05tp2ABx3+tlUE07ghL4j4cVl6PmGwlhy5uDOTtOUt?=
 =?us-ascii?Q?ZWVxhAQSqXd+TI8Sk7yx7vuZApHU8MhnMF8+gG4XaXej9y2xmMS4wtuKpjxc?=
 =?us-ascii?Q?ssGk47fSfBuEoIyCq4fkwELGt8z22kuvVUJaQWtnMLf0nAZLbJoElrTjNrk7?=
 =?us-ascii?Q?SWxR6UxBJjEkpgNncJpEALbpM9MEMeq3mCAA7LUP12q5Yw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q9/iCnn6yMB3TFEhIY+KfZOfp3jUAuOUsWrQl4fZbaI6N8+egCSB6TFl3+yO?=
 =?us-ascii?Q?swbHFJkgqeJDDPoWN3g0/VBtzHmS2tleseG8CpFR0QLEoYhYSj9LrnA/hpaK?=
 =?us-ascii?Q?+eh9ZDWJkdQYBF/WTLa8SZGvKOp1tem2bqH1K4SemM3m1VgfKJlvfPg2xwA9?=
 =?us-ascii?Q?9bp1Udh4VLVLk0p55Bb0oVfnXpxaY+2GwO5NjOvI9qPymGd7Mfghw5wMrIWb?=
 =?us-ascii?Q?DgqeWdQyGWTDI9gKsoX4l3rFxXDWfvfRo5/vocbSQDKv87qhNL3g9Q1zuFHI?=
 =?us-ascii?Q?B+ulmZdTsZDxKdbhRqcjxr0yHS0eNcnUnQNamokq6z5iYmURhbZf6tydMn3H?=
 =?us-ascii?Q?l9FoQ7D1EEfDs3zaJtBHyHWlzGhQ71Y1oIFzPpYNkaq1HnwxQAogDrIx/vl0?=
 =?us-ascii?Q?QRq+U+2WzkOOOkd/uaKPW1LJC7ROolMpBphLChofe3d7Hlmcc603H2+U436r?=
 =?us-ascii?Q?LIXKM+0kUSHhPRfrEfla97tTT7SNaLsqm5nP8s6AwoVV4fjG5L3nzR808UgF?=
 =?us-ascii?Q?FLFG8s/490eEu5jgA1qpr9u4Kso/t+sOHStM0y4yQRwlMddL3UnxTXbg0lMu?=
 =?us-ascii?Q?A9xfzMNxNG0H22kkKeTTj/FUxFX0ZtmDyQSoaWVX/xOg/Db/3mobKV9Gwn0P?=
 =?us-ascii?Q?Ygz/DPzXM/0n0m6NQq9v8pfOJ630hipaDNl5gGXMscgTldBuQUzV4PUu60f4?=
 =?us-ascii?Q?ZHLaAIcjvT95I/3r5/KCwgFS8D9qqj+YlGoKAzJTQwkWLCyvYLPapsIiDpCd?=
 =?us-ascii?Q?qRJwEbVfmMh/Pre64PFD7Giq0La2ck+gg032O/0J+ZZN0jlmJrYIv5c9sMno?=
 =?us-ascii?Q?MYUJYSx5MRZEmz8afwqjMx8W+t+AtEx5ycIuiwsZSFTTwHK3bQ/FFyObPsjt?=
 =?us-ascii?Q?tvtBQBMWqCfmZwGPj2YAj5iW6yM+K8TQgDy3IfapG1LSrm4kfOuKkTyWCdKB?=
 =?us-ascii?Q?YZrVUIdyhsfDJNFJtWo22yCc9dws10vi0Y807Mt07veXhwKYz3GWufBLbZ8s?=
 =?us-ascii?Q?d03z3olB9yzEB3FZ7uT+dd1HIEV8sfkpNPLuL58x8qfDqhDOBrKgjf8Iyhbb?=
 =?us-ascii?Q?LMn6QspKY1eX99+BsBm3hP/HojgrXPSiD1zGGAsNKBXZC11pDijxz1QCUH48?=
 =?us-ascii?Q?qhf/B9wR+C5SSb0JYjIvA8yDnM71U8K3l0A0pV918sNgONetX1kGWAO+Dk4N?=
 =?us-ascii?Q?UZcw7LsLxysc+wP5ZZY3txhCP7yfymvhicuiYeKRT/8DSDz3xrRnkTNw5aFX?=
 =?us-ascii?Q?kzvqwn+TXY2eq/7XXZBm5C7VmHhvsIwxN3lzS1GH4jfAcXaOn0nMlCLq5y0Y?=
 =?us-ascii?Q?G2lYnwcWtiABSLeNyqm8ah+CAMNFAhOD+eTyEzGp3UVhPLwjnxxj+rC9lYZq?=
 =?us-ascii?Q?ki48Wxz23r2Uyyzpw5mPvGqCaD98gvDCjKjrJCJdvWwmYW8r5AYnlw7zmcNP?=
 =?us-ascii?Q?WUDonqprXv+WXYn6k61cymNaqu6zjlK/3R98mp7rsxXQDTLV7/RSsKAGGqSP?=
 =?us-ascii?Q?FggYL4gVee1UIFLtLgPWUff5rlhHfx1Dp28TwS85+uv4cyudiuWcLb0zwSwK?=
 =?us-ascii?Q?kiHsGDJKcCin5gBlO3bkdLCGrEu23dnkfRiL0hFp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2069e9b9-177e-4619-6e5f-08dce6fe8922
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 18:33:27.6059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOQkMTjrcfBzGsLYhQzcEI7bysDYEcU6M2BwESow77Nt0E28hOkDbG7UOEsVewmZQfqBrWB3CgVV8bTrjZcYpaYRqMI9q6OZC9IQlPLncQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nirmoy D=
as
Sent: Monday, October 7, 2024 5:32 AM
To: igt-dev@lists.freedesktop.org
Cc: Das, Nirmoy <nirmoy.das@intel.com>; Kamil Konieczny <kamil.konieczny@li=
nux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Print engine name =
on error
>=20
> Print engine name on error for debugging.
>=20
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

LGTM.  All tests that run using test_exec are run through xe_for_each_engin=
e,
and no other tests in xe_exec_compute_mode do so, so this is comprehensive.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_exec_compute_mode.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_com=
pute_mode.c
> index 7d434f798..82e607848 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -122,6 +122,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance=
 *eci,
>  	int64_t fence_timeout;
>  	void *dummy;
> =20
> +	igt_debug("%s running on: %s\n", __func__, xe_engine_class_string(eci->=
engine_class));
>  	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> =20
>  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> --=20
> 2.46.0
>=20
>=20

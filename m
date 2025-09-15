Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59424CAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 12:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0689910E47B;
	Mon, 15 Sep 2025 12:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2C9GGn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E8410E47B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 12:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757939362; x=1789475362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=lTuS8tI2AbZ6NUbNPNbsIfqNOkRanzPN5/+q1p0JCds=;
 b=e2C9GGn6TLnqJwYnPK8wEK01AY7B8Q0MTXXSQ7EhwCfP/fDEzn9XFOHg
 vbe0AIvlM3/1P+YB33oz8rpHnWQCI1uUifcR053rs22SlkDWOyHRkxxGe
 rScOQC0OqWP4tW5I4BEehyx0v8ekIQBN2xERROGp6xoHMbBQJeKEmel+j
 lDzXOayJemypXEuuVqR60JsibmI9ym0FHOFMcTZNvQVmoHJPFMNqcwgMa
 8vdhc5h8BfYbpQsOSDTPRUTcx2PTCbYnTgC//lvEeoYNY2WJpQz1RR5eD
 waZAJBCwDePRmb4mbVkRiHkTcneqYS6ydZ/KpKOCWyoejbIblmNKfs5zZ Q==;
X-CSE-ConnectionGUID: aKFko2W/RUOo9ztnc/RLlg==
X-CSE-MsgGUID: z7URUB70TCyHhZPzH+9QfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60257311"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208,217";a="60257311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:29:21 -0700
X-CSE-ConnectionGUID: Lzvt3DmjQk+3dKJyjY4DoA==
X-CSE-MsgGUID: BnmbbqhmQAyqFF+uvwNj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
 d="scan'208,217";a="178933996"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:29:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:29:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 05:29:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:29:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZqD+0oU57C15SLJ70ZgFYwBB6SikFcBNRqxu6vU8rDH04dA9YtzXNSjp57RqWWzWSOtFfPJ5Jk7J5tYxl5pvedeBHlqYknGSA+FGDc+tFvqclMALv2w52LA/7skHu5bpHT+OIcZYfKj4D2AIkl8xBfkLwY1wZkuQ7m7xcfutOBYWukrVABrbArbyHyLiDGr0DUKtEa3dTYJEnO1s9x56lNx1I7ow9s8JJXZRnfJCL5vFsVBqb93YYE3Z4zgsV9k2tWm3Jv+UyYPSF2wQ7VYXjgfLuT8VKrpiD1un+n1Ro+Z+UvXpIcfWBYMjY9ycTQAR8daQTWpd6OBeOKo7FwEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2UH5+D3J2nq7cf6GD5OrM3PSqp2RJJEdWbmUseGRjY=;
 b=e58LbbcXvdP4LvY8yFNmRs3cr4GMAZMppLdNekwMbPLa4coLH1OBKfULEaU5deC8cRyVZ5iOkbzxDVtNZfZL8op1yoXuxCHZlI4TCl9z948QEQLrRIkxgYZjhsJRn4FeXTknzJ1BwpUnzfINfbjRPByKQ0d6hB58n2DoJWQBczY0MINJh9sf/AifRLal2xQ/fV9/5tf/2pWczF2dUMiKsrYK2Q4H5y+Uwo5qPGPlUaBGhyPo4RwyFiNXZJYu1aqw2MhXOzQdzCI79T+8wCtdyByDK0pmHzs1/IDRA0tC9tkxiLi8fx+jEYwTgRRG6NCq/Osivilbt1dveqptgyOBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 12:29:17 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:29:17 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/kms_concurrent: Add SYSVIPC support
 check
Thread-Topic: [PATCH i-g-t v2 1/1] tests/kms_concurrent: Add SYSVIPC support
 check
Thread-Index: AQHcJhQT4CsJwjVzBEKcsZj2Pw7s7LSUKduAgAAAOo0=
Date: Mon, 15 Sep 2025 12:29:17 +0000
Message-ID: <CH0PR11MB5427A38455F28378A8AEDF169815A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20250915073231.2093842-1-s.sebinraj@intel.com>
 <20250915073231.2093842-2-s.sebinraj@intel.com>
 <20250915121939.oit6d67hvu44hpar@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250915121939.oit6d67hvu44hpar@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|PH0PR11MB5094:EE_
x-ms-office365-filtering-correlation-id: 1cd4b4c4-532a-4b65-3a0d-08ddf4537d3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|8096899003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cLX4INkOC8dRbswwg7sIqeh7RVrgqoTKVEF5mDZQtlqMixMzLneWM2tBUGs5?=
 =?us-ascii?Q?mCdVDjnBwWrFBAhmY96IX88VUP+Wonr94ckrj8bAx7Kg+iOjzHMXGZSLJdA+?=
 =?us-ascii?Q?wjWV1B1OQzKPfzlL/KVR7RsPzTki4dTnwEyE48mUAxLg1Ob3UWhebBG3tThU?=
 =?us-ascii?Q?f5l2Pt/DbMvLWtZTd5d7LXQ9aCLXm2LZOP56zlIt2ftXF8innVm1qXFQsdSS?=
 =?us-ascii?Q?hw7lxb57SjJHtV+PFPAwahmaghpd6pDyzCm1QdRE1DkqXPUjFBZIiAE2dJPa?=
 =?us-ascii?Q?aXWjesf792TEQnt4Bynr9UYcVSEaQKVKpbRE8TXpG592D3vok+fe6ZtqaAdU?=
 =?us-ascii?Q?6N5kEHiwsliJX1gzSnzDsqHl6qIjCcuR1d4lp1bQt83pDI2DBtZI8t6RTf5m?=
 =?us-ascii?Q?sWLFE18gqsdPgr7ygU+glfl5CTcTeb2TE+p73j67zusUA3KcDsjDcAA1jOGM?=
 =?us-ascii?Q?2cHEFHT40wqvRQDXRCv0YJNZldMVOBXpFzr96Yb2HBQ1NVo5YcQOmNjv8jqE?=
 =?us-ascii?Q?YcgxAi744VqmwHgDDSIMoAlxBf5XExYXUF0dqi8XYFFQMAWAqOLulO1W9u+e?=
 =?us-ascii?Q?TGXmH1KuS2t/rh1srXZsyRkfFbFKuXTR0XGlwlQvXkqFqUEuRyrVlEeNrx0+?=
 =?us-ascii?Q?iauvh207iWfZK0NziXPkfdfmbeWYuJgWp+p5N6hAaXaV7SRFgoKoyDUbRxyW?=
 =?us-ascii?Q?GWuNBjBwk3QhQTkwFNkMpcG+puYMCkds/vIiBocRUE58SQ+XMcDsE54bMy8C?=
 =?us-ascii?Q?eZjB3bH1iCGEVKuR8UwcVlXBNia3Lb4ObT+9HxpgPECzmEYWUy57CSMuXd8e?=
 =?us-ascii?Q?XC749kkvrwbRjdGIJ4frg1ABP2FNrEOPnTrI8ZeFNW3xz4Fsqh68tusYg3NS?=
 =?us-ascii?Q?IoZJXzLzWkBsGLclr9uKgg90A6Ggw2sKpTXRVgz1jdC9USYIP1oh7iYKNa3r?=
 =?us-ascii?Q?AUFfQQgzPX9qxw8/cnFs52/X5ZWsAEwtJ1EpUs4k6tuv/dbOmdSqufrVlzcU?=
 =?us-ascii?Q?xZB8BFHQI/xG0ZeXfjyCir8MOfpflE9Y4Z6T/xAqEqjeXIw5hZDDk4WeW8Mk?=
 =?us-ascii?Q?/aCu1z+khcZv4xVQEytSAVnSvX9TeCF3g85dOPGKCIhwpINu4pU+I3nytYRG?=
 =?us-ascii?Q?35E0ri+cYNOJ1qKOrwowAiFt7UtSMkpcNnBQFngKVuK601A3dUAavw3p4Ipn?=
 =?us-ascii?Q?rwx5DFBpXsxDrIw9j4VRK4Uw12GlocPUStVRjWnukX47GxmwMSui7ndejqVc?=
 =?us-ascii?Q?sFxffsxnKFxO+yudNnMZuNDocQmYHTvByykSPBHWiQLSp256woxU5ZqWQqBt?=
 =?us-ascii?Q?6rmV2685LKT6OqXU/PjqCFNXGXAAvO1Cl+c4Dx+vobJL96VcEBLQscj/jwgo?=
 =?us-ascii?Q?I8ysrhRnInrU2NrDAsDA5Fq2q5PIIVsMBD206shE6Pnvw7TS3QhFR6bjZnRN?=
 =?us-ascii?Q?6yVZh7sp0jdx6Y36K7ZQQZkAJ9LkNDJBEnDCjrIZyBzThhFMmCouoSyWxBkf?=
 =?us-ascii?Q?x2cg/0QgUXLj9Vc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(8096899003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tiieg2s+Lv2UNpozcW/BQ6EnmzoSIVJo0okaqDKU8V+9BbrqAiEBuSjIP+6I?=
 =?us-ascii?Q?bVM2R0hzU9l25B9fi4HGaHEY4TSE6tHwbp8XqeGe4zYKBzZpOwlcNTDKwWoV?=
 =?us-ascii?Q?rgSjA9pakasFHl50WIdZZZBMXGXNoTHemprKabXksq/cDKS5LgzlefF9QaMI?=
 =?us-ascii?Q?9eqFDnEA5ajQyTOyliXbFA+PzGYdGnjTP6+vS6gguTF8DeZJ2VXyN+dtyukV?=
 =?us-ascii?Q?fIg2b7tZ2k6SfcIX7Ai3vw0hMdO4fXanC7J7c8/OCfCpofb6NA0npP/pCdlF?=
 =?us-ascii?Q?H7XjJWW6/N3NANu5rTgQarHXc9bRMaIfuTPq9oFxdIrnSpk6dhXlWVAxwtw9?=
 =?us-ascii?Q?bGN//6bmZ4G4XtLFu6F3ljzVpBA0FfBwQ8ThxIP6gdjgIU0mHs0RVUIbgd7s?=
 =?us-ascii?Q?xQMCPv7NqYG8WnBYUD7346gzNtC6HLIZ2rk4ql/lagaxUL5tj8e18Faf7YCu?=
 =?us-ascii?Q?eGubuU24om/v36ZJg/TpUIrX0s4sZTMC0Ix5AcdQW79tev7D9nrRGkWkZPRl?=
 =?us-ascii?Q?IFXatfPjb6nm7TaRsrnF7+IXWqMJ5nwuYgiIsIn5vR87ketxJNyHF6oahbPf?=
 =?us-ascii?Q?ljVuU0TbZzgxmnz8SkhgpgmRL0VLjVV85xGQ/8subOX8Jk1Ka9VbTTcKlCQf?=
 =?us-ascii?Q?nc5J4zUXd/Wfl90XuGPIWLRO8jjmKF89Jn3IHRR1qRJST5NCQ6a4BQWNJN+d?=
 =?us-ascii?Q?o+IF1vqmeqgv/2aSS8VOXBGcHhCmHXhuLrzx+ulwY9zTjvaOOHgaDiHAh6lH?=
 =?us-ascii?Q?2kVUnjAnZFfaCjcO4CwYH5fpzeBEBU23UZqBYKZMaE6RCeEQjeaWbhlnglf8?=
 =?us-ascii?Q?c5JZO1I401GnuHOYAM2WfgdFSjaaf5DppLskd7wCYii1frkk5Mv8ZFMajGia?=
 =?us-ascii?Q?qBiw348qIjG0PIiBO5dskyMz3AWbtKXRuB6GZecS3ecROx5FfC9nZMPNZnsB?=
 =?us-ascii?Q?51cCznII/5WpDuJwqdtXE3kHNdSqnWsDDUIMhAUPUugA249f2g1Fx+XWxaji?=
 =?us-ascii?Q?jcYMloD52KLP+Nm9HKn29eBdP/morPYbCu+ex2gLrW0/WJzwWUdnPyr4OVxd?=
 =?us-ascii?Q?eQi1UapFNpLwou9oTRWvd8HDN/ncVAImF5QSnnZqzgXPzfMjgWxIcFpqjreo?=
 =?us-ascii?Q?Cir7w/5ZtYi3/Ympxsj0DcJ2ZUVfW1Lk/naPR/+DuEmg5CZkJrR7N+2uTAaq?=
 =?us-ascii?Q?BdFLcDmcHMyDG95flJKATTp5+oZqPbscEoBqkf0+ZzB7ooRPH9ZgeJmbg2m/?=
 =?us-ascii?Q?gBBjas9QY6+jmJpSczgLqzzJjuRTCGFU0en5iTdnv2jzVaN/rbUsK6BSSiBC?=
 =?us-ascii?Q?wSi9Ml7p6j0UIPzEypI4oYoaZkYr7Xvrffotkbi8MrgFZWxYXNgRugana4Qd?=
 =?us-ascii?Q?7uH7aDWo+1rQ2BZHKmETgl0Bp9jAoOtj1FYQLaDllOXi7Tz61G03nmJVLlp0?=
 =?us-ascii?Q?Gv7MI2uBt9pvTNtQ2o/ES1fpgB/xulhZ2OU8pqYIBertCCDfNVQb6/takwan?=
 =?us-ascii?Q?GLGKZvU7AK/RkU6Gxf3Jtk9/dHaRQXCa1yCfvKqgn+nDVMsgaZ2QnRqulfvS?=
 =?us-ascii?Q?2ZHXVHFJz5fR3Wy2/CFRM2vCe9eQfvaRD6JgVGRbzxgEAxo+sSg24qI3xHwU?=
 =?us-ascii?Q?wQIbjFwnNfUO0AQiAvNtJxJGA/iTbMtMyq/Nd/hIVYDqUn4jCKidSiNBb2B1?=
 =?us-ascii?Q?fawAnA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427A38455F28378A8AEDF169815ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd4b4c4-532a-4b65-3a0d-08ddf4537d3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 12:29:17.6131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVuTuR94cnycaItgeBFAJLSJeR/5XiRuAV8+sw4cceC+cyHxIcAO9fosqMcSyq0wnT2hNyKWg8ScXBiM9b644w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

--_000_CH0PR11MB5427A38455F28378A8AEDF169815ACH0PR11MB5427namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




Hi S,
On 2025-09-15 at 13:02:31 +0530, S Sebinraj wrote:
> Check for System V IPC support in kms_concurrent test to handle
> targets that don't have SYSVIPC enabled in their kernel. Without this
> check, the test would fail with assertion errors when trying to use
> message queues.
>
> The implementation checks if the target supports IPC,
> if not found it skips the test.

>Sorry, I replied to your v1 twice. I do see error log
>in cover letter but I want to also know on which GPU (or GPUs)
>and what board (or boards) do you see those errors.

>If this is on non-Intel GPUs than a better solution would
>be to disable sysvipc functionality in igt_core, that in turn
>will allow to run kms tests.

This being tested against Intel Xe (GPU), (OS)Android, (Target) PTL

>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  lib/igt_core.h         |  2 ++
>  tests/kms_concurrent.c | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 6f462205f..413e83bc8 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -45,6 +45,8 @@
>  #include <getopt.h>
>  #include <unistd.h>
>
> +bool device_supports_sysvipc(void);
> +

>Still wrong place, move after all #include directives.

>Regards,
>Kamil

I'll correct these. Seems the newer revision didn't get applied properly fr=
om my end.

>  #ifdef __FreeBSD__
>  #include "igt_freebsd.h"
>  #endif
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4f16f8b89..80512a140 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -107,6 +107,22 @@ static void test_fini(data_t *data, enum pipe pipe, =
int n_planes,
>        data->fb =3D NULL;
>  }
>
> +/**
> + * Checks if the current device supports SYSVIPC by verifying the existe=
nce and accessibility
> + * of the /proc/sysvipc directory.
> + * Returns: true if accessible for read and write, false otherwise.
> + */
> +bool device_supports_sysvipc(void)
> +{
> +     char path[128] =3D {'\0'};
> +
> +     snprintf(path, sizeof(path), "/proc/sysvipc");
> +     if (access(path, R_OK | W_OK) =3D=3D 0)
> +             return true;
> +
> +     return false;
> +}
> +
>  static void
>  create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
>                            int *rect_x, int *rect_y,
> @@ -395,6 +411,8 @@ igt_main_args("", long_options, help_str, opt_handler=
, NULL)
>                igt_display_require(&data.display, data.drm_fd);
>                igt_require(data.display.is_atomic);
>                igt_display_require_output(&data.display);
> +             igt_require(device_supports_sysvipc());
> +
>                if (is_intel_device(data.drm_fd))
>                        intel_allocator_multiprocess_start();
>        }
> --
> 2.34.1
>

--_000_CH0PR11MB5427A38455F28378A8AEDF169815ACH0PR11MB5427namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system=
, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;">Hi S,<br>
On 2025-09-15 at 13:02:31 +0530, S Sebinraj wrote:<br>
&gt; Check for System V IPC support in kms_concurrent test to handle<br>
&gt; targets that don't have SYSVIPC enabled in their kernel. Without this<=
br>
&gt; check, the test would fail with assertion errors when trying to use<br=
>
&gt; message queues.<br>
&gt;<br>
&gt; The implementation checks if the target supports IPC,<br>
&gt; if not found it skips the test.<br>
<br>
&gt;Sorry, I replied to your v1 twice. I do see error log<br>
&gt;in cover letter but I want to also know on which GPU (or GPUs)<br>
&gt;and what board (or boards) do you see those errors.<br>
<br>
&gt;If this is on non-Intel GPUs than a better solution would<br>
&gt;be to disable sysvipc functionality in igt_core, that in turn<br>
&gt;will allow to run kms tests.</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">This being tested again=
st Intel Xe (GPU), (OS)Android, (Target) PTL<br>
<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; lib/igt_core.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
&nbsp; 2 ++<br>
&gt;&nbsp; tests/kms_concurrent.c | 18 ++++++++++++++++++<br>
&gt;&nbsp; 2 files changed, 20 insertions(+)<br>
&gt;<br>
&gt; diff --git a/lib/igt_core.h b/lib/igt_core.h<br>
&gt; index 6f462205f..413e83bc8 100644<br>
&gt; --- a/lib/igt_core.h<br>
&gt; +++ b/lib/igt_core.h<br>
&gt; @@ -45,6 +45,8 @@<br>
&gt;&nbsp; #include &lt;getopt.h&gt;<br>
&gt;&nbsp; #include &lt;unistd.h&gt;<br>
&gt;&nbsp;<br>
&gt; +bool device_supports_sysvipc(void);<br>
&gt; +<br>
<br>
&gt;Still wrong place, move after all #include directives.<br>
<br>
&gt;Regards,<br>
&gt;Kamil</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;">I'll correc=
t these. Seems the newer revision didn't get applied properly from my end.<=
br>
<br>
&gt;&nbsp; #ifdef __FreeBSD__<br>
&gt;&nbsp; #include &quot;igt_freebsd.h&quot;<br>
&gt;&nbsp; #endif<br>
&gt; diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c<br>
&gt; index 4f16f8b89..80512a140 100644<br>
&gt; --- a/tests/kms_concurrent.c<br>
&gt; +++ b/tests/kms_concurrent.c<br>
&gt; @@ -107,6 +107,22 @@ static void test_fini(data_t *data, enum pipe pip=
e, int n_planes,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;fb =3D NULL;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +/**<br>
&gt; + * Checks if the current device supports SYSVIPC by verifying the exi=
stence and accessibility<br>
&gt; + * of the /proc/sysvipc directory.<br>
&gt; + * Returns: true if accessible for read and write, false otherwise.<b=
r>
&gt; + */<br>
&gt; +bool device_supports_sysvipc(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[128] =3D {'\0'};<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &quot;/proc/sys=
vipc&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (access(path, R_OK | W_OK) =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static void<br>
&gt;&nbsp; create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; int *rect_x, int *rect_y,<br>
&gt; @@ -395,6 +411,8 @@ igt_main_args(&quot;&quot;, long_options, help_str=
, opt_handler, NULL)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_display_require(&amp;data.display, data.drm_fd);<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_require(data.display.is_atomic);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_display_require_output(&amp;data.display);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(device_supports_sysvipc());<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (is_intel_device(data.drm_fd))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_a=
llocator_multiprocess_start();<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</div>
</div>
</div>
</body>
</html>

--_000_CH0PR11MB5427A38455F28378A8AEDF169815ACH0PR11MB5427namp_--

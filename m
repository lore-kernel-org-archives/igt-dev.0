Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A35F94CB2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 05:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A624B10EEC6;
	Wed, 22 Apr 2026 05:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2+v0byc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5F10EEA8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 05:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776834971; x=1808370971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=jLiF1NId6QblUoWW6fSZ1+nQng37rESqAA8WawQqxsU=;
 b=c2+v0bycYBWTT7A4alyimukbXh0yQAls4+3H5H+dVX7ihnqroSUjZL66
 I9Yja/luHD1cdkLNBuFvbAcJNpmPFSAYkWMmyIfjLaAZ83YvMzUKX96go
 AretYbh3UrqIz6PmXC/HrnMuSTEX7eiB8MhXHH3+A7gor6FmRcInpHnro
 yHnu3eBq9PD95oiurn+qU6NjbD0OgOaxJ3cM427tW0ORtO8TgX6YMohCj
 iAEfExNj+hxqJeO5E+bVb9ARBEfhzowB+RKeehSwAgKrnQwNtPpkooRdb
 6Y8Adg3CsPZ8cEVD5aAxMtUcIbS22f9JuQWYBLYF7Q9CEKM5h3cIwEvfl A==;
X-CSE-ConnectionGUID: h9FHCrJ5TVOVR4aghwfv1g==
X-CSE-MsgGUID: LBFD4NuWSDaDct/qZItwcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="103241446"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
 d="scan'208,217";a="103241446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 22:16:10 -0700
X-CSE-ConnectionGUID: 5OwiKYa0Q6+ik95ykr/uLA==
X-CSE-MsgGUID: YEkRmIB+RfKl8ienUzQsuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
 d="scan'208,217";a="236254011"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 22:16:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 22:16:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 22:16:09 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 22:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yzuh1TQ4QAIfGF/NO+8D4qSnDb99ArMieQakyUJ9iRsbNA71mN5aWow4KxCnTpRHqPMrJqWam+xGvaGuATHmNtm2sbB93tvSydrtr4ogDfcE6I3TqkJvsrmgjbGPhbGLA2MpSrfojBv6vtup7P1YwnrZFLeSlKJ0vK5DYxld6WUJCHUUTUEc0tgH1iV6AKeyvVnDAt7c0AYOcJz6nwhDKDJAChnBELtoWgcdsVFZBHkgLGq725QPA0s0eEvbuOPfZwHsrN1ldUFtATAUp9QVJXN0PxPZDiCHW6IZ1nFhZ8FOj/Jk7mnGQth/OjpS8+49KqL2sJ6sqrRHB36wFjYUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rb49Wgxh9aObRbhxJyzkSChfVXxFoeRPywUsG7xNPM=;
 b=g3I8nQUXJ+VK9+WVdw+hYTuPAo2q53OGiB8Pdb+Kf4HfSBwpMgCebdbY0A7H8nRMnan4rvIElHwHiNrd32HfSHl02nq44GC/1u8ayV+Ci7eYoCbZGRxr0f99Kvl3sXKFiSJwSVCwP7/TGoYeG88+aj8UnDeimTTdZ2kINOnpXaUdRE+xIBxQjCF6zn/rFMqPvXtngby0lrvdxF74RIqO6bHyNBno1ezcgJka9VW0X+fKnPf/Z2PjrIeMYRWIGvU7mFr2giISYRXN8GhIfxFUznOUTOlJrq82Rgrp1uWsQH9PgtXHgK6GbKhK62wnDbQky7t2b4eiyAqaUKTNnwAIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 05:16:06 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 05:16:06 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Thread-Topic: [PATCH i-g-t] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Thread-Index: AQHczmTHHo887JliYEycJGSj15l16bXnoI+AgALkFi4=
Date: Wed, 22 Apr 2026 05:16:06 +0000
Message-ID: <CH0PR11MB54277E9BA6D35882663CD2E1982D2@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260417120135.3100557-1-s.sebinraj@intel.com>
 <lhy2kwpdc63zebuz7amvzizowa42qvhvijxbuepfayydzdke6a@ofkhenu5cppg>
In-Reply-To: <lhy2kwpdc63zebuz7amvzizowa42qvhvijxbuepfayydzdke6a@ofkhenu5cppg>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|LV3PR11MB8696:EE_
x-ms-office365-filtering-correlation-id: e78c4300-eb2a-4cd4-3533-08dea02e41a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|8096899003|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: qAHE1UQCvRzoSN/UD4tkc5914FONeAbn4jLUi1ZjP2PLBpN7AMvGbZmRpdrlh6beegmsjdo6qw304eUPEr9Ka6YgjjFG8ecjHymLQeGgKhyv+3KhyTbgWx+WjcefVJYQ1THGQ8BSa6UG7GtZxpg2IeVVUGcd5KXSTIVkrfvwf/iOHydoiJSkpFQpSYnPOVRcNdw2JYuXHolwYASHha3Gzez5QyFh9iOirdMKVV/C/puHmjFCuYCSk7sDBQBcGo6wnkfCN4PqBoW9UrZQNEwXkkC+u7jK3IPh6vB6nyyn/wNpcjeFRoH91BKfbLA2QNh4PD0IaN63ut0iqJv5QKhRlA5CwGDXRzNhGxBnFr91kl9mZdxrEwLppXt4xMQ7vBzzynv8CvgjnjVOigKmwxkkT/exdLEMOyQw1wr74zGnJx2NlzwJvti3jm2nPFZ5RrQpi647hxNqhnf3RWsKeDeK7bdjRCzB+OUZTGf4iPcP/BRC+jViSgErFHungp0949gweCzP07pnQ+zv6YXOuZSUNZpKSRbAOEWD6Ucr9IJz467XPOVpym4es2oo+VEndM0q1ll1ld0d/inbQwYwL9Q9CzjAIqVHduae+o0b2PQvt341jrND3SEwKfW1oTTbUKpup2VXM7NOruoyNNt7JAAb1QfQwnrOkOlHpKL1k4RkJcf3f4pG6M7TacMg4Q5v9FYCOcNH8EqHQdlDEEgUDlQ3HLF4Ku3vvE0zBKisqYgUmEvHPNrK98VplNwwAYMtS3xdr12rGvSD+TY9Fa5uA+K3dIh6hB12nkqNXv/FbuthjkI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(8096899003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ZWPCPCaBveZWZfvWP4zWsbpnjOx8Z4UxcXpyv44j6MaPq5ClmMLerqzH?=
 =?Windows-1252?Q?wM68oIFWj0J8yErQN9QfxkCDgS35m9LX8CM7OX8++rnN4+XYxQQoikEJ?=
 =?Windows-1252?Q?NhqMXklyThfY7QvdHBowUNkOqtsEVpTJVjcoUKZT7fw2g9t73bc9qe7p?=
 =?Windows-1252?Q?34B5c+y7HpwvzGCCZmmrL/4tFzf9B7Z6u2V6rEL9Vib1VuFxYQSuozBo?=
 =?Windows-1252?Q?L7ru8oXM7a5QqWmyLorM5zhBxwHs1MjfO4MWqHYYkt9+K3bKns7mOhPt?=
 =?Windows-1252?Q?YflHfsftWh+Tv1yxtQ6RHkYdZdPF5AuA/JIIhUG49a9vRRfrvbMVbc8w?=
 =?Windows-1252?Q?N8I6QuJiXB9TK/mP9EStDNNSabf1UHU0CiPEGX4S12MzgcOM1a06Zr3X?=
 =?Windows-1252?Q?/DnJY7DxjnfhLyVKH3m9UEnl0kkeK0FKhPwezMPb4LobmLehRJxFtVSR?=
 =?Windows-1252?Q?XD3uOa0afSAuVYSQ0IORSreei5ALCs4WsrKntuTfCnA1deKp6Mh3LPaV?=
 =?Windows-1252?Q?PO/ieALlOpKnt2X9bvCcsrbqe3GPkeZZIKXpGckZ/4d1dQuwVL9NKuP+?=
 =?Windows-1252?Q?S9suWs4f1kKXb+VUvvWTnDVOnv0E4SGNPsT/8kbT/JaS40h3bZbrW/eZ?=
 =?Windows-1252?Q?wOxjxNPAY7Os0fWD8ke2khDGNI+1TJHB8z7CPx0mGQPFW6+TOh7pY4PN?=
 =?Windows-1252?Q?G6YDHZhOUjs3ulAeljU1nQD5j3roM3VR31nrLTvp82qCR2W2ksn1kPC+?=
 =?Windows-1252?Q?UoVDJgkgwiu3xCoKr2vNJiT55AGBugy48BL8s5OGLvfC4jlflDlgc7FI?=
 =?Windows-1252?Q?evZ3m3zmOCXXefNpmRKkg7Oni5g0VHUrmko0o1bMg0vLxagpv6+I8vBr?=
 =?Windows-1252?Q?ZpiOFtCGdvjwBjlok/MRerhRyIbG/1B++RESZxfTAX7ph5dLTg8Rn68S?=
 =?Windows-1252?Q?1V6AS6TGvEC40zxpCFIFAejnXoaEi3niD/AE9IWUMH7MgKNM3EaLFY6D?=
 =?Windows-1252?Q?/xEYeqwVGgiEQdfLrfo3DuiMQHUG9Bm7SrqUDGDytzE9XQaQBgCRhQPn?=
 =?Windows-1252?Q?YwsNaKUbCXEoXLVMPN7shfAfIgOFK4sZelDwDcy8nguG7vjX1wacAvW+?=
 =?Windows-1252?Q?ORVYiLLixEyouup8SCE/N9GFJ2yjtt3p8rpTNiP9IHZLG4YIJ2pK1iIF?=
 =?Windows-1252?Q?8JNswUZ0rfvkzgkwGraIOwZ5Em+fYIIKV3KkiZFnnp/fEs6QnG1FYpuM?=
 =?Windows-1252?Q?WnvuBYV91KrqbziogS9LCwMrDhW2J03OJrneUorT+pUu14pFnZCHOUar?=
 =?Windows-1252?Q?k7Omv/kvjdYwsfCa1dWGK97kR9PmeohzdHTpkCSvb+ceZ2s/tNx4ojRZ?=
 =?Windows-1252?Q?w9Myf9hMHwM9N/oQXefS7DeS9ZiksPg93KtjutZinGWP7UZ4YL1e8cEy?=
 =?Windows-1252?Q?QrJlKmCjLL0UuXPKlsprXuvaxPdlP6WYQsaNF30K/k+N3iyp6DK/Zz42?=
 =?Windows-1252?Q?bW57FpwsAhGdfjdlE4qmgZXDclJlMdV33LUlmdap/xw0TI7aLjolseVn?=
 =?Windows-1252?Q?8NMswKZ2/ze7m/U7Ac+V/JPMAxwGWh3tuEUPqM67RVA/nh6YInVKrME2?=
 =?Windows-1252?Q?sTWrvNl4pB32cbIfIWYpotL9XehN/LIkhFboFZwlP7J7xo1eTTA+DrPc?=
 =?Windows-1252?Q?jDxI26Y8paORC7g50iFeuAkghIU00wJ1UzLqkxqKvoZIse6fHLQvKhP6?=
 =?Windows-1252?Q?BSiqb2QHPBUua3PJMeeij6P/QUzh5yX1yivC07eEeJ7O7HgSv5utcNz8?=
 =?Windows-1252?Q?u+Hukw88sWyY0iR1woajTdmL6zQi9Klx1mPGcmF/RJYkZ2tx?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54277E9BA6D35882663CD2E1982D2CH0PR11MB5427namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PpMpIYMP6J9cVrX5VxKrzZY0G7wowGOZkIWM4JbMFKPAQTLoL/95+n3gbt7wYQj7Sfw+IdHIeRirrVI/a8rnBNVJpk3zTNnxlIX8thc1lvoKTQlR1oX6WyWTpi0/WMhaEe6JnNyFvEaByZci/MhRMdh2ckpdAcr4WeVKgKXRMSQJW8XB97zzZ2sWqh0VpsawYYrmRG9Er04lDVVKg3grnct6guGdQ/VRAqr4We9y+3an99njdPiXTQdVbOnhy4xsWNHID7AW3WAmc0bZh/9JKvoAwDzYJjbLTpbq579RxXW0IgfgU5NDp81rRszxmswAxwWalv0gYtpD4JZWAM6VVQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78c4300-eb2a-4cd4-3533-08dea02e41a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 05:16:06.2896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6efHv49N1xEz8fFnULZm7o1PsPGyD0Vegas9hQ+cNERrdYxygPl82zOSqXqx+uC9gmtXFrdKvydKulkkJOBfCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

--_000_CH0PR11MB54277E9BA6D35882663CD2E1982D2CH0PR11MB5427namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Karas, Krzysztof <krzysztof.karas@intel.com>
Sent: Monday, April 20, 2026 1:51 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Santa, C=
arlos <carlos.santa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; B=
adrappan, Jeevaka <jeevaka.badrappan@intel.com>; B S, Karthik <karthik.b.s@=
intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>; Kempczynski, Zbig=
niew <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec: Add VM rebind stress test under w=
orkqueue cpumask cycling

Hi S Sebinraj,

[...]

> On the failure path the parent signals SIGCHLD as SIG_IGN to reparent
> the potentially D-state child to init, sends SIGKILL as a best-effort
> wake-up (silently ignored by the kernel when the process is in D-state),
> and calls igt_fail() so the subtest is reported as FAIL cleanly.

>If the task is in D-state, maybe aborting would be a better
>idea? (thus forcing a reboot in testing environment)

Yes, you are right, aborting would be the most accurate in this
scenario.
I did wonder on how to let know the CI system to reboot
once the hang happens, but yeah, your comment answers this.

>I am wondering about the behavior in our CI. With a hung task
>that still processes something/hogs resources, further execution
>would be carried out in polluted environment and we may start
>getting failures in other tests due to this one being stuck.

Yes, with a hang task, In this particular test, even if it gets marked as
fail, it will affect other tests. Only a reboot will fix it.
I have seen this behavior with the test.
Thanks for your input here; it helps.

[...]

> +static int64_t stress_fence_deadline(void)
> +{
> +     struct timespec ts;
> +
> +     clock_gettime(CLOCK_MONOTONIC, &ts);
This technically may return -1 on error and set errno.

> +     return (int64_t)ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec +
> +             WQ_FENCE_TIMEOUT_NS;
>Both tv_sec and tv_nsec should be of type "long" in most cases.
>If you really want to case tv_sec to int64_t, then you should
>consider casting tv_nsec as well for the sake of completion.

>On a side note, you could just cast the whole expression to
>int64_t to match the function return and be more explicit.

Yes, I will correct these here.

[...]

> +static void cpumask_stressor_loop(void)
> +{
> +     static const char * const masks[] =3D { "f", "ff", "fff", "ffff" };
> +     int wq_fd;
> +
> +     wq_fd =3D open(WQ_CPUMASK_PATH, O_WRONLY);
> +     if (wq_fd < 0)
> +             exit(0);
> +
> +     for (;;) {
> +             for (int i =3D 0; i < ARRAY_SIZE(masks); i++) {
> +                     /* ignore write errors =97 cpumask rejects invalid =
masks */
> +                     write(wq_fd, masks[i], strlen(masks[i]));
>I think you could still check errno and continue only when the
>error(s) connected to invalid mask is returned. Otherwise, some
>underlying issue may be getting ignored.

Okay got it.

> +                     usleep(100000); /* 100ms */
> +             }
> +     }
> +     close(wq_fd);
> +}
> +

[...]

> @@ -693,15 +782,66 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr=
, uint64_t userptr,
>                }
>        }
>
> -     for (i =3D 0; i < n_exec_queues; i++)
> -             igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -                                     NULL));
> -     igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL)=
);
> +     /*
> +      * Drain all exec-queue fences.  Under WQ_STRESS use a 5s deadline;
> +      * a timeout means the workqueue is hung so bail immediately.
> +      */
>This comment should be split:

Okay got it.

/*
 * Drain all exec-queue fences.
 */
for (i =3D 0; i < n_exec_queues; i++) {
        if (flags & WQ_STRESS) {
        /*
         * Under WQ_STRESS use a 5s deadline; a timeout means
         * the workqueue is hung so bail immediately.
         */

> +     for (i =3D 0; i < n_exec_queues; i++) {
> +             if (flags & WQ_STRESS) {

[...]

> -     igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL)=
);
> +     /*
> +      * This is the most critical fence under WQ_STRESS: it covers the
> +      * TLB-invalidation completion triggered by xe_vm_unbind_async().
> +      * If ttm_bo_delayed_delete() workers are stuck in the workqueue
> +      * the TLB flush fence will never signal and we will timeout here.
> +      */
> +     if (flags & WQ_STRESS) {
>This comments is explaining stuff only for WQ_STRESS, so put it
>in the if body.

Will do that,

> +             if (atomic_load(&wq_stress_hang_detected) ||

[...]

> +wq_stress_cleanup:
>        syncobj_destroy(fd, sync[0].handle);
>        for (i =3D 0; i < n_exec_queues; i++) {
>                syncobj_destroy(fd, syncobjs[i]);
> +             /*
> +              * Under WQ_STRESS, if a hang was detected skip all GPU res=
ource
> +              * teardown calls (xe_exec_queue_destroy, xe_vm_destroy, ge=
m_close).
> +              * Those ioctls wait for pending GPU work to drain and will=
 hang
> +              * indefinitely if the workqueue is stuck. The kernel recla=
ims all
> +              * GPU resources automatically on process exit.
> +              */
>This comment as well: put it inside the if.

Okay got it.

> +             if (flags & WQ_STRESS && atomic_load(&wq_stress_hang_detect=
ed))
> +                     continue;
> +

[...]

> +     igt_subtest("threads-wq-stress-rebind-bindexecqueue") {
> +             const char * const wq_cpumask_path =3D WQ_CPUMASK_PATH;
>Why not use WQ_CPUMASK_PATH directly in below calls? You never
>change the value of wq_cpumask_path.

Yes, you are right, I will change that.

[...]

> +
> +             /* Belt-and-suspenders: restore cpumask from parent too */
> What is belt-and-suspenders in this context?

I meant it here as a failsafe, like even if the child fails to do (cpumask =
restore)
the parent does it. But I'll remove this portion of comment from here, as I=
 feel
it's a bit misleading.

> +             cfd =3D open(wq_cpumask_path, O_WRONLY);
> +             if (cfd >=3D 0) {
> +                     write(cfd, orig_cpumask, strlen(orig_cpumask));
> +                     close(cfd);
> +             }

[...]

>test_legacy_mode() is already 244 lines long before your change
>and considering how many if (flags & WQ_STRESS) you had to
>include, we might need to look into splitting it into smaller
>pieces. (not as part of your patch, but in general)

>--
>Best Regards,
>Krzysztof


Thank You,
Sebin

--_000_CH0PR11MB54277E9BA6D35882663CD2E1982D2CH0PR11MB5427namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
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
<b>From:</b>&nbsp;Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Monday, April 20, 2026 1:51 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Santa, Carlos &lt;carlos.santa@intel.com&gt;; Brost, Matthew &lt;=
matthew.brost@intel.com&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel=
.com&gt;; B S, Karthik &lt;karthik.b.s@intel.com&gt;; Konieczny, Kamil
 &lt;kamil.konieczny@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.kemp=
czynski@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t] tests/xe_exec: Add VM rebind stress =
test under workqueue cpumask cycling
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Hi S Sebinraj,<br>
<br>
[...]<br>
<br>
&gt; On the failure path the parent signals SIGCHLD as SIG_IGN to reparent<=
br>
&gt; the potentially D-state child to init, sends SIGKILL as a best-effort<=
br>
&gt; wake-up (silently ignored by the kernel when the process is in D-state=
),<br>
&gt; and calls igt_fail() so the subtest is reported as FAIL cleanly.<br>
<br>
&gt;If the task is in D-state, maybe aborting would be a better<br>
&gt;idea? (thus forcing a reboot in testing environment)</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Yes, you are right, aborting would be the most accurate in this</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
scenario.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I did wonder on how to let know the CI system to reboot</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
once the hang happens, but yeah, your comment answers this.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt;I am wondering about the behavior in our CI. With a hung task<br>
&gt;that still processes something/hogs resources, further execution<br>
&gt;would be carried out in polluted environment and we may start<br>
&gt;getting failures in other tests due to this one being stuck.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Yes, with a hang task, In this particular test, even if it gets marked as&n=
bsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
fail, it will affect other tests. Only a reboot will fix it.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have seen this behavior with the test.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for your input here; it helps.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
[...]<br>
<br>
&gt; +static int64_t stress_fence_deadline(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct timespec ts;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clock_gettime(CLOCK_MONOTONIC, &amp;ts);<br>
This technically may return -1 on error and set errno.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (int64_t)ts.tv_sec * NSEC_PER_SEC + t=
s.tv_nsec +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; WQ_FENCE_TIMEOUT_NS;<br>
&gt;Both tv_sec and tv_nsec should be of type &quot;long&quot; in most case=
s.<br>
&gt;If you really want to case tv_sec to int64_t, then you should<br>
&gt;consider casting tv_nsec as well for the sake of completion.<br>
<br>
&gt;On a side note, you could just cast the whole expression to<br>
&gt;int64_t to match the function return and be more explicit.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Yes, I will correct these here.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
[...]<br>
<br>
&gt; +static void cpumask_stressor_loop(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; static const char * const masks[] =3D { &quo=
t;f&quot;, &quot;ff&quot;, &quot;fff&quot;, &quot;ffff&quot; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int wq_fd;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; wq_fd =3D open(WQ_CPUMASK_PATH, O_WRONLY);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (wq_fd &lt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; exit(0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (;;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (int i =3D 0; i &lt; ARRAY_SIZE(masks); i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ignore write errors =
=97 cpumask rejects invalid masks */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write(wq_fd, masks[i], =
strlen(masks[i]));<br>
&gt;I think you could still check errno and continue only when the<br>
&gt;error(s) connected to invalid mask is returned. Otherwise, some<br>
&gt;underlying issue may be getting ignored.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Okay got it.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000); /* 100m=
s */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(wq_fd);<br>
&gt; +}<br>
&gt; +<br>
<br>
[...]<br>
<br>
&gt; @@ -693,15 +782,66 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t a=
ddr, uint64_t userptr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; n_exec_queues; i++)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(syncobj_wait(fd, &amp;syncobjs[i], 1, INT64_MAX, 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NU=
LL));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(syncobj_wait(fd, &amp;sync[0].han=
dle, 1, INT64_MAX, 0, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Drain all exec-queue fences.&nbsp; U=
nder WQ_STRESS use a 5s deadline;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * a timeout means the workqueue is hun=
g so bail immediately.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;This comment should be split:<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Okay got it.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
/*<br>
&nbsp;* Drain all exec-queue fences.<br>
&nbsp;*/<br>
for (i =3D 0; i &lt; n_exec_queues; i++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; WQ_STRESS) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Under WQ_STRESS use a 5s=
 deadline; a timeout means<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the workqueue is hung so=
 bail immediately.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; n_exec_queues; i++) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (flags &amp; WQ_STRESS) {<br>
<br>
[...]<br>
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(syncobj_wait(fd, &amp;sync[0].han=
dle, 1, INT64_MAX, 0, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This is the most critical fence unde=
r WQ_STRESS: it covers the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * TLB-invalidation completion triggere=
d by xe_vm_unbind_async().<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If ttm_bo_delayed_delete() workers a=
re stuck in the workqueue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the TLB flush fence will never signa=
l and we will timeout here.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; WQ_STRESS) {<br>
&gt;This comments is explaining stuff only for WQ_STRESS, so put it<br>
&gt;in the if body.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Will do that,</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (atomic_load(&amp;wq_stress_hang_detected) ||<br>
<br>
[...]<br>
<br>
&gt; +wq_stress_cleanup:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; syncobj_destroy(fd, sync[0].=
handle);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; n_exec_=
queues; i++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; syncobj_destroy(fd, syncobjs[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Under WQ_STRESS, if a hang was detected skip all GPU resource<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * teardown calls (xe_exec_queue_destroy, xe_vm_destroy, gem_close=
).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Those ioctls wait for pending GPU work to drain and will hang<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * indefinitely if the workqueue is stuck. The kernel reclaims all=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * GPU resources automatically on process exit.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt;This comment as well: put it inside the if.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Okay got it.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (flags &amp; WQ_STRESS &amp;&amp; atomic_load(&amp;wq_stress_hang_de=
tected))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +<br>
<br>
[...]<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;threads-wq-stress-rebind-b=
indexecqueue&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; const char * const wq_cpumask_path =3D WQ_CPUMASK_PATH;<br>
&gt;Why not use WQ_CPUMASK_PATH directly in below calls? You never<br>
&gt;change the value of wq_cpumask_path.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Yes, you are right, I will change that.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
[...]<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Belt-and-suspenders: restore cpumask from parent too */<br>
&gt; What is belt-and-suspenders in this context?<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I meant it here as a failsafe, like even if the child fails to do (cpumask =
restore)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
the parent does it. But I'll remove this portion of comment from here, as I=
 feel</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
it's a bit misleading.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cfd =3D open(wq_cpumask_path, O_WRONLY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (cfd &gt;=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write(cfd, orig_cpumask=
, strlen(orig_cpumask));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(cfd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
<br>
[...]<br>
<br>
&gt;test_legacy_mode() is already 244 lines long before your change<br>
&gt;and considering how many if (flags &amp; WQ_STRESS) you had to<br>
&gt;include, we might need to look into splitting it into smaller<br>
&gt;pieces. (not as part of your patch, but in general)<br>
<br>
&gt;--<br>
&gt;Best Regards,<br>
&gt;Krzysztof</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Thank You,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Sebin</div>
</body>
</html>

--_000_CH0PR11MB54277E9BA6D35882663CD2E1982D2CH0PR11MB5427namp_--

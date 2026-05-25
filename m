Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9F1CD5BBF
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 09:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B288010E10F;
	Mon, 25 May 2026 09:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9r1d+Lf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A4F10E111
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701632; x=1811237632;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ZZF6F3ji5Wz4H+wYJiKwtUqCW9RlfUgk3KlYeu91EkY=;
 b=Z9r1d+Lfkd9pIIPro0SEeN5hIukaL41KwZUaG1EuFcWqhzsRBydk7NPu
 NpnLYfu/j2ssomsTDgsNatGVPl/IJesO9XgwgOOTU8MHwww11PkHc4Nfv
 aga6Dfjc/0NYe0l5jkaswhpMXY3nlPJjafhZ6LWoao0l5IGjCn28E9Uq8
 aO3APE6ISR3jF4UYIdvX8RKySdm8lSWiMxDMKv+Btwff7kDbGgJK0MkBc
 jfx9T0CMWqDiee2twdNL9gWHLb8XHj6SPGyFopcolqOI6ogNdRUw8SPpu
 OgmDV/yWDZ7RYbbcpH8hRpupX1MuhDtZswpr1QOSWF4dOoVQ5wvC/V/nf A==;
X-CSE-ConnectionGUID: eMjWqzJDSMqoaBRBikkJsA==
X-CSE-MsgGUID: LODvn7SjTYmV88Ztxcu8MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="79555993"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="79555993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:51 -0700
X-CSE-ConnectionGUID: J+JbMaUeQN6rNTiZQfi02A==
X-CSE-MsgGUID: /XrAgNvgQJGUEqvbhneXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="271885464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 02:33:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 02:33:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 02:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUCxPbOvu2CJRIlMOY7wN4rTE/94hAy6B9w6Mg/f8gA2U+nJ5JS+M1uWP3a5zqQCrpCqNQZbp6zsPdqednSxAhhnPQp09C/LwpKB5nHLBuZ1pYh76HhYSM0yjfAxBDVBfIW49NP+i4oXbo5h4LmFC4ewTU0C6Uvxrks/CH7e6XXpCnT+XtNhjeNFS08bdqqmch/2oaNAi/OopNkOMlQcpYp/+kNYXRs9pTH2tRUomisfUzxeZsWSEhKGGfms6O+yjXzR/SCxJ8tmP5cwxV8AekP+EhpAl4vhFIZXAoJJIu5y5fMRR5iDLXlivHuSsUtFl5X5vv7ijjveimDcN6n56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNIgbL1BD2kfW1EMDlbIR1TMsSHUARaX4yxsmpIjMXk=;
 b=SOQ6FGq5ID032cQAINU7gB7JbJ+3r5PsOKMSLe4vt97w8CCS7lhoqHNQt3m3KowBJsr8e/wiFpIro7/qWqZ58nt2zI8/hR8lt6r9QsRxq2m9pkyge8f3++R25T56sRRhBS2+Ka4Z8hm/y+OfOqOElGjOjexSZJt8d6Z+s+mJjcyAqEKkKdy7B+R1wVASa1LZMVeNX4lO69+U04DqhbQ5VN2SjK5RHxMXsk+5shigCszIcFRVjgnVxyLF0szeLMPy4QIrawVcT5vrcZqtjUtCL4OmE7tO505Jt1fz1vj8RNma0+ccRoh/NWGEYfyQRY+79+12IwCjxW4VT6SSvUjRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 09:33:48 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 09:33:47 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH v3] tools/igt_power: Fix crash on Xe devices by initializing
 xe_device cache
Date: Mon, 25 May 2026 11:33:09 +0200
Message-ID: <2f9a0aa5284bc6fb8275842ea8abd522a982e4ef.1779701555.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::9) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: cabc577a-4a40-4743-2b94-08deba40b8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: EjK5xzbUXeD640rRDKNC2o6JMfiEE5oKfbDz5i6FG0yuBxBnG/JCGp3pupUcO0okC250EerrjDCkmTkTIguX82SyksxNKiEw9ZzKoEif0p8D7Bzk9FXv+Hf+kW5GAvdNkJoAqt8swmbdxBYS0TjHF0BhU7VEwCF4oQIOtWXbKxXKgnX6DCHAyiinfkuJticPHtjdbZSOQCUX+PM+Sq4naLksKfXcKl9DGIHQCTPaGK0LeNZdqVh0hUvj1SNM6pYYz45+irMeWePQmQ/3OZQhbZHRI7IaGdk8F1GwYe69gHPHvvS7qQUjE66eoXjYxFUenlSXTuKPC2wGYAqAcCI97n+kRuTsJYmR6ucRYWa/I7uhC0ncAWQy4ALL/LPuQLciwKrCRW4Y5CfkZwAhR9nvbbvBUbJ/LRFvE8hKK6e+k2iQ85MpC7qnDiT9Qnre5qerRdirk6HBIDgKQPZWeBEJ4rbJ9WPspIzG3pR22NWidb+e6rqvdFZf94Cr+bEYtSPWBRix1hb7/9T7yUTlkPwKMbQTEAuhJ8j7Yg/UI2IKwO3cBDQPeTT2DrGEtfN6tDkYkOR5fUoDjD+e8wr5hZbWn/9tjx5FqMP73tQlcz3cE6Ym+b++OTRvzM1epc0/0pFk83B2+oroNFjc3mBteza7ve8vzqs//cC6+B7K6pFW/ebfYieBcVkPSk8LkcB/WDTo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iE77mvKnroFPXJHED+q0nlHggIuhH28TXv4/2B1wfBv2MVAvQ/CGT6uvSkm9?=
 =?us-ascii?Q?ZOPShvv60xP9fTGpRqO+rkzIJ7wANrFCwE3VKmZ9KtYrZ2r20crh14aVdfwS?=
 =?us-ascii?Q?dY3dTNVsIZuJeMJyhSTj+ywU+aEX3P7PeAwdquT2yksVkwfHutCVt5dQrA7Q?=
 =?us-ascii?Q?LEXwowNYxkC07kcxNtyoPrL5nL1skQOu9pIQszlnnjWSHcdPiD2fesCnkMLq?=
 =?us-ascii?Q?DoPZTYINjcwpH0isj4oJO5AN4liEA3hplmhc7TQ0Ol6hBox83q0c7TVezu4A?=
 =?us-ascii?Q?Z0uD8X8SlUtGYE3Ed/Ik8FMYKpmI1HWA7Qr3TFFPxtqi971qI3zD30F5Sogv?=
 =?us-ascii?Q?1lW5AVtJJ4NhtrvWYw4VRlY5xYOFE0YikfM62Ni/jkBKDk2HXy1d9fZp8x7L?=
 =?us-ascii?Q?mG68vSM28OtzWlIU8J2736aQENnEQRgQo4irypY7mIPn2bS+q6tM6/D4O3zI?=
 =?us-ascii?Q?hYCpKDpMCGnJu1aoBPPvduuGtvS2o4qVLJPzFePy5hl1vn5AcwZt9ztb84U6?=
 =?us-ascii?Q?nJ7/NMrdb3LhH6Uah9C6gYTaf+7W6S4zi186KRAIS6nwTmXA1hMaQwKh0hOu?=
 =?us-ascii?Q?iXAUyXTLuZo/Go15vAh+tnNkfFkIZfYklWsASo+FtzJELn6+pMCKo9bQbqx9?=
 =?us-ascii?Q?wMW9ETaQ0I7zio6GdmnLrbKHJOoe5cLTxMdrfSQu6reWGPqvMsIoijM6qOj+?=
 =?us-ascii?Q?8ZxYJxtPF6VSXJYVmUP7UvIeqz/4EQjKQKiso4IHOg5f7IiWYEBfT7A0g5Vq?=
 =?us-ascii?Q?luuMwcf0zbFEh7giy0YaR5BDe9Kx8y9ya2dqAQicGBKUF+xm56V/njv+TCiX?=
 =?us-ascii?Q?tJluWRJucPa0m8jyTzH4FuUP25y+sgT19Q3Rtt8aCGCHIOj6JCS3uK7Sd64n?=
 =?us-ascii?Q?GSkLaz4InJq0uG41juZA+VBDw2TXRUFFe8oYQluuC5jirXc07mAUO0pYxYNU?=
 =?us-ascii?Q?RFoSMZbL/JlKRaFOZY+nM+t5PkvAuB/3y1vKD2B+5m44vRw/6ONDxyLwGJaY?=
 =?us-ascii?Q?tUQqngt79EcSWwjGs87GYhSZRlJ6p5D4q1PbkZKB48FiK3T/1jmQco0qlhRt?=
 =?us-ascii?Q?+G6Gxrwy/QiszQXzZgxHcs/t6s3hrPW5pcfB17NMM2P/DP+TYQJP97kSM8JY?=
 =?us-ascii?Q?KqowtLN465y+eK/WEWB8NDTHlFYrY2dz5yla6lG1gn3gGxNU9zMbA74VFmNc?=
 =?us-ascii?Q?aLwK4Mf8R9/4F9BYiGwZxPZ2JP9RcEwhYnGsc429cVeptxJLSJ9/Tvp3/u5E?=
 =?us-ascii?Q?RhBsT3qKfvKCP0NnZ6+PEkTw1f5THwfx3RN6k8I9jarZLjPOy6/Ui4gVL2Gn?=
 =?us-ascii?Q?JhzZW1X/zPXp0e36BlHKQVrUE0U3bnqtyNkUyx9ZAgbE0eF4gnAt5roA2Dwh?=
 =?us-ascii?Q?Z3Z/iG+OeaXyjZMU1YmgQL6vBMoHp0+5aZ0rQ2KDk93n+l3lPpLf8xvOzVbC?=
 =?us-ascii?Q?6um/J9M8VxHWHWw/LN8AOUP3yd1vutwV0pqxzGHgiW6hzgc82l8Mt7Zi4a/Z?=
 =?us-ascii?Q?AvEAYU+8UtZ0/uVHjaDDH0cIB4Jiu5aDm0LcYC/AmtyuNXVmYTWcaiijDz3q?=
 =?us-ascii?Q?YJlOxYJ16XaQVWGc0p5cutkCgyXYjCXzKvCdylmXx8FkjwWDoLY0epMvAAQB?=
 =?us-ascii?Q?F3aNYWh3MjO4+qHoexN/GhvUMPVGELHKzoML4ObVE/dfV7u1zJCiYbEzJVu4?=
 =?us-ascii?Q?mgkkIql7wufLfm+ZEBX1ZZizqshFY+kXMc7xAmq6f3rYc7fGSJCRY0L/3FTG?=
 =?us-ascii?Q?mk8qWJ4M2ZLsn05ahf5W+4WmPQcmI5k=3D?=
X-Exchange-RoutingPolicyChecked: Ps0eyOFz9dP2flgejgwCF4TdzUbNSdek3v0saEaLM9aaLtio6TExXqUGlaqYlhljKX5iyrQcnBuW/ASYpQVjhYl3XGAOeBIrHjQJhrmn4zJl7MV05FCm0/rWjaQhAoqS4Ur69lON+t2Nze0vyymWrsDxAy+Sb814n/RC4a7R9Htpfv0/30+7BViw7shTETsdMfX515T3f/POVQwmVx94hO1SulUGpoRL8dTavsIaxAVI9XSYM0mRfYSvl+J/YlmnxlSdPDnL+XP3TaQf15V3kfdGSGmOuTcukYY8hTMHkLbFTrg5XVeHEKCTPnhggsOR4BlKeYwXxj3SV4+Osmgreg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cabc577a-4a40-4743-2b94-08deba40b8af
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:33:47.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5wvcoexTsdFbd7eOPvynAJBh8dJJTIegnJdgNqYGvZZRUvXI1/shVQnR0840mxBVat8B2u5KgNG2AgcWMUhjmDjB5PFCI+LTlwHVFd/JHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
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

Opening a DRM device with plain open() does not initialize the Xe device
cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
it uses find_in_cache() which asserts the cache entry exists, causing
a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev

Fix this by opening the device with O_RDWR and routing path-based DRM
opens through drmtest helpers that pair Xe cache setup and teardown with
the fd lifecycle, keeping igt_power free of Xe-specific handling.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Xin Wang <x.wang@intel.com>
---
v2 ->v3:
- The if (fd >= 0) guards on both call sites are redundant, remove them.
v1 -> v2:
- move Xe cache setup/teardown out of igt_power code
- add drm_open_driver_path() and use __drm_close_driver()
- drop the direct xe/xe_query dependency from igt_power
---
 lib/drmtest.c     | 24 ++++++++++++++++++++++++
 lib/drmtest.h     |  1 +
 tools/igt_power.c |  6 +++---
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..9bec3673a 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -379,6 +379,30 @@ err:
 	return -1;
 }
 
+/**
+ * drm_open_driver_path:
+ * @path: DRM device node path
+ *
+ * Opens @path with O_RDWR and populates the xe_device cache for Xe fds.
+ *
+ * Returns: DRM file descriptor or -1 on error
+ */
+int drm_open_driver_path(const char *path)
+{
+	int fd;
+
+	fd = open(path, O_RDWR);
+	if (fd < 0)
+		return -1;
+
+	log_opened_device_path(path);
+
+	if (is_xe_device(fd))
+		xe_device_get(fd);
+
+	return fd;
+}
+
 static struct {
 	int fd;
 	struct stat stat;
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 37874d729..19d3d1e76 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -123,6 +123,7 @@ int drm_open_driver_another(int idx, int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
+int drm_open_driver_path(const char *path);
 int __drm_open_driver_another(int idx, int chipset);
 int __drm_open_driver(int chipset);
 int __drm_open_driver_render(int chipset);
diff --git a/tools/igt_power.c b/tools/igt_power.c
index 6dd180d34..9458315a3 100644
--- a/tools/igt_power.c
+++ b/tools/igt_power.c
@@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
 		int ret, fd = -1;
 
 		if (m->drm_device) {
-			fd = open(m->drm_device, O_RDONLY);
+			fd = drm_open_driver_path(m->drm_device);
 			if (fd < 0) {
 				fprintf(stderr, "Unable to open drm device %s (%d)\n",
 					m->drm_device, -errno);
@@ -54,12 +54,12 @@ static bool prepare(struct measurement *m)
 			else
 				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
 					m->rapl_domain, ret);
-			close(fd);
 
+			__drm_close_driver(fd);
 			return false;
 		}
 
-		close(fd);
+		__drm_close_driver(fd);
 	}
 
 	return true;
-- 
2.53.0


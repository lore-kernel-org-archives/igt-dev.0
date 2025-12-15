Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690B8D5B177
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 14:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F47910E26D;
	Mon, 15 Dec 2025 14:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Th15kcj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB8210E26D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765809949; x=1797345949;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=RmS3Frbt6rBNoffOX6RP8v+XHwsvPTEfRbFqRt96RcY=;
 b=Th15kcj3+BJlnvdvwjIWpoOr4wLVJajx2ZC06gaqM/VVNquKOuhiTNRD
 M5YU8Up41TJfgSkp/pYTHNNkMKTgewjmSooTGgiJSN/STGfO0kESbAYS+
 kyQilQWcnMAiM488S5N2IsaglBBsJdaIU9drn/F8CJRE5vqtMH0nClz6M
 YLNCdIj7FbX8aSJxbFZYfs8EYGZTV7nwHHxrvko/ZMDmThchg9vr59FDm
 jAlQ06fL0ncAbIAyBz9AqTXHlyv/ONsN5rzXEzYKLQnUZlFmXkXI3997c
 Wdju7jRbekRhyc2iJ6gJBtyhZPXyPGZeeHLQUyeEhUSEFFYLGF8ZfFHSC Q==;
X-CSE-ConnectionGUID: 68lb+QutQI+6ZG/RZg2SkA==
X-CSE-MsgGUID: m8jx/NSfTQu9IXkXK7aQBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67779786"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67779786"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:45:49 -0800
X-CSE-ConnectionGUID: eXdY7X+6SWCnKFZqZL5wBA==
X-CSE-MsgGUID: GmkRnCZ6R8WPI1/ELhh8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197738566"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:45:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 06:45:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 06:45:47 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 06:45:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3L8Gsbl8QhEKo5K3W5VZ1Z8poulifvOINyJ7idtPRn5aOE4VMFfzA4L5Sj03B2DT43D13xVrQWY5yf2IxwgqoYDDI09m1oXm1VcF3k3viMazPX7F8M7BSpnoD8rmjIlD8RzTOmOGOkxaqhBqDEOzCHKJOOAw3BDe12g2uiu6qyZjTNR5+0XvY7netZqNTMvKz/dg5HapSwXOAEJEITlmwNEntcaFZha3JIDUbvsQ5AT8SCvv2fF+I7CjyzXlgkWElFLGZ3GVaNhWM6Z5ELwwla+gZX8ZTR0kgq/jjXJ+CmSJy2n/IV+Sfxv0Urzlrdl0Yc/i3uL4tYtb/Re/uXbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GskrWCRFwONvImzwaat6WGeX9RH0jObQTxa7We0tHuQ=;
 b=PSl74+Le03Aow3bfT4rJ8HIAmdKVaMCcwbXSSKQU714Vjg81N047dCaMlOQsXLA8ZF18lHOiiRxBnRKdNZPtv+EbB5sl8efCJZV4EIKTk/MqWMwGXat1lLeX6mfbgAwFq2h0yUN+eS9/7UsDcVX0v9/YG4cy9QHTE9sEt9beBWN7UVTRrfyrCC+W4YTrkg3XlFhHhHuaM91u/4DIF8vpOid+FKDNLwYbDOnwuDtCxsF6J1LwS7NAUwwgcOFN6ySrxwaE7SJibzNRfDawF5QBYahUm6bUT43Z6MuWcZ+D07HcmsxCzMY24Yw/heHHJ8dSdZQ5UXKEQWTDBYUhjRQD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:45:39 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 14:45:39 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t] tools/intel_gpu_top: prevent losing original pointer on
 realloc failure
Date: Mon, 15 Dec 2025 15:45:13 +0100
Message-ID: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbbfd8e-b39d-43fd-e271-08de3be89daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?46WPPtH/7Rx1WF3c6p5yXp8xc/sE1zKSnEDmSSgjLioLB2Pr8MWWoGiw83eX?=
 =?us-ascii?Q?00ao5lRA/KyJ6HE/DQcu0V6anqd+IE72iQscUmcHY5Yu7crenZ9xLwisjdzA?=
 =?us-ascii?Q?zBRE0q7xe/ruN2WaiLLPyneGfVDPXR0uGBNJaDnxjU1R1pc7cCLbwCRYM2Eb?=
 =?us-ascii?Q?YdBtVWUkgqwElrF/Evu8LBTKyNxejMsnMfbFJULLoTYdPxOvpc9Xd0phAYE5?=
 =?us-ascii?Q?y3Hxj48vr+8DkmTC4IlYWK2GRUK0fBb7UZxe9zZ2ZoF/7nGZBQDZ7IQplWML?=
 =?us-ascii?Q?QBNaPTJv7Ksc7ceNFO69dzRh9C0cwuSIMy9SX4+gXzixBgrkVxATTlFNzq2b?=
 =?us-ascii?Q?aON5/jL9nAvIk6kSGg0FTex8c2KCkQlBMt/Wtpr3tx4ZL2FGqJemJNeFqpyn?=
 =?us-ascii?Q?U80gpkjQScVo9cvEPJ4Gak8aEiHJoryh93/rvHhv3MeUFksyxEdi37gVonTa?=
 =?us-ascii?Q?JhxYpQSqHb1Rqk0olYmcL14cRweHHuT/Z7TFDZl8N7sXEVnv947K4+n8FTkT?=
 =?us-ascii?Q?rY7/pnhO78aRjL8s8osS/KIJ+1v8wem52H8Xi21Ou8cWw1lt2INCWQv2hcWx?=
 =?us-ascii?Q?fghsRjFudCXh9BrobaM87h4baEGwRMSHm954Yuu3CwSo9HkJpeWjuqJdMuMf?=
 =?us-ascii?Q?9q08uFKf1ttU6WqaHklYzDmRaTl9tlyHgcfNakJ3WXBMbBrGe3JQSM/k9vcG?=
 =?us-ascii?Q?4lsvLfPpbxo3Q/q3E3INs/B0CD2fw7jbFID6AIerBtRyJqjVcpfojJQd6Rtm?=
 =?us-ascii?Q?4LMBqV3EQug/m7KUPnDAKhQmuJL9+SfXQrw6wV/zxAyhF6rirmK/r8+m7AZ3?=
 =?us-ascii?Q?QHpo4crO+NZO/JlR7Kkt2JWd19BdQjCzqCS+mUlip/SZbuYsG5se77scYK1q?=
 =?us-ascii?Q?3xvhgwD20nOqkP5qt2dxPrTG/uOwLBdetdEOY2Y/MrHgqRFNqZWA+TwwCyI6?=
 =?us-ascii?Q?1K6SsXl03LFIBpH5whn9AmaNTY8ur8Y/pKHz6nWLRvyJiL7gtcQUVwgxUqjP?=
 =?us-ascii?Q?bz11Ie7G5+U/5Uc8jqpw0eHwpa2es8yHwaEsQrcFkFib9OeF1xgNwYpS7eyV?=
 =?us-ascii?Q?yol+nzM3oeRIXiMcGaiatAKDLS+biXr0YZF4xcUf73OPcTKBJYWoX08yO5q9?=
 =?us-ascii?Q?Bu+ZCNDjxWWZ13yovTaQoIRzkZIT9vqJQcXInhivHejbt6w6b33JPje01uZq?=
 =?us-ascii?Q?NBbVxkeHCfEmQI1cqY0RHsH5kdqcs+/yzmfHoy+NC0d33Iy8Vh8P7f1WaSl2?=
 =?us-ascii?Q?LWWX1+nBjiNmdKtjhoVqL8RvcnJG0OASnaAqMrRaFJzoT+2Aipwdd+NAyzDu?=
 =?us-ascii?Q?iaZNRREcOAQ1qjTj6nHOreKX4HfER6WdVcvvZno3LCLxxyQvM5sGj+xcXK4t?=
 =?us-ascii?Q?uLXrVIkeUOUsJhYX0kwfrYh5irdehEXroKbSdBkJ5FgqArkiVOPrTwuv4oLH?=
 =?us-ascii?Q?4hDQ14UTwLg6WjQGmlD/hLG73ZJ5wMS7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+2u3qDAmzX6RKHwYIN+4QX1VcqNOv6NNdQm7caLJax4fVHCwNmXMJU2NIHFQ?=
 =?us-ascii?Q?VUxtiOA9u+dPcAunHrAL99hFFTLkpDPQrv9FOeD/X5YA3PNZDxF9O1QJ58NM?=
 =?us-ascii?Q?8d46CHmtHGufsinqZClsi0U7Bqkz2ijtaIDEaVYJoVIae34JqBATbg20cQ/R?=
 =?us-ascii?Q?bYTZGWiTosFDhpsx6pybUe3sUQZ0mUXxMTQrdRLgPaElmqZrRrZltlz/QJ/u?=
 =?us-ascii?Q?5bdpBy+eiCL8POn5HBuWFGRAr/vRjWcl3umzSYFo5UCImkG2s7CFuunjcy7w?=
 =?us-ascii?Q?oxrajtzr6KFgM/LlhnbAikTZl6AucTuJPjuu6u3sHDgN71bCf2KtbAMqnhox?=
 =?us-ascii?Q?5swmzn2jYLs+DW8eJRFaBgH7azMXHnDQ8DV87tSfbXTOD30Boh3rXTWURyra?=
 =?us-ascii?Q?J+K25xqAWqg7qBi0AMHFaneZruN6di/ftLYRTo7dq8JAvs5PGYMGbTMIy17h?=
 =?us-ascii?Q?GkELIVlqRtQ58QYw7wvrFl/SY7rajiOoNJWeHsO2ERFj62qexrhAEiMTj18G?=
 =?us-ascii?Q?LMG8wyu7Q2S7ygP4EjHWkYesvsLl/6KmkEE7U//QcRsKslYZKim7VWr0NdFk?=
 =?us-ascii?Q?KZ7bAC90BwgbTEmpLLx+1lIXi39F36NqL5GO61Wc7XTN/GrVSUPEfU8/bxav?=
 =?us-ascii?Q?JIUshOcvRURfG/5Ylr9li8ra5PwIjQx4RdWZ2QMQXdfQ1PXQLjUxQZG+jGmn?=
 =?us-ascii?Q?1v8QhPaw1w+Vel3CQMdp0a7+6vLZZmaklrJijyzyUJV9L/X9xZs/OhXI4O2A?=
 =?us-ascii?Q?mQpt6YWiaY4FAKpIbiQ0X/cJM7jzZrHsNxhVZn9g9tMMqn+sa/h024WPxcql?=
 =?us-ascii?Q?2lBwyExhTA12b33Ocw7jbOvHKsq/fJozZvxwB6HRs8lLrjtMeTBqOVhnMKst?=
 =?us-ascii?Q?wBELBnu4cuP94qspbK9YsZsOnYf2d2y4sgaKmlRFaQ3vptV5prXGnXj9A3Qk?=
 =?us-ascii?Q?mRQLVl+hZRqgiZXIGA3cx87qGdQy9gRvOMvo40Tk1kYMiUZM2V49vMuG3kzw?=
 =?us-ascii?Q?fZkgLbF4dNCc/Vcm2nejnGNoXmyULMJan5+8dr22vB4hRpt2mxxefZCTrLRV?=
 =?us-ascii?Q?Ij/S8vvvsQUSDyq0nin4XtCpmNJrLPL3hY9dbaasJ7sAaqGv45cnYDPUCbwq?=
 =?us-ascii?Q?cVR6QbmVd2RBFWjXYO9mWjsKohjx2mv8rbsKLktPm6Fi1pJvpcBW5vXxA+TJ?=
 =?us-ascii?Q?Ep8JZUtEf8BV6DFMRWBJPbRbf9o2DFlGG78lAF8tbwOzkjUvKxL/z8w51T/I?=
 =?us-ascii?Q?zFMQR1f9Q2cU03sOWdksyNTNUnOyQ0jWBHbgrMxyBFzk1Lwqi0qeEWS4r8gR?=
 =?us-ascii?Q?4rI91XaSWq8kAfX6Q1R91dnxGKdDjS5/ufSy4YFKzc238TdW+oP3XRLGHI3G?=
 =?us-ascii?Q?11Jryedsf3M66QRL/95CvbOVMFA1kNCkMub9HmQZgNOLwHKMyzayenWbNa8s?=
 =?us-ascii?Q?LSH0rYrHb/htJZ2b5JdXVajnfiQ2Xk45mscx+pLrLPYbzcfPl/pgSV0Txxyj?=
 =?us-ascii?Q?9h1C5eiousAanBmD5TN88Q6+cc1YcOjkPTzWpXcsjkj+E4UEKtnkB7O+S0+6?=
 =?us-ascii?Q?89bqYry3SuXhJRdiX/WK6+6HS5Z5UYq5S65ue3uSvwfmaWJH0wLbSFyy/yOW?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbbfd8e-b39d-43fd-e271-08de3be89daf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:45:39.8398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XD5Memv845ulqZYovIc4foswKKNiRAD8R4wRm1T7G3T2ywcXs3onKgHeJorZkFMkIGkRzwVOUENp1CoTgiR93aOhppxXkuBt8LZTIqP9dc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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

Previously, realloc was called directly on engines after incrementing
num_engines. If realloc failed, it would return NULL and overwrite the
original pointer, causing a memory leak and leaving engines inaccessible.
This patch uses a temporary pointer for realloc and only updates engines
after a successful allocation, ensuring the original pointer is preserved
on failure and preventing data loss.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/intel_gpu_top.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 1bd88ba7c..1d0d11585 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -378,6 +378,7 @@ static struct engines *discover_engines(char *device)
 	while ((dent = readdir(d)) != NULL) {
 		const char *endswith = "-busy";
 		const unsigned int endlen = strlen(endswith);
+		struct engines *engines_tmp;
 		struct engine *engine =
 				engine_ptr(engines, engines->num_engines);
 		char buf[256];
@@ -444,14 +445,15 @@ static struct engines *discover_engines(char *device)
 			break;
 		}
 
-		engines->num_engines++;
-		engines = realloc(engines, sizeof(struct engines) +
-				  engines->num_engines * sizeof(struct engine));
-		if (!engines) {
+		engines_tmp = realloc(engines, sizeof(struct engines) +
+				  (engines->num_engines + 1) * sizeof(struct engine));
+		if (!engines_tmp) {
 			ret = errno;
 			break;
 		}
 
+		engines = engines_tmp;
+		engines->num_engines++;
 		ret = 0;
 	}
 
-- 
2.51.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3328C98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 11:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B80F10F9EB;
	Fri, 25 Sep 2026 11:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzWadz1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689DD10F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333889; x=1821869889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mRJNTmgL6/odcJcBGkU/SIZgbtfIv8U6K8B43WSMRdc=;
 b=HzWadz1zdSnHUmU47I4BGoyJFeuUazA0x0ghf5RnLOGfgUuW/nyTfRBx
 e3kxiH7xIRiJG/dVNLShwJoq34UIWbVne+ZOlg33HmT9JPn28cFDM6cM1
 nU2tvFPVhtTxWJCU8mLOqn6ka5kPnU9baNhRcM6eL+ndeFKJbM0QNtj3s
 MhtbH2p/cvy/jtCJTEOZ2a7xWtpwEsq05v8T484SP1en/hdFPg51CA0HD
 iRdBWGLnpHe6hMiwS29xKcHp0X/ZygFzObxtZkGU8hpTKhfIY23Vovm0Y
 DivNCdU8NGJlQC3+QUBLmdOjLPnWTRFb8gzKAAMXesT9VxaT9kdq1wNi1 A==;
X-CSE-ConnectionGUID: f2nxFsBvSIi2ixlpeeFX3w==
X-CSE-MsgGUID: iMMbvlXtQgm3Su2ZW9UDAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94935947"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94935947"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:08 -0700
X-CSE-ConnectionGUID: 0RPq2h54RXO4Gxc2Gf//EQ==
X-CSE-MsgGUID: aMmEeWfNTrqb4npM4huH/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312230408"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ak3oCgJP7bN+adPKT7hVp6medUkHvGJH2n57CKS6vK+VqVUsly7mgRCKgs1EkdOWOvHhd24D2Ph4ZdKd5ioW/n8bxLtPChu2+Lzx0ihI+kTxjzFNW4MQKkDrWHfrPDroc2IPizf2O+ppHAxV6oSI35o+BH0Uv4xbpqiX7suzcj5ZdbPRRZODLBjkQk1cTAHnACEIKTs81fchHjkQoUgpOwUuAsUIzTi+A4cOVo9jFfRJzvFvF4yIS83JRv2cVb0dd6sUW4qsgWCMoB5T6nijwUhNv/6cVGtsRw/8ouzHxqid6CVawnBp4O5M+Te/1fxyExJ7iVbgvZ9CyvWNFfbFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvX2N+gpNdvj+NDd12Z1KjYu9Mm3HePFL5Rr/ofct/4=;
 b=AAi2o4tX5ddthdlGzVB0PPq3lLJ1qSAo+Hg5ukWiKsp8eIfn34NEzeptZ4aW/yH9RRS8TKOkriLEKnBLYQM1TcC/ol1G4rd2MmBXDg1f6MIdHqhlZ6ZU40va4+C5EOtABw60uFtEYAJZCWOa6xDTvn9UeCBeO6jXiGFJseQeKvM4ZAX2KehR0CnkLGJWbTtI1DlwTtHsWUrw6/YoGotrmojW9jnrsJAIsPPPXtXhwIZlrFFiIawgbLZHmt5SCQv64a3I/SHrKT6OOoCq4yfeIRwI5RaNXBL1uH9RlL0Gyk26F/KkBqy9cnCrnrStZPOYIB0LfZN2g5dIFx+5HuH2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:58:05 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:58:05 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 5/8] tools/meson: build gputop PMU backends as part of
 gputop
Date: Fri, 25 Sep 2026 12:57:45 +0200
Message-ID: <482cdc12e728fc17c250407cec34251ae3295f33.1790331690.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: d27bbaf9-a164-4bfb-c3e6-08df1af3e022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 5CMOdWxMmoVpFVTICigNNxOltbL3rS93Wx1dOEIVoX62Rw3SasUFZVfaLX5eepP4KKw03BXmhLDbL7ateXZTAj3e05v02EfphymFTJSpwazKIW4HIbjlcDjeD6m6/v6q6O986CHYjyi6l15A4ktZiRZy9Z2DhJmbAnsDKUFe4l7zjikTKuexXCYgHFrtwnvbTaIdMuJqGzWYBIjYtZCQde4tAyhlYa3s5RJjN5r1/ICr07JEbPtIvGXgWjQIcsYUpBp3vXkKzTnTl+jQeGxiqdufIyDRfNm3uJsPWcSmkVhAk1Eh2c2eHUP2hRzPtBtMCGNvPaCqr0iBlzlGJfxqIOmlmAb+j6il6qiKuEMGF+Lu3hksaH0u/PGIP0gI+f148ewXvg/o813z5BcEB8TmHRvOY6BbZdASGa/rj4WOLoEthfk94IwIeX3D8LMltbf+x/1FvU+K4RAq+UYjyaN6gij3UlLpiofvJIKSgKQ9H2OFT62KzdLf5OvXrDL2evP1fQtc+iXQTxCUdydQLYsMUCtOww0qSJUy+1U5VGLcGxeJJXDJ/nC9YI7XhIfuDO21m3ur7tCFB/dn+0v9j1QE63YQl4sozvI+DitFNc1FVver8eZs8hg2VKzE6H01tPKR3Tr1I7C8Vfn6aIbA9KhSjkG+uvyF3rExhpGlRy3ibUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zv0IJlfPRINYtA30eZQUG3qdj/tDOxJUHk+J6iHvz4XazrShrKJIYbLXjnLv?=
 =?us-ascii?Q?kLLjCra3QwUuM5zh2nv6ydZ9fNUSGP5Y94sM3JPjvDcA3+QBqOxqqFS/GsML?=
 =?us-ascii?Q?vdp6G3rZIWHd1dxxazKHbATXikxpW4EAVMt4x5SPVsIvlIi2Q2432bqsClcq?=
 =?us-ascii?Q?4z4Zsu3mb2QhRiOytO9KVkR3/IbdflwTAcUVXWtYr4KplBvL/SbdvIdzR/Yq?=
 =?us-ascii?Q?FXup6QWKCbtf+m8tIJV8jfJPCnv3CQZGMMnWxsPu5sr893/4Sb1pxqZgWVQh?=
 =?us-ascii?Q?6DjSHLetTUg9e3rVvbnKB9aey7u/VzePpazQcXmlG/VX7QU3GNUC5Uyxxd5S?=
 =?us-ascii?Q?DJDipidm7KHIIC0grmL9nE1A6mWfklxPa6XDcqC7+mXgSsky0SaWu1RNdunb?=
 =?us-ascii?Q?OG1zJSxWxIcgs7Bq1kO9qyZFlF1K0vk9HDZWId++1CIW3p3QOLQ8ESzJsyJ+?=
 =?us-ascii?Q?yW/jWR+Pmd2GOq/dPeM1Y/NeLriEOXlkTOV9ymatg8ovd5gPtKyXNNPERBgt?=
 =?us-ascii?Q?wpfK7U0vrimLQwrNTgVzG/sJVhm8qMNiGlS6b9AuNgv4LgZh50x8qGZxo1sw?=
 =?us-ascii?Q?AQdaRmuzFA1mMXV9drXmBRqc0QF+QwKJjeMIK8P7ofMqfhnMwc8pcH7sw2nT?=
 =?us-ascii?Q?Y6Cq5MsAKTRJWHlFQScGeTQpdAAW5IqULRpcI3z7iRZ88ZmMCohX9doEvDMN?=
 =?us-ascii?Q?ncQWvHbYXV4mFNEqhdfZvBbmraDBzrJ45uRGxxZkk/oxYIhMQOtkPjnScpIb?=
 =?us-ascii?Q?ZPsWQQYBxb4A1xRYPsHmunkUfAaOOQ4AXAmOJutDKDO72vZrhUp2G+8+6Xtx?=
 =?us-ascii?Q?G/bqqap7RVKm/VsdAwDmjQbi9hUx8Kj4tBwO5bK23aDlkNagTkzQlCnBFgUW?=
 =?us-ascii?Q?twblk12lkbOW8VdO/pwBiElDB6o2+W94X+eXUJw1Rc3e2H1h6lv9twqcZAB0?=
 =?us-ascii?Q?XGBxJpnYf4wkHKcNDwkKHbeHzvZEQ/PUyHN/XJPiJREiXeMMSIChxeSSum6B?=
 =?us-ascii?Q?mZNGIM8Nu/h4KtAM2/L8qa81TEpitUxE7dsk89PPuwvBNAVr6tntJeN9VUiA?=
 =?us-ascii?Q?vySbu4OL1T6oHZZWn//fY3bX/iSGvhHP4oYq4q673psxzeApP8d6mT9i9GfL?=
 =?us-ascii?Q?9whhpPMHEw3S+EzCqCEC5/yoVpbyRJpkgyNjZChf3iK7fTFUaIXoqFytVpkK?=
 =?us-ascii?Q?9zp/S7JQNKBTmq9QCok7mzNo2qKFWwUGLVvLGDjYxW6GSPOjH08mHXg9Qw2F?=
 =?us-ascii?Q?OOO9BragcKXsPhcfXP8dC5RFnrjtuAa6tRSo5h8A0f8xfkkXkHAtgyzJGB51?=
 =?us-ascii?Q?NILR25Gf6DGvn15+1kgQKN3UUSTOfA5r6Y1iuIW0h5ykpOuwnSADMj2AUZvZ?=
 =?us-ascii?Q?3onj1B9Ewk0NILTlQSFtU4lIs9xXfEnOY22t15DFceqXFAEJTS5nQN4A1iea?=
 =?us-ascii?Q?1iLU35muPYiitEZ7KP+YM+i9qKOwhR/Oont7X4jTrXnPJxNv5rlXMPK0pdhQ?=
 =?us-ascii?Q?AmntpmrTJgIzkWLVsWiZMsBQnrth4iAwndEbcftzznflVrnT+jqMcrWCCQr6?=
 =?us-ascii?Q?31IReoXsVruJPiWEXSuKCkeOJtsthofOablVnfZ1I9GFQng4CaO5eFqHynir?=
 =?us-ascii?Q?URUd2E9L/hY9MpfRGBYEjl7UK3wjgtXgGpsgsukO35r2Tmp8CbApRzR1pahp?=
 =?us-ascii?Q?LEBAmGHl+WRLqMxsCC0Y+OC/KuZSCJAGfRFJjtVTrMtHKVfhRbo2iJnP2jUu?=
 =?us-ascii?Q?4g1S0w+342/vPfkeV1ASwbphIdKLhRs=3D?=
X-Exchange-RoutingPolicyChecked: 5TMsjDNBoHytU0jBBefPlIMraya3fFif7nyZqRm602dhrFT+d5P3V+Lot66WQJeSG6ctTUB8jWYQMAMjDTzfCXoXwx0MqsUyP9TAiOiBzORJqhXNPRB98S05S8TLhP+VZDSX1kYPzLhtwg1hPhtMgfunsdcI7h1b4X1SIk6L0c3dXyv+1S0o9hp9WL1jZCCQYFhaGXSMlaStPxo/Z/XI4j26+ZsS9vluBNoFJjUbsCEVvNXqEdMxgRrI6aSbm0neiRWb1suDmJcSpMUwVh8EP0B/lGJC8t53axMUuAYptL7luPPWn4r9Wvb0RGo/OhoTIYC9kVUkX2ZTas7at/W+BQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d27bbaf9-a164-4bfb-c3e6-08df1af3e022
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:58:05.0945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIZQvyzjnh2zuFG25vbCQq/rHPWiQZ7OkSdJttY6MAf+Rfp3W0ibBY0KPnQN8g3EUdQtzMnAyc6Lams5H4xejoRIWUb3o78HbqvDFEpVf98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

Add gputop/utils.c, gputop/xe_gputop.c, and gputop/i915_gputop.c to
the gputop executable sources. Pull in the required dependencies:
lib_igt (for xe_query), lib_igt_perf, lib_igt_device_scan, and glib.
Also add include_directories('gputop') so gputop.c can include the
backend headers directly.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 68c31da92..029668b90 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -147,10 +147,17 @@ if libudev.found()
 		   install : true)
 endif
 
-executable('gputop', 'gputop.c',
+executable('gputop',
+           ['gputop.c',
+            'gputop/utils.c',
+            'gputop/xe_gputop.c',
+            'gputop/i915_gputop.c'],
            install : true,
            install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
+           include_directories : [include_directories('gputop')],
+           dependencies : [lib_igt,lib_igt_perf,lib_igt_device_scan,
+                           lib_igt_drm_clients,lib_igt_drm_fdinfo,
+                           lib_igt_profiling,glib,math])
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-- 
2.55.0


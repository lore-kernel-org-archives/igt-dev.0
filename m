Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39301606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h4/uud11
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CF010E608;
	Wed, 28 Oct 2026 13:37:21 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013004.outbound.protection.outlook.com
 [40.107.201.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10B110FCA5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 13:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzSrPFNxlDb7CQ1XhpP6nz1PLF3q2elIhZS7uGYihTilWP+x5dD+E9FjYw7bJ/RsDK+8g6TUrVg7YwHHFrsyjY7r/fBa8V2tydn/DVuiOyxPKGiWeTN3c3lMq9YiDIo0tVAQYK3UxshCH5x1+FMd7px8KYu4TkgU9v8k5Nfu5/9OYO8oHHTQ6meOXEjgRqf+ogyD7/zLHF1yG1Hgdyo5AJDmc/oJpKITM1oAZnMIIu4pcubzBgyXFS7yTfJ8TYZt9zJSsOmtEhum3OmuSF03fKt2grDhDnr2Ho8J41u1q7y5wPiDL1xBrJJ6kHhBFr5mLwIDlEU/KYtgQegjN06RjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKdkPt2knpfQKaau07Z9TpgBPgpkdid0rpzQ/kAZoSk=;
 b=nPYGAGkJMUK9/Hm2V7AtWsQDsyXqv+cOKKOJZm33v/oJ1ltJC8Aj88ZhYsdlNTuE0joTa4PwcEnMiQUQdcj6affNQZXBjh4L2xIG3QWfj5EDVB3gqqB6UwIomGv7k5cM1dzhB2FotbroHCL4e7umskFLduORWAZbQCcbH45/9BtO3XTUCGdkTQtuWtImukendqYieALSmz1CQvMsyaovC4l/lb9olPl4fznrvUXz4jha2hLoP08NHx4JCshmgUB54RUcC38FloJtqOm+N0Vch6L2+VD+mHiVOwHUhv6zfBr1ftofSMNnmOnblJTZR8agc3PrRrl935BvqGRKpIq/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKdkPt2knpfQKaau07Z9TpgBPgpkdid0rpzQ/kAZoSk=;
 b=h4/uud11b6XQcmsehIP/2HUXqnFT4aI5XrpFSoscR9Qg9EvfIjx6HNR4DhK2zcugx3PINHyJUoV8FyhSeLWhd2VRZsKOEdzbWtw1r2UmnGunCS++kcxlIyJVN1+maAyh6qo3fzhxxzbWaN6IpfuCIjQQtOdg/Im8Mid8xOfq/Es=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by IA0PR12MB8253.namprd12.prod.outlook.com
 (2603:10b6:208:402::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:36:09 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 13:36:08 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Shashank Sharma <shashank.sharma@amd.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Arvind Yadav <arvind.yadav@amd.com>, "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>, "Mohan Marimuthu, Yogesh"
 <Yogesh.Mohanmarimuthu@amd.com>
Subject: Re: [PATCH i-g-t 01/10] drm-uapi/amdgpu: Sync with upstream header
Thread-Topic: [PATCH i-g-t 01/10] drm-uapi/amdgpu: Sync with upstream header
Thread-Index: AQHdYv3jbUBRXcfX0k6YiRNvFfh0U7cS/E0q
Date: Wed, 28 Oct 2026 13:36:08 +0000
Message-ID: <CHAPR12MB999247A1AA7D5E0948A858C1C1EF6F2@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
 <20261023145032.22650-2-tvrtko.ursulin@igalia.com>
In-Reply-To: <20261023145032.22650-2-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-28T13:36:08.430Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|IA0PR12MB8253:EE_
x-ms-office365-filtering-correlation-id: c42311fa-5aed-4b6b-295f-08df34f86c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|261026140227099003|3023799007|18002099003|56012099006|22082099003|261026121527099003|38070700021|4143699003|11063799006;
x-microsoft-antispam-message-info: G84MvV4fhnUQBhvGuTAPGJuhngQRAtjN96OhWU0LnK9VnFlx0DvxoJp2wMi1+S3SpkRGtYZ9l2GnljgS24OEIxEnUQ5Nlc3Wz2KcWSUDj5F9qzuG5e/H9YYNcRs9Zk4dw7czu6RXdz0OIIjG3Hgfy1ohulOih4DrhajP/zsqt1a/aTx2ePixa5G6Aq7RJqePYOQdat8mNdMpAMsqf2ewjQNYvLPT/hWvDXtIH6RJ8NdEw3T+UXP3ActtyOkwXqB10ob8lLvdCSaDMlrg/9MPJ8iPFvKdbVmoLhcQ80R0zhgkJibdqeOMR6ISo5QinC9H2kPJPYCXPSxZlxuyMTT1h4+wul92GbjMXIbkvXeCaol5p8pHDZRG/xaY9UQgrrCqkIWn+K7Vwdho/U3EQFKsmZyk8rpoT+/cyP2m5K37WzDCid/DfJNscBMnpG7+pAfp7iZJ9vR2+7GvibE1nbsPDLqlalVw5iiq6E+rlodLJXQ+Jg8xlMQWfNsIIM+gihtCCd05TcFDaIoUkf6Q1Zn4OSotLcJjc7PiApG4OQCZYmkXp8/qvMhlXLMLCPIfZQuk6GGqMR24GulJ9hPuNAS/ZPeigKy5v8CF0BFsDHJhkFQ95tCU6XLkKpfB4UM9l81mbAYmZCM1IyKtk/OfbzQGsENLVUtSyTIosJHHdhj2569aJ8KsZroISRpt454zXg3cwEVIr0OCt9FQ0cIdpDWQfVRKyqSsQ3Dk1Qnbim6ylAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(261026140227099003)(3023799007)(18002099003)(56012099006)(22082099003)(261026121527099003)(38070700021)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ej9SX34VcKJ9YSdWOf5aSa7k0Fom794wKlIleNU9m3DSLIm0bdNs/f+FDoNa?=
 =?us-ascii?Q?mpGw+PRXNycrVgJE0qVRSHX2HhpykY28lEuH9iqznMOrQ2doG9aNt39VImWq?=
 =?us-ascii?Q?jwYnhiWRsLyCLShilEXKvmD+jtZCNAV0GRTCABOIYGc4nK2gcXCwcdFBxgwA?=
 =?us-ascii?Q?iqHWPZw4Mv0ZH9cDYd8sHBxYgopqM5niUh5LvbMKP3j6VcaOpA9sNm6uQkZz?=
 =?us-ascii?Q?6/YrMWMkfdx2GbZSqcXYg6Jnto/NQOeXC/xd2qLSGkoRGBdhC4NQr3DpJzE0?=
 =?us-ascii?Q?yXR4nNW4AINjE6aloZVN5QR8TDICBx1YUovJD74zG+mzEpLfsKD6/NXGmPHc?=
 =?us-ascii?Q?K19Cz2zPVCw9X0AEIIF6wa0Cw9kbF7y6yWvN0WWMkzcPjcqcm7pcz5t/HRUH?=
 =?us-ascii?Q?imT4faNrkJ1G40g7XOr4Iu8ip1N7J2gHw4Wq4Xg+mwx3MIv1sQTlvikb8iUK?=
 =?us-ascii?Q?VwWAeACdIG9RfjQBpLQN5hHig1UglSEheWIoqhHsvnhdyC6aH8Dq+Y4JsaHK?=
 =?us-ascii?Q?Q0kiCg6KI22uAFoScPblsyJahel33t2DttssAc8wGTWz02nltjHYEsNzfHEI?=
 =?us-ascii?Q?fdCEGRktHgdkO7VwcaTsNWullirnQ7d/Rnl13CWQuP8R0jTnpKJVzIX/4Ryh?=
 =?us-ascii?Q?I5vNzbf9n0wvrfxLa1cG/Iif0E4lGhYwXfARSMkkMz6ZNFM60La16di7uiLt?=
 =?us-ascii?Q?cGemT3vujmxnss+NaTdxug0pKMnwc2c6ak+KQs8nSNwfy2WeDQBAQSbouDaT?=
 =?us-ascii?Q?MUJAu+h1CH4ZbKp4RdM6K0QQyc8/cdQ4xqLQP5FxU+fm3LjhfTVE17FWYsec?=
 =?us-ascii?Q?1Bcfjx9syYsSzzc/5wLHYatZ3rn9t66adN+fKs2k7c8l5/xdddMA55H1M57L?=
 =?us-ascii?Q?NxiLLzpgeJhar8ZNjkPDCo/HZoXpluhnl22kmaZ1IXtuQLDTbZEOhB18YvJ4?=
 =?us-ascii?Q?PekK1FYXR6eieM4RVblF+tX+s3WgDg2tbLNsFrYqgXZD2s95FVOm9aW2W2vE?=
 =?us-ascii?Q?ABAYb3vQtiLbO6UblYyKVTvsF9Vu7RvNQRj/Ztq2CfxL21XcEHni7PK6f1MS?=
 =?us-ascii?Q?5i8KJ1UNfpzdzTOMaw89RPAzYMUG2jamu226jDk3b/rYQhsjJxBB9eNdmg8X?=
 =?us-ascii?Q?aQC2PrXp8omb4jaIEUkMZSTiopTi/JiWucZWJcSxIErXNsNo2BM3eC1CJPKe?=
 =?us-ascii?Q?1qoeUOzUJzrxLPZkx+nL5aU1PmT4aQjyvqArACJFFi2XU+6ds/KxaYI9e2Y5?=
 =?us-ascii?Q?QzLHRXj+xB6phoL48njG9dHISpi4xLbr4BKxH2iPY6HujAxdO9AeVa8Tgod9?=
 =?us-ascii?Q?qauiMvZl0Tx2nTPgha9M/GBlwhY5ruCIStIuIfuKMp/Y3AXChE+jCLzTpsSP?=
 =?us-ascii?Q?z6eZiCO+izFFJdvli7biYNAtVLZ5flE9YpqKbpMVBErlpl/rIt3aeO/DPD09?=
 =?us-ascii?Q?Xgckd9zw0TN6EL2mHm02g28ujCkQ5B+Kk7hQEqmy5rPlpceP7NyQAg7PXSjy?=
 =?us-ascii?Q?jR6if8VZfsQed8FcJM/+h8aShCP/v7mf6ZSDQBRwdjiO6Fgg8kXxnhqmpjYN?=
 =?us-ascii?Q?DKG9vqst+Q68imR+FQSyk/Y0/ykg0/cAyuZcWL1Cp33R9g5uf9a5044DgCjh?=
 =?us-ascii?Q?X/0GLHXHQmu2TKjsee7031YhsYxHZVYgN9mVAkPDjvRR+h7n7l8JIYBruPdL?=
 =?us-ascii?Q?m6zB5XYMrRQLyUW2RXLnEsYBEIvFrTRpN7hc6jWOJWdseNTY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42311fa-5aed-4b6b-295f-08df34f86c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 13:36:08.7263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lCNDdLWLe/mytDR7jOsn/XtS3HvdTqGn7mupOJnZp+K83Zo/KRxJS2euoXMzCQQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8253
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We should, uh, keep better tabs on this stuff.

Patch is
Reviewed-by: David Francis <David.Francis@amd.com>

________________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Sent: Friday, October 23, 2026 10:50 AM
To: igt-dev@lists.freedesktop.org
Cc: Francis, David; Tvrtko Ursulin; Shashank Sharma; Pelloux-Prayer, Pierre=
-Eric; Deucher, Alexander; Koenig, Christian; Arvind Yadav; Khatri, Sunil; =
Prosyak, Vitaly; Zhang, Jesse(Jie); Mohan Marimuthu, Yogesh
Subject: [PATCH i-g-t 01/10] drm-uapi/amdgpu: Sync with upstream header

Sync to kernel commit
13af55f71399 ("drm/amdgpu/userq: fix struct drm_amdgpu_info_device padding =
for 32bit compile")
.

Note this also includes resolving two upstream ordering mishaps:

1.
struct drm_amdgpu_info_hw_ip->num_userq_slots was actually upstreamed as
userq_num_slots so that needs to be atomically renamed.

2.
struct drm_amdgpu_info_uq_fw_areas is a much worse situation where it
landed to both libdrm and IGT, while the kernel landed it in compatible
layout but under the name of drm_amdgpu_info_uq_metadata. As shipping
libdrm now has public API operating under the wrong name we need to wrap
it inside a compatible structure and keep the name..

3.
Padding field inside struct drm_amdgpu_info_device was also recently
moved but I think that was has no functional impact on IGT.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Arvind Yadav <arvind.yadav@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Jesse.Zhang <Jesse.Zhang@amd.com>
Cc: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 include/drm-uapi/amdgpu_drm.h       | 164 ++++++++++++++++++++++------
 lib/amdgpu/amd_command_submission.c |  20 ++--
 lib/amdgpu/amd_compute.c            |   4 +-
 lib/amdgpu/amd_deadlock_helpers.c   |   4 +-
 lib/amdgpu/amd_ip_blocks.h          |  14 +++
 5 files changed, 159 insertions(+), 47 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 321f374d4b9a..42a5fa8ad6b0 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -57,6 +57,8 @@ extern "C" {
 #define DRM_AMDGPU_USERQ               0x16
 #define DRM_AMDGPU_USERQ_SIGNAL                0x17
 #define DRM_AMDGPU_USERQ_WAIT          0x18
+#define DRM_AMDGPU_GEM_LIST_HANDLES    0x19
+#define DRM_AMDGPU_PROC_OPTIONS                0x1A

 #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +79,8 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ         DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES DRM_IOWR(DRM_COMMAND_BASE + DRM_=
AMDGPU_GEM_LIST_HANDLES, struct drm_amdgpu_gem_list_handles)
+#define DRM_IOCTL_AMDGPU_PROC_OPTIONS  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_PROC_OPTIONS, struct drm_amdgpu_proc_options)

 /**
  * DOC: memory domains
@@ -116,7 +120,7 @@ extern "C" {
                                         AMDGPU_GEM_DOMAIN_VRAM | \
                                         AMDGPU_GEM_DOMAIN_GDS | \
                                         AMDGPU_GEM_DOMAIN_GWS | \
-                                        AMDGPU_GEM_DOMAIN_OA | \
+                                        AMDGPU_GEM_DOMAIN_OA | \
                                         AMDGPU_GEM_DOMAIN_DOORBELL)

 /* Flag that CPU access will be required for the case of VRAM domain */
@@ -330,6 +334,7 @@ union drm_amdgpu_ctx {
 #define AMDGPU_USERQ_OP_FREE   2

 /* queue priority levels */
+/* low < normal low < normal high < high */
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
@@ -365,6 +370,9 @@ struct drm_amdgpu_userq_in {
         * and doorbell_offset in the doorbell bo.
         */
        __u32   doorbell_offset;
+       /**
+        * @flags: flags used for queue parameters
+        */
        __u32 flags;
        /**
         * @queue_va: Virtual address of the GPU memory which holds the que=
ue
@@ -473,7 +481,9 @@ struct drm_amdgpu_userq_signal {
         * @num_syncobj_handles: A count that represents the number of sync=
obj handles in
         * @syncobj_handles.
         */
-       __u64   num_syncobj_handles;
+       __u16   num_syncobj_handles;
+       __u16   pad0;
+       __u32   pad1;
        /**
         * @bo_read_handles: The list of BO handles that the submitted user=
 queue job
         * is using for read only. This will update BO fences in the kernel=
.
@@ -557,7 +567,8 @@ struct drm_amdgpu_userq_wait {
         * @num_syncobj_handles: A count that represents the number of sync=
obj handles in
         * @syncobj_handles.
         */
-       __u32   num_syncobj_handles;
+       __u16   num_syncobj_handles;
+       __u16   pad0;
        /**
         * @num_bo_read_handles: A count that represents the number of read=
 BO handles in
         * @bo_read_handles.
@@ -667,13 +678,20 @@ struct drm_amdgpu_gem_userptr {
 /* GFX12 and later: */
 #define AMDGPU_TILING_GFX12_SWIZZLE_MODE_SHIFT                 0
 #define AMDGPU_TILING_GFX12_SWIZZLE_MODE_MASK                  0x7
-/* These are DCC recompression setting for memory management: */
+/* These are DCC recompression settings for memory management: */
 #define AMDGPU_TILING_GFX12_DCC_MAX_COMPRESSED_BLOCK_SHIFT     3
 #define AMDGPU_TILING_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK      0x3 /* 0:64=
B, 1:128B, 2:256B */
 #define AMDGPU_TILING_GFX12_DCC_NUMBER_TYPE_SHIFT              5
 #define AMDGPU_TILING_GFX12_DCC_NUMBER_TYPE_MASK               0x7 /* CB_C=
OLOR0_INFO.NUMBER_TYPE */
 #define AMDGPU_TILING_GFX12_DCC_DATA_FORMAT_SHIFT              8
 #define AMDGPU_TILING_GFX12_DCC_DATA_FORMAT_MASK               0x3f /* [0:=
4]:CB_COLOR0_INFO.FORMAT, [5]:MM */
+/* When clearing the buffer or moving it from VRAM to GTT, don't compress =
and set DCC metadata
+ * to uncompressed. Set when parts of an allocation bypass DCC and read ra=
w data. */
+#define AMDGPU_TILING_GFX12_DCC_WRITE_COMPRESS_DISABLE_SHIFT   14
+#define AMDGPU_TILING_GFX12_DCC_WRITE_COMPRESS_DISABLE_MASK    0x1
+/* bit gap */
+#define AMDGPU_TILING_GFX12_SCANOUT_SHIFT                      63
+#define AMDGPU_TILING_GFX12_SCANOUT_MASK                       0x1

 /* Set/Get helpers for tiling flags. */
 #define AMDGPU_TILING_SET(field, value) \
@@ -789,6 +807,21 @@ union drm_amdgpu_wait_fences {

 #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO      0
 #define AMDGPU_GEM_OP_SET_PLACEMENT            1
+#define AMDGPU_GEM_OP_GET_MAPPING_INFO         2
+
+struct drm_amdgpu_gem_vm_entry {
+       /* Start of mapping (in bytes) */
+       __u64 addr;
+
+       /* Size of mapping (in bytes) */
+       __u64 size;
+
+       /* Mapping offset */
+       __u64 offset;
+
+       /* flags needed to recreate mapping */
+       __u64 flags;
+};

 /* Sets or returns a value associated with a buffer. */
 struct drm_amdgpu_gem_op {
@@ -796,8 +829,44 @@ struct drm_amdgpu_gem_op {
        __u32   handle;
        /** AMDGPU_GEM_OP_* */
        __u32   op;
-       /** Input or return value */
+       /** Input or return value. For MAPPING_INFO op: pointer to array of=
 struct drm_amdgpu_gem_vm_entry */
        __u64   value;
+       /** For MAPPING_INFO op: number of mappings (in/out) */
+       __u32   num_entries;
+
+       __u32   padding;
+};
+
+#define AMDGPU_GEM_LIST_HANDLES_FLAG_IS_IMPORT (1 << 0)
+
+struct drm_amdgpu_gem_list_handles {
+       /* User pointer to array of drm_amdgpu_gem_bo_info_entry */
+       __u64   entries;
+
+       /* Size of entries buffer / Number of handles in process (if larger=
 than size of buffer, must retry) */
+       __u32   num_entries;
+
+       __u32 padding;
+};
+
+struct drm_amdgpu_gem_list_handles_entry {
+       /* gem handle of buffer object */
+       __u32 gem_handle;
+
+       /* Currently just one flag: IS_IMPORT */
+       __u32 flags;
+
+       /* Size of bo */
+       __u64 size;
+
+       /* Preferred domains for GEM_CREATE */
+       __u64 preferred_domains;
+
+       /* GEM_CREATE flags for re-creation of buffer */
+       __u64 alloc_flags;
+
+       /* physical start_addr alignment in bytes for some HW requirements =
*/
+       __u64 alignment;
 };

 #define AMDGPU_VA_OP_MAP                       1
@@ -815,7 +884,7 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_PAGE_WRITEABLE       (1 << 2)
 /* executable mapping, new for VI */
 #define AMDGPU_VM_PAGE_EXECUTABLE      (1 << 3)
-/* partially resident texture */
+/* unmapped page of partially resident textures */
 #define AMDGPU_VM_PAGE_PRT             (1 << 4)
 /* MTYPE flags use bit 5 to 8 */
 #define AMDGPU_VM_MTYPE_MASK           (0xf << 5)
@@ -1020,10 +1089,21 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
  *  Query h/w info: Flag that this is integrated (a.h.a. fusion) GPU
  *
  */
-#define AMDGPU_IDS_FLAGS_FUSION         0x1
-#define AMDGPU_IDS_FLAGS_PREEMPTION     0x2
-#define AMDGPU_IDS_FLAGS_TMZ            0x4
-#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD 0x8
+#define AMDGPU_IDS_FLAGS_FUSION                        0x01
+#define AMDGPU_IDS_FLAGS_PREEMPTION            0x02
+#define AMDGPU_IDS_FLAGS_TMZ                   0x04
+#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD        0x08
+#define AMDGPU_IDS_FLAGS_GANG_SUBMIT           0x10
+
+/*
+ *  Query h/w info: Flag identifying VF/PF/PT mode
+ *
+ */
+#define AMDGPU_IDS_FLAGS_MODE_MASK      0x300
+#define AMDGPU_IDS_FLAGS_MODE_SHIFT     0x8
+#define AMDGPU_IDS_FLAGS_MODE_PF        0x0
+#define AMDGPU_IDS_FLAGS_MODE_VF        0x1
+#define AMDGPU_IDS_FLAGS_MODE_PT        0x2

 /* indicate if acceleration can be working */
 #define AMDGPU_INFO_ACCEL_WORKING              0x00
@@ -1347,6 +1427,8 @@ struct drm_amdgpu_info_vbios {
 #define AMDGPU_VRAM_TYPE_DDR5  10
 #define AMDGPU_VRAM_TYPE_LPDDR4 11
 #define AMDGPU_VRAM_TYPE_LPDDR5 12
+#define AMDGPU_VRAM_TYPE_HBM3E 13
+#define AMDGPU_VRAM_TYPE_HBM4 14

 struct drm_amdgpu_info_device {
        /** PCI Device ID */
@@ -1430,6 +1512,7 @@ struct drm_amdgpu_info_device {
        __u64 high_va_max;
        /* gfx10 pa_sc_tile_steering_override */
        __u32 pa_sc_tile_steering_override;
+       __u32 pad;
        /* disabled TCCs */
        __u64 tcc_disabled_mask;
        __u64 min_engine_clock;
@@ -1454,7 +1537,6 @@ struct drm_amdgpu_info_device {
        __u32 csa_alignment;
        /* Userq IP mask (1 << AMDGPU_HW_IP_*) */
        __u32 userq_ip_mask;
-       __u32 pad;
 };

 struct drm_amdgpu_info_hw_ip {
@@ -1471,28 +1553,8 @@ struct drm_amdgpu_info_hw_ip {
        __u32  available_rings;
        /** version info: bits 23:16 major, 15:8 minor, 7:0 revision */
        __u32  ip_discovery_version;
-       __u32  num_userq_slots;
-};
-
-/* GFX metadata BO sizes and alignment info (in bytes) */
-struct drm_amdgpu_info_uq_fw_areas_gfx {
-       /* shadow area size */
-       __u32 shadow_size;
-       /* shadow area base virtual mem alignment */
-       __u32 shadow_alignment;
-       /* context save area size */
-       __u32 csa_size;
-       /* context save area base virtual mem alignment */
-       __u32 csa_alignment;
-};
-
-/* IP specific fw related information used in the
- * subquery AMDGPU_INFO_UQ_FW_AREAS
- */
-struct drm_amdgpu_info_uq_fw_areas {
-       union {
-               struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
-       };
+       /* Userq available slots */
+       __u32  userq_num_slots;
 };

 struct drm_amdgpu_info_num_handles {
@@ -1569,9 +1631,25 @@ struct drm_amdgpu_info_uq_metadata_gfx {
        __u32 csa_alignment;
 };

+struct drm_amdgpu_info_uq_metadata_compute {
+       /* EOP size for gfx11 */
+       __u32 eop_size;
+       /* EOP base virtual alignment for gfx11 */
+       __u32 eop_alignment;
+};
+
+struct drm_amdgpu_info_uq_metadata_sdma {
+       /* context save area size for sdma6 */
+       __u32 csa_size;
+       /* context save area base virtual alignment for sdma6 */
+       __u32 csa_alignment;
+};
+
 struct drm_amdgpu_info_uq_metadata {
        union {
                struct drm_amdgpu_info_uq_metadata_gfx gfx;
+               struct drm_amdgpu_info_uq_metadata_compute compute;
+               struct drm_amdgpu_info_uq_metadata_sdma sdma;
        };
 };

@@ -1594,8 +1672,28 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_10_3_6                        149 /* GC 10.3.6 */
 #define AMDGPU_FAMILY_GC_10_3_7                        151 /* GC 10.3.7 */
 #define AMDGPU_FAMILY_GC_11_5_0                        150 /* GC 11.5.0 */
+#define AMDGPU_FAMILY_GC_11_5_4                        154 /* GC 11.5.4 */
 #define AMDGPU_FAMILY_GC_12_0_0                        152 /* GC 12.0.0 */

+/*
+ * Definition of user options
+ *
+ * option: AMDGPU_PROC_OPTIONS_OP_KFD_SIGBUS_DELAY
+ *    0:          Disable sigbus delay - SIGBUS will be raised immediately
+ *    0xFFFFFFFF: SIGBUS will not be raised
+ *    other:      Set the sigbus delay in milliseconds
+ */
+#define AMDGPU_PROC_OPTIONS_OP_KFD_SIGBUS_DELAY                0
+
+#define AMDGPU_PROC_OPTIONS_KFD_SIGBUS_DELAY_DISABLED  0xFFFFFFFFu
+
+struct drm_amdgpu_proc_options {
+       __u32 op;
+       struct {
+               __u32 value;
+       } kfd_sigbus_delay;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_s=
ubmission.c
index c7b36970e192..f7101015efe6 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -182,8 +182,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handl=
e device,
        amdgpu_dma_limits_query(device, &limits);

        if (user_queue)
-               available_rings =3D hw_ip_info.num_userq_slots ?
-                       ((1 << hw_ip_info.num_userq_slots) - 1) : 1;
+               available_rings =3D hw_ip_info.userq_num_slots ?
+                       ((1 << hw_ip_info.userq_num_slots) - 1) : 1;
        else
                available_rings =3D hw_ip_info.available_rings;

@@ -409,8 +409,8 @@ void amdgpu_command_submission_write_linear_helper(amdg=
pu_device_handle device,
        igt_assert_eq(r, 0);

        if (user_queue)
-               available_rings =3D ring_context->hw_ip_info.num_userq_slot=
s ?
-                       ((1 << ring_context->hw_ip_info.num_userq_slots) -1=
) : 1;
+               available_rings =3D ring_context->hw_ip_info.userq_num_slot=
s ?
+                       ((1 << ring_context->hw_ip_info.userq_num_slots) -1=
) : 1;
        else
                available_rings =3D ring_context->hw_ip_info.available_ring=
s;

@@ -545,8 +545,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu=
_device_handle device,
        igt_assert_eq(r, 0);

        if (user_queue)
-               available_rings =3D ring_context->hw_ip_info.num_userq_slot=
s ?
-                       ((1 << ring_context->hw_ip_info.num_userq_slots) -1=
) : 1;
+               available_rings =3D ring_context->hw_ip_info.userq_num_slot=
s ?
+                       ((1 << ring_context->hw_ip_info.userq_num_slots) -1=
) : 1;
        else
                available_rings =3D ring_context->hw_ip_info.available_ring=
s;

@@ -656,8 +656,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgp=
u_device_handle device,
        igt_assert_eq(r, 0);

        if (user_queue)
-               available_rings =3D ring_context->hw_ip_info.num_userq_slot=
s ?
-                       ((1 << ring_context->hw_ip_info.num_userq_slots) -1=
) : 1;
+               available_rings =3D ring_context->hw_ip_info.userq_num_slot=
s ?
+                       ((1 << ring_context->hw_ip_info.userq_num_slots) -1=
) : 1;
        else
                available_rings =3D ring_context->hw_ip_info.available_ring=
s;

@@ -1466,7 +1466,7 @@ bool cmd_ring_available(amdgpu_device_handle device,

        if (user_queue) {
                /* For user queues, check user queue slots */
-               uint32_t userq_slots =3D hw_ip_info.num_userq_slots;
+               uint32_t userq_slots =3D hw_ip_info.userq_num_slots;

                return (ring_id < userq_slots);
        } else {
@@ -1490,7 +1490,7 @@ uint32_t cmd_get_available_rings(amdgpu_device_handle=
 device,
                return 0;

        if (user_queue) {
-               return hw_ip_info.num_userq_slots;
+               return hw_ip_info.userq_num_slots;
        } else {
                return __builtin_popcountll(hw_ip_info.available_rings);
        }
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 1f618d5a9509..ec230f5873a7 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -58,8 +58,8 @@ void amdgpu_command_submission_nop(amdgpu_device_handle d=
evice, enum amd_ip_bloc
        igt_assert_eq(r, 0);

        if (user_queue)
-               available_rings =3D ring_context->hw_ip_info.num_userq_slot=
s ?
-                       ((1 << ring_context->hw_ip_info.num_userq_slots) -1=
) : 1;
+               available_rings =3D ring_context->hw_ip_info.userq_num_slot=
s ?
+                       ((1 << ring_context->hw_ip_info.userq_num_slots) -1=
) : 1;
        else
                available_rings =3D ring_context->hw_ip_info.available_ring=
s;

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_he=
lpers.c
index 4d3b34003b2b..470f16567e90 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -920,8 +920,8 @@ void bad_access_ring_helper(amdgpu_device_handle device=
_handle, unsigned int cmd
        igt_assert_eq(r, 0);

        if (user_queue)
-               available_rings =3D info.num_userq_slots ?
-                       ((1 << info.num_userq_slots) -1) : 1;
+               available_rings =3D info.userq_num_slots ?
+                       ((1 << info.userq_num_slots) -1) : 1;
        else
                available_rings =3D info.available_rings;

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 3c694ddc56b1..1dfa4faa9e4c 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -275,6 +275,20 @@ amdgpu_dma_default_bytes(const struct amdgpu_dma_limit=
s *lim,
        }
 }

+/*
+ * Workaround a process failed where drm_amdgpu_info_uq_fw_areas landed to
+ * IGT and libdrm before landing to kernel. When it landed to kernel it go=
t
+ * renamed to struct drm_amdgpu_info_uq_metadata but now shipping libdrm
+ * has API working with the stale name..
+ */
+struct drm_amdgpu_info_uq_fw_areas {
+       union {
+               struct drm_amdgpu_info_uq_metadata_gfx gfx;
+               struct drm_amdgpu_info_uq_metadata_compute compute;
+               struct drm_amdgpu_info_uq_metadata_sdma sdma;
+       };
+};
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {

--
2.56.0


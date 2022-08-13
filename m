Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A027BCA46
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Aug 2022 15:08:23 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M4kSk5xrnzDqNp
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Aug 2022 15:08:22 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Sat, 13 Aug 2022 12:07:50 -0300
Message-Id: <20220813150750.216610-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu/amd_bypass: skip if connector
 is not DisplayPort
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: magalilemes00@gmail.com, tales.aparecida@gmail.com,
 Alexander Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[why & how]
It is not possible to access the DSC_CLOCK_EN for non-DP connectors.
Moreover, the kernel fails when asked to set the CRC source to DPRX on
non-DP connectors. Therefore, skip the test if the connector is not
a DisplayPort or eDP connector.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 tests/amdgpu/amd_bypass.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 5ec90884..e5bfcaa2 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -316,6 +316,13 @@ static void bypass_8bpc_test(data_t *data)
 
 	test_init(data);
 
+	/*
+	 * CRC source cannot be selected without an DP/eDP connector
+	 */
+	igt_skip_on_f(data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
+			data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP,
+			"no DisplayPort connector found\n");
+
 	/**
 	 * 8bpc bypass only makes sense without DSC.
 	 * DSC is visually lossless but actually still loss exists and any bypass mode
-- 
2.37.1

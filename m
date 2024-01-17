Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B4CC47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 11:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1388A10E795;
	Thu, 18 Jan 2024 11:36:57 +0000 (UTC)
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jan 2024 09:07:50 UTC
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05F1B10E356
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 09:07:49 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axz+vSlqdliRsBAA--.5283S3;
 Wed, 17 Jan 2024 16:58:58 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx7c7FlqdloDEGAA--.31706S2; 
 Wed, 17 Jan 2024 16:58:56 +0800 (CST)
From: Min Zhou <zhoumin@loongson.cn>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] gen_opencl_kernel: Fix code generation
Date: Wed, 17 Jan 2024 16:42:51 +0800
Message-Id: <20240117084251.857237-1-zhoumin@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx7c7FlqdloDEGAA--.31706S2
X-CM-SenderInfo: 52kr3ztlq6z05rqj20fqof0/1tbiAQATAWWmPl8LPwAgsl
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
X-Mailman-Approved-At: Thu, 18 Jan 2024 11:36:56 +0000
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
Cc: zhoumin@loongson.cn
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Since commit 1e0900fdb939 ("lib/intel_compute: Migrate xe_compute
library to intel_compute") had changed the `struct xe_compute_kernels`
to `struct intel_compute_kernels`, we should update it in the
./opencl/gen_opencl_kernel script.

Signed-off-by: Min Zhou <zhoumin@loongson.cn>
---
 opencl/gen_opencl_kernel | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/opencl/gen_opencl_kernel b/opencl/gen_opencl_kernel
index e6f9601e0..15c6313d9 100755
--- a/opencl/gen_opencl_kernel
+++ b/opencl/gen_opencl_kernel
@@ -84,7 +84,7 @@ INCLUDES
 
 cat $out_files >>$output_fname
 
-echo "const struct xe_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
+echo "const struct intel_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
 
 for i in "${args[@]}"; do
         out="$dest_dir/${i}_${kernel_name}.h"
-- 
2.39.3


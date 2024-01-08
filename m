Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] [PATCH i-g-t v2] tests/amdgpu/amd_vm: fix vm test issue
Date: Mon, 8 Jan 2024 09:21:57 +0800
Message-ID: <20240108012157.3781758-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>
Message-ID: <20240108012157.QpOst2ly4OzhEGUTBVT27lJvAHvoajl6Ky2tMmET89c@z>

Initialize the variable "r" before using it,
in the subtest amdgpu-vm-unaligned-map.
V2:
  --fix code style and description (Kamil and Christian).

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 tests/amdgpu/amd_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index dab91f291..9cd56e2b5 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -127,7 +127,8 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
 	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
 	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
 
-	if (-ENOMEM == amdgpu_bo_alloc(device_handle, &request, &buf_handle)) {
+	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
+	if (r == -ENOMEM) {
 		/* Try allocate on the device of small memory */
 		request.alloc_size = 8ULL << 20;
 		map_size = (8ULL << 20) - (2 << 12);
-- 
2.25.1

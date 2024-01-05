Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu:fix vm test issue
Date: Fri, 5 Jan 2024 13:18:28 +0800
Message-ID: <20240105051828.3679085-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Message-ID: <20240105051828.5j8BK8Pb_jYZnYUttH-NvISFxGPtCUrqj-uJ0ycFq8U@z>

Initialize the variable "r" before using it.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index dab91f291..bb7b6f173 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -127,7 +127,8 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
 	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
 	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
 
-	if (-ENOMEM == amdgpu_bo_alloc(device_handle, &request, &buf_handle)) {
+	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
+	if (-ENOMEM == r) {
 		/* Try allocate on the device of small memory */
 		request.alloc_size = 8ULL << 20;
 		map_size = (8ULL << 20) - (2 << 12);
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0618410E384
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 14:41:27 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Dec 2023 20:06:20 +0530
Message-Id: <20231205143622.4704-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] RFC: drm-uapi/xe: add exec_queue_id member to
 drm_xe_wait_user_fence structure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

remove the num_engines/instances members from drm_xe_wait_user_fence structure
and add a exec_queue_id member

This test to excess behaviour when exec_queue reset happen

about test
Skipping the GPU mapping(vm_bind) for object, so that exec_queue
reset will happen and xe_wait_ufence will end return EIO not ETIME

I am able to see exec_queue reset was happened and xe_wait_user_fence_ioctl   returned EIO

test result
root@DUT7075PVC:/home/gta# LD_LIBRARY_PATH=/home/gta/ ./xe_waitfence --r invalid-exec_queue-wait
IGT-Version: 1.28-g3c0162fc4 (x86_64) (Linux: 6.6.0-rc3-xe x86_64)
Opened device: /dev/dri/card0
Starting subtest: invalid-exec_queue-wait
Subtest invalid-exec_queue-wait: SUCCESS (0.993s)

dmesg logs
[  807.680378] [IGT] xe_waitfence: executing
[  807.699796] [drm:drm_stub_open [drm]]
[  807.704536] xe 0000:51:00.0: [drm:drm_open_helper [drm]] comm="xe_waitfence", pid=2952, minor=0
[  807.715155] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  807.727328] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  807.739580] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.751518] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.763550] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.775525] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.787556] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.799494] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.811531] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.823476] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.835577] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  807.847921] [IGT] xe_waitfence: starting subtest invalid-exec_queue-wait
[  807.855528] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_VM_CREATE
[  807.891346] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying GT save-restore MMIOs
[  807.901602] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x9424] = 0x7ffffffc
-----------------
-----------------
[  808.560967] xe REG[0x4500-0x45ff]: deny rw access
[  808.566292] xe REG[0x1e3a8-0x1e3af]: allow read access
[  808.572161] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying ccs3 save-restore MMIOs
[  808.582462] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x260c4] = 0x3f7e0104
[  808.592096] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting ccs3 registers
[  808.601962] xe REG[0x4400-0x45ff]: deny rw access
[  808.607281] xe REG[0x4500-0x45ff]: deny rw access
[  808.612608] xe REG[0x263a8-0x263af]: allow read access
[  808.618477] xe 0000:51:00.0: [drm] GT0: resumed
[  808.626283] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_EXEC_QUEUE_CREATE
[  808.638765] krishna xe_exec_queue_create_ioctl
[  808.645592] krishna args->exec_queue_id = 1
[  808.650328] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_GEM_CREATE
[  808.662621] xe 0000:51:00.0: [drm:xe_migrate_clear [xe]] Pass 0, size: 262144
[  808.672889] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_GEM_MMAP_OFFSET
[  808.685733] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_EXEC
[  808.696900] krishna args->exec_queue_id = 1
[  808.702700] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_WAIT_USER_FENCE
[  808.704620] xe 0000:51:00.0: [drm:pf_queue_work_func [xe]]
                ASID: 1048575
                VFID: 0
                PDATA: 0x00a3
                Faulted Address: 0x00000000001a0000
                FaultType: 0
                AccessType: 0
                FaultLevel: 4
                EngineClass: 3
                EngineInstance: 0
[  808.750685] xe 0000:51:00.0: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
[  808.760519] xe 0000:51:00.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] Engine memory cat error: guc_id=2
[  808.773237] xe 0000:51:00.0: [drm] exec gueue reset detected
[  808.773965] xe 0000:51:00.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x8
[  808.779632] xe 0000:51:00.0: [drm:xe_wait_user_fence_ioctl [xe]] Ioctl argument check failed at drivers/gpu/drm/xe/xe_wait_user_fence.c:174: err < 0
[  808.789655] xe 0000:51:00.0: [drm] Xe device coredump has been created
[  808.803796] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence", pid=2952, ret=-5
[  808.811133] xe 0000:51:00.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
[  808.811220] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_EXEC_QUEUE_DESTROY
[  808.823605] xe 0000:51:00.0: [drm] Engine reset: guc_id=2
[  808.829862] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[  808.843312] xe 0000:51:00.0: [drm:guc_exec_queue_timedout_job [xe]] Timedout signaled job: seqno=4294967169, guc_id=2, flags=0x9
[  808.848707] [IGT] xe_waitfence: finished subtest invalid-exec_queue-wait, SUCCESS
[  808.882255] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  808.894404] xe 0000:51:00.0: [drm:drm_file_free.part.0 [drm]] comm="xe_waitfence", pid=2952, dev=0xe200, open_count=1
[  808.907374] xe 0000:51:00.0: [drm:drm_lastclose [drm]]
[  808.913594] xe 0000:51:00.0: [drm:drm_lastclose [drm]] driver lastclose completed
[  808.922416] [IGT] xe_waitfence: exiting, ret=0


Need to modify below tests as per uapi changes, with current patch below tests will fail
xe_exec_balancer.c
xe_exec_compute_mode.c
xe_exec_fault_mode.c
xe_exec_reset.c
xe_exec_threads.c
xe_waitfence.c


Bommu Krishnaiah (1):
  drm-uapi/xe: kill xe_wait_user_fence_ioctl  when exec_queue reset

Francois Dugast (1):
  drm-uapi/xe: Kill exec_queue_set_property

 include/drm-uapi/xe_drm.h  | 48 ++++++----------------
 tests/intel/xe_waitfence.c | 83 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 35 deletions(-)

-- 
2.25.1

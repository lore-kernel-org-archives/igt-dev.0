Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Feb 2020 11:15:13 -0000
Message-ID: <158288851352.7475.6325193241529905464@emeril.freedesktop.org>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/5=5D_i915=3A_Start_putting_the?=
 =?utf-8?q?_mmio=5Fbase_to_wider_use?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/5] i915: Start putting the mmio_base to wider use
URL   : https://patchwork.freedesktop.org/series/74073/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

sysfs_heartbeat_interval
sysfs_heartbeat_interval@idempotent
sysfs_heartbeat_interval@invalid
sysfs_heartbeat_interval@long
sysfs_heartbeat_interval@mixed
sysfs_heartbeat_interval@nopreempt
sysfs_heartbeat_interval@off
sysfs_heartbeat_interval@precise
sysfs_preempt_timeout
sysfs_preempt_timeout@idempotent
sysfs_preempt_timeout@invalid
sysfs_preempt_timeout@off
sysfs_preempt_timeout@timeout
sysfs_timeslice_duration
sysfs_timeslice_duration@duration
sysfs_timeslice_duration@idempotent
sysfs_timeslice_duration@invalid
sysfs_timeslice_duration@off
sysfs_timeslice_duration@timeout

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/113849 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/113849
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

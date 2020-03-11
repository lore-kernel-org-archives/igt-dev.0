Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 15:42:21 -0000
Message-ID: <158394134169.13949.7292350442392084634@emeril.freedesktop.org>
References: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/5=5D_lib/i915=3A_Create_a_cont?=
 =?utf-8?q?ext_wrapping_one_specific_engine?=
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

Series: series starting with [i-g-t,1/5] lib/i915: Create a context wrapping one specific engine
URL   : https://patchwork.freedesktop.org/series/74575/
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

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118604 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118604
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

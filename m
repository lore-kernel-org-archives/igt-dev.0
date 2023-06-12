Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Mon, 12 Jun 2023 18:38:00 -0000
Message-ID: <168659508016.26646.10556120916351599891@emeril.freedesktop.org>
References: <20230612172310.30117-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230612172310.30117-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib=3A_Make_igt=5Fwhile=5Finterruptible=28=29_thread-safe?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Make igt_while_interruptible() thread-safe
URL   : https://patchwork.freedesktop.org/series/119215/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/907045 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43624031):
      ],
      "Created": "2021-03-25T19:28:06.985111241Z",
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:46a290212d18d6f820439b9a479e0894356e5f5b3409e37adeb7cd0d480fc368"
      ]
  }
  Skipping, already built
  Getting image source signatures
  Copying blob sha256:46a290212d18d6f820439b9a479e0894356e5f5b3409e37adeb7cd0d480fc368
  time="2023-06-12T18:35:04Z" level=fatal msg="Error reading config blob sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078: Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  section_end:1686594906:step_script
  section_start:1686594906:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686594906:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/907045

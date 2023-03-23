Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2EE10E46D
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 07:55:46 +0000 (UTC)
Date: Thu, 23 Mar 2023 08:55:42 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230323085542.42887c3d@maurocar-mobl2>
In-Reply-To: <20230323084933.127664f7@maurocar-mobl2>
References: <20230322140030.1800192-1-mauro.chehab@linux.intel.com>
 <20230322140030.1800192-2-mauro.chehab@linux.intel.com>
 <20230322174446.75ie3nrckvetww3i@kamilkon-desk1>
 <20230323084933.127664f7@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] intel-ci: update blacklists to
 work with the Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 23 Mar 2023 08:50:25 +0100
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> On Wed, 22 Mar 2023 18:44:46 +0100
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > Hi Mauro,
> > 
> > On 2023-03-22 at 15:00:28 +0100, Mauro Carvalho Chehab wrote:
> > > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > 
> > > It doesn't make sense to run i915 tests with Xe driver and
> > > vice-versa. Update testlists to make it clear.
> > > 
> > > In order to avoid disrupts at exiting intel-ci tests, keep a
> > > symlink:
> > > 	i915-blacklist.txt -> blacklist.txt
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > ---
> > >  tests/intel-ci/blacklist.txt      | 130 +----------------------------
> > >  tests/intel-ci/i915-blacklist.txt | 133 ++++++++++++++++++++++++++++++  
> > 
> > Why not just git mv oldfile newfile ?
> 
> I did that. Then, I created a link:
> 	ln -s blacklist.txt tests/intel-ci/i915-blacklist.txt 
> 
> The rationale is to avoid breaking any existing CI pipelines that would
> be expecting to find the i915 blacklist as "blacklist.txt.".
> 
> > But that aside, imho better solution would be to just
> > add xe_* to blacklist. 
> 
> That is what I did: once renamed: I added "igt@xe_.*" to the blacklist
> file.
> 
> Unfortunately, git diff output is weird when there is a rename and
> a symlink to the same name at the same patch. If you prefer, I can
> split it on two patches to make easier to view the differences.
> 
> > I am also not sure you can include
> > one blacklist into another.
> 
> There's no such thing. Both blacklist files are independent. You
> probably got tricked by the weird output git produced with the rename
> + symlink at the same patch.

Btw, if I remove the symlink, the diff becomes nice and clean:

[PATCH] intel-ci: update blacklists to work with the Xe driver
    
It doesn't make sense to run i915 tests with Xe driver and
vice-versa. Update testlists to make it clear.
    
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/i915-blacklist.txt
similarity index 97%
rename from tests/intel-ci/blacklist.txt
rename to tests/intel-ci/i915-blacklist.txt
index 6e5cc43667cf..389a2acb7f44 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/i915-blacklist.txt
@@ -84,6 +84,10 @@ igt@kms_chamelium_frames@hdmi-.*-planes-random
 igt@vc4_.*
 igt@v3d_.*
 ###############################################
+# Intel Xe
+###############################################
+igt@xe/.*
+###############################################
 # AMD
 ###############################################
 igt@amdgpu/.*
diff --git a/tests/intel-ci/xe-blacklist.txt b/tests/intel-ci/xe-blacklist.txt
new file mode 100644
index 000000000000..986e91a67069
--- /dev/null
+++ b/tests/intel-ci/xe-blacklist.txt
@@ -0,0 +1,21 @@
+###############################################
+# Broadcom
+###############################################
+igt@vc4_.*
+igt@v3d_.*
+###############################################
+# Intel i915
+###############################################
+igt@i915/.*
+###############################################
+# AMD
+###############################################
+igt@amdgpu/.*
+###############################################
+# Panfrost
+###############################################
+igt@panfrost_.*
+###############################################
+# Qualcomm
+###############################################
+igt@msm_.*

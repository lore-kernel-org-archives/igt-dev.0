Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="------------20BUwU55FejfJJwIVrGt09iW"
Message-ID: <1b8f7073-0a0f-dc90-29b0-b7af76193c18@intel.com>
Date: Mon, 31 Oct 2022 13:41:54 +0100
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221031121730.32056-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20221031121730.32056-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/query: use 48B_ADDRESS in
 upload
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------20BUwU55FejfJJwIVrGt09iW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: |Nirmoy Das <nirmoy.das@intel.com>|

On 10/31/2022 1:17 PM, Matthew Auld wrote:
> Our working set could be larger than 4G here.
>
> Closes:https://gitlab.freedesktop.org/drm/intel/-/issues/6671
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   tests/i915/i915_query.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index 4e43c7cd..e725e04e 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -625,10 +625,14 @@ static void upload(int fd, struct igt_list_head *handles, uint32_t num_handles)
>   		      sizeof(struct drm_i915_gem_exec_object2));
>   
>   	i = 0;
> -	igt_list_for_each_entry(iter, handles, link)
> -		exec[i++].handle = iter->handle;
> +	igt_list_for_each_entry(iter, handles, link) {
> +		exec[i].handle = iter->handle;
> +		exec[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +		i++;
> +	}
>   
>   	exec[i].handle = batch_create_size(fd, 4096);
> +	exec[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>   
>   	execbuf.buffers_ptr = to_user_pointer(exec);
>   	execbuf.buffer_count = num_handles + 1;
--------------20BUwU55FejfJJwIVrGt09iW
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Reviewed-by: <code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff">Nirmoy Das
        <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></code></p>
    <div class="moz-cite-prefix">On 10/31/2022 1:17 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221031121730.32056-1-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Our working set could be larger than 4G here.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/intel/-/issues/6671">https://gitlab.freedesktop.org/drm/intel/-/issues/6671</a>
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 tests/i915/i915_query.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 4e43c7cd..e725e04e 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -625,10 +625,14 @@ static void upload(int fd, struct igt_list_head *handles, uint32_t num_handles)
 		      sizeof(struct drm_i915_gem_exec_object2));
 
 	i = 0;
-	igt_list_for_each_entry(iter, handles, link)
-		exec[i++].handle = iter-&gt;handle;
+	igt_list_for_each_entry(iter, handles, link) {
+		exec[i].handle = iter-&gt;handle;
+		exec[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		i++;
+	}
 
 	exec[i].handle = batch_create_size(fd, 4096);
+	exec[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	execbuf.buffers_ptr = to_user_pointer(exec);
 	execbuf.buffer_count = num_handles + 1;
</pre>
    </blockquote>
  </body>
</html>

--------------20BUwU55FejfJJwIVrGt09iW--
